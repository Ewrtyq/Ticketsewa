<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ticketmanagement.model.User" %>

<%
    Integer totalUsers = (Integer) request.getAttribute("totalUsers");
    Integer adminUsers = (Integer) request.getAttribute("adminUsers");
    Integer normalUsers = (Integer) request.getAttribute("normalUsers");
    Integer lockedUsers = (Integer) request.getAttribute("lockedUsers");

    List<User> recentUsers = (List<User>) request.getAttribute("recentUsers");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=400000">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<section class="admin-page">

    <div class="admin-header">
        <div>
            <h1>Admin Dashboard</h1>
            <p>Manage users, monitor accounts, and control TicketSewa system data.</p>
        </div>

        <a href="<%= request.getContextPath() %>/home" class="admin-header-btn">
            View Website
        </a>
    </div>

    <div class="admin-stats-grid">

        <div class="admin-stat-card">
            <span class="admin-stat-icon">👥</span>
            <h3><%= totalUsers == null ? 0 : totalUsers %></h3>
            <p>Total Users</p>
        </div>

        <div class="admin-stat-card">
            <span class="admin-stat-icon">🛡️</span>
            <h3><%= adminUsers == null ? 0 : adminUsers %></h3>
            <p>Admins</p>
        </div>

        <div class="admin-stat-card">
            <span class="admin-stat-icon">🙋</span>
            <h3><%= normalUsers == null ? 0 : normalUsers %></h3>
            <p>Normal Users</p>
        </div>

        <div class="admin-stat-card warning">
            <span class="admin-stat-icon">🔒</span>
            <h3><%= lockedUsers == null ? 0 : lockedUsers %></h3>
            <p>Locked Accounts</p>
        </div>

    </div>

    <div class="admin-content-grid">

        <div class="admin-panel">
            <h2>Quick Actions</h2>

            <div class="admin-actions">
                <a href="#" class="admin-action-card">
                    <span>🚌</span>
                    <div>
                        <h3>Manage Routes</h3>
                        <p>Add, update or remove travel routes.</p>
                    </div>
                </a>

                <a href="#" class="admin-action-card">
                    <span>🕒</span>
                    <div>
                        <h3>Manage Schedules</h3>
                        <p>Control departure time, price and route schedule.</p>
                    </div>
                </a>

                <a href="#" class="admin-action-card">
                    <span>🎟️</span>
                    <div>
                        <h3>View Bookings</h3>
                        <p>Check customer booking and ticket information.</p>
                    </div>
                </a>

                <a href="#" class="admin-action-card">
                    <span>🎁</span>
                    <div>
                        <h3>Manage Offers</h3>
                        <p>Create and update discount offers.</p>
                    </div>
                </a>
            </div>
        </div>

        <div class="admin-panel">
            <h2>System Overview</h2>

            <div class="admin-overview-list">
                <div>
                    <span>Database</span>
                    <strong>Connected</strong>
                </div>

                <div>
                    <span>MVC Structure</span>
                    <strong>Active</strong>
                </div>

                <div>
                    <span>Login Lockout</span>
                    <strong>Enabled</strong>
                </div>

                <div>
                    <span>Forgot Password</span>
                    <strong>Enabled</strong>
                </div>
            </div>
        </div>

    </div>

    <div class="admin-table-panel">
        <div class="admin-table-header">
            <h2>Recent Users</h2>
            <p>Latest registered users and account status.</p>
        </div>

        <div class="admin-table-wrapper">
            <table class="admin-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Role</th>
                        <th>Failed Attempts</th>
                        <th>Locked Until</th>
                        <th>Created At</th>
                    </tr>
                </thead>

                <tbody>
                    <% if (recentUsers != null && !recentUsers.isEmpty()) { %>

                        <% for (User user : recentUsers) { %>
                            <tr>
                                <td><%= user.getId() %></td>
                                <td><%= user.getFullName() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getMobileNumber() %></td>
                                <td>
                                    <% if (user.isAdmin()) { %>
                                        <span class="role-badge admin-role">ADMIN</span>
                                    <% } else { %>
                                        <span class="role-badge user-role">USER</span>
                                    <% } %>
                                </td>
                                <td><%= user.getFailedAttempts() %></td>
                                <td>
                                    <%= user.getLockedUntil() == null ? "Not Locked" : user.getLockedUntil() %>
                                </td>
                                <td>
                                    <%= user.getCreatedAt() == null ? "-" : user.getCreatedAt() %>
                                </td>
                            </tr>
                        <% } %>

                    <% } else { %>

                        <tr>
                            <td colspan="8" class="empty-table">No users found.</td>
                        </tr>

                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>