package com.ticketmanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ticketmanagement.config.DBConfig;
import com.ticketmanagement.model.User;

public class UserDAO {

    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (first_name, last_name, email, mobile_number, password, role, failed_attempts, locked_until) "
                   + "VALUES (?, ?, ?, ?, ?, 'USER', 0, NULL)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getMobileNumber());
            ps.setString(5, user.getPassword());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public User loginUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapUser(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean isEmailExists(String email) {
        String sql = "SELECT email FROM users WHERE email = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean isEmailExistsForOtherUser(String email, int userId) {
        String sql = "SELECT email FROM users WHERE email = ? AND id <> ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setInt(2, userId);

            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean isAccountLocked(String email) {
        String sql = "SELECT locked_until FROM users WHERE email = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                java.sql.Timestamp lockedUntil = rs.getTimestamp("locked_until");

                if (lockedUntil == null) {
                    return false;
                }

                long currentTime = System.currentTimeMillis();
                long lockTime = lockedUntil.getTime();

                if (lockTime > currentTime) {
                    return true;
                } else {
                    resetFailedAttempts(email);
                    return false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public int increaseFailedAttempts(String email) {
        String updateSql = "UPDATE users SET failed_attempts = failed_attempts + 1 WHERE email = ?";
        String selectSql = "SELECT failed_attempts FROM users WHERE email = ?";

        try (Connection conn = DBConfig.getConnection()) {

            try (PreparedStatement updatePs = conn.prepareStatement(updateSql)) {
                updatePs.setString(1, email);
                updatePs.executeUpdate();
            }

            try (PreparedStatement selectPs = conn.prepareStatement(selectSql)) {
                selectPs.setString(1, email);

                ResultSet rs = selectPs.executeQuery();

                if (rs.next()) {
                    return rs.getInt("failed_attempts");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public boolean lockAccount(String email, int minutes) {
        String sql = "UPDATE users SET locked_until = DATE_ADD(NOW(), INTERVAL ? MINUTE) WHERE email = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, minutes);
            ps.setString(2, email);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean resetFailedAttempts(String email) {
        String sql = "UPDATE users SET failed_attempts = 0, locked_until = NULL WHERE email = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean updatePasswordByEmail(String email, String newPassword) {
        String sql = "UPDATE users SET password = ?, failed_attempts = 0, locked_until = NULL WHERE email = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newPassword);
            ps.setString(2, email);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public int countAllUsers() {
        String sql = "SELECT COUNT(*) FROM users";
        return getCount(sql);
    }

    public int countAdminUsers() {
        String sql = "SELECT COUNT(*) FROM users WHERE role = 'ADMIN'";
        return getCount(sql);
    }

    public int countNormalUsers() {
        String sql = "SELECT COUNT(*) FROM users WHERE role = 'USER'";
        return getCount(sql);
    }

    public int countLockedUsers() {
        String sql = "SELECT COUNT(*) FROM users WHERE locked_until IS NOT NULL AND locked_until > NOW()";
        return getCount(sql);
    }

    private int getCount(String sql) {
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public List<User> getRecentUsers() {
        List<User> users = new ArrayList<>();

        String sql = "SELECT * FROM users ORDER BY id DESC LIMIT 10";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                users.add(mapUser(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    /* =========================
       ADMIN CRUD METHODS
    ========================= */

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        String sql = "SELECT * FROM users ORDER BY id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                users.add(mapUser(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapUser(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean addUserByAdmin(User user) {
        String sql = "INSERT INTO users (first_name, last_name, email, mobile_number, password, role, failed_attempts, locked_until) "
                   + "VALUES (?, ?, ?, ?, ?, ?, 0, NULL)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getMobileNumber());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getRole());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean updateUserByAdmin(User user) {
        String sql = "UPDATE users SET first_name = ?, last_name = ?, email = ?, mobile_number = ?, password = ?, role = ? WHERE id = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getMobileNumber());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getRole());
            ps.setInt(7, user.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteUserByAdmin(int id) {
        String sql = "DELETE FROM users WHERE id = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean unlockUserByAdmin(int id) {
        String sql = "UPDATE users SET failed_attempts = 0, locked_until = NULL WHERE id = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    private User mapUser(ResultSet rs) throws Exception {
        String lockedUntil = null;
        String createdAt = null;

        if (rs.getTimestamp("locked_until") != null) {
            lockedUntil = rs.getTimestamp("locked_until").toString();
        }

        if (rs.getTimestamp("created_at") != null) {
            createdAt = rs.getTimestamp("created_at").toString();
        }

        return new User(
                rs.getInt("id"),
                rs.getString("first_name"),
                rs.getString("last_name"),
                rs.getString("email"),
                rs.getString("mobile_number"),
                rs.getString("password"),
                rs.getString("role"),
                rs.getInt("failed_attempts"),
                lockedUntil,
                createdAt
        );
    }
}