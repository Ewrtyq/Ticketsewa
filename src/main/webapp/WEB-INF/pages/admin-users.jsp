<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ticketmanagement.model.User" %>

<%
    List<User> users = (List<User>) request.getAttribute("users");
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=500000">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<section class="admin-page">

    <div class="admin-header">
        <div>
            <h1>Manage Users</h1>
            <p>Create, read, update, delete, and unlock user accounts.</p>
        </div>

        <a href="<%= request.getContextPath() %>/admin/users?action=add" class="admin-header-btn">
            + Add User
        </a>
    </div>

    <% if (success != null) { %>
        <div class="admin-message success-admin-message"><%= success %></div>
    <% } %>

    <% if (error != null) { %>
        <div class="admin-message error-admin-message"><%= error %></div>
    <% } %>

    <div class="admin-table-panel">

        <div class="admin-table-header">
            <h2>All Users</h2>
            <p>Admin can edit, delete, and unlock user accounts from this table.</p>
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
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <% if (users != null && !users.isEmpty()) { %>

                        <% for (User user : users) { %>
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
                                <td><%= user.getLockedUntil() == null ? "Not Locked" : user.getLockedUntil() %></td>
                                <td><%= user.getCreatedAt() == null ? "-" : user.getCreatedAt() %></td>
                                <td>
                                    <div class="table-actions">
                                        <a class="edit-btn"
                                           href="<%= request.getContextPath() %>/admin/users?action=edit&id=<%= user.getId() %>">
                                            Edit
                                        </a>

                                        <form action="<%= request.getContextPath() %>/admin/users" method="post">
                                            <input type="hidden" name="action" value="unlock">
                                            <input type="hidden" name="id" value="<%= user.getId() %>">
                                            <button type="submit" class="unlock-btn">Unlock</button>
                                        </form>

                                        <form action="<%= request.getContextPath() %>/admin/users"
                                              method="post"
                                              onsubmit="return confirm('Are you sure you want to delete this user?');">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="<%= user.getId() %>">
                                            <button type="submit" class="delete-btn">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        <% } %>

                    <% } else { %>

                        <tr>
                            <td colspan="9" class="empty-table">No users found.</td>
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