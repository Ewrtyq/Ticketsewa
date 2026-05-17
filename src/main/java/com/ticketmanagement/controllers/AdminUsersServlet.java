package com.ticketmanagement.controllers;

import java.io.IOException;
import java.util.List;

import com.ticketmanagement.dao.UserDAO;
import com.ticketmanagement.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/users")
public class AdminUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    private boolean isAdminLoggedIn(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (!loggedInUser.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return false;
        }

        return true;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdminLoggedIn(request, response)) {
            return;
        }

        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            showUsers(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("edit")) {
            showEditForm(request, response);
        } else {
            showUsers(request, response);
        }
    }

    private void showUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userDAO.getAllUsers();

        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/pages/admin-users.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("mode", "add");
        request.getRequestDispatcher("/WEB-INF/pages/admin-user-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/users");
            return;
        }

        int id = Integer.parseInt(idParam);
        User user = userDAO.getUserById(id);

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/admin/users");
            return;
        }

        request.setAttribute("mode", "edit");
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/pages/admin-user-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdminLoggedIn(request, response)) {
            return;
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addUser(request, response);
        } else if ("edit".equals(action)) {
            updateUser(request, response);
        } else if ("delete".equals(action)) {
            deleteUser(request, response);
        } else if ("unlock".equals(action)) {
            unlockUser(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/users");
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobileNumber");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (isEmpty(firstName) || isEmpty(lastName) || isEmpty(email)
                || isEmpty(mobileNumber) || isEmpty(password) || isEmpty(role)) {

            request.setAttribute("mode", "add");
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/WEB-INF/pages/admin-user-form.jsp").forward(request, response);
            return;
        }

        if (userDAO.isEmailExists(email)) {
            request.setAttribute("mode", "add");
            request.setAttribute("error", "Email already exists.");
            request.getRequestDispatcher("/WEB-INF/pages/admin-user-form.jsp").forward(request, response);
            return;
        }

        User user = new User(firstName, lastName, email, mobileNumber, password);
        user.setRole(role);

        boolean added = userDAO.addUserByAdmin(user);

        if (added) {
            response.sendRedirect(request.getContextPath() + "/admin/users?success=User added successfully");
        } else {
            request.setAttribute("mode", "add");
            request.setAttribute("error", "Failed to add user.");
            request.getRequestDispatcher("/WEB-INF/pages/admin-user-form.jsp").forward(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobileNumber");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (isEmpty(firstName) || isEmpty(lastName) || isEmpty(email)
                || isEmpty(mobileNumber) || isEmpty(password) || isEmpty(role)) {

            User user = userDAO.getUserById(id);

            request.setAttribute("mode", "edit");
            request.setAttribute("user", user);
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/WEB-INF/pages/admin-user-form.jsp").forward(request, response);
            return;
        }

        if (userDAO.isEmailExistsForOtherUser(email, id)) {
            User user = userDAO.getUserById(id);

            request.setAttribute("mode", "edit");
            request.setAttribute("user", user);
            request.setAttribute("error", "Email already exists for another user.");
            request.getRequestDispatcher("/WEB-INF/pages/admin-user-form.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setId(id);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setMobileNumber(mobileNumber);
        user.setPassword(password);
        user.setRole(role);

        boolean updated = userDAO.updateUserByAdmin(user);

        if (updated) {
            response.sendRedirect(request.getContextPath() + "/admin/users?success=User updated successfully");
        } else {
            request.setAttribute("mode", "edit");
            request.setAttribute("user", user);
            request.setAttribute("error", "Failed to update user.");
            request.getRequestDispatcher("/WEB-INF/pages/admin-user-form.jsp").forward(request, response);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession(false);
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser.getId() == id) {
            response.sendRedirect(request.getContextPath() + "/admin/users?error=You cannot delete your own account");
            return;
        }

        userDAO.deleteUserByAdmin(id);
        response.sendRedirect(request.getContextPath() + "/admin/users?success=User deleted successfully");
    }

    private void unlockUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        userDAO.unlockUserByAdmin(id);
        response.sendRedirect(request.getContextPath() + "/admin/users?success=User unlocked successfully");
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}