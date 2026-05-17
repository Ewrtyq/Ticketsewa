<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ticketmanagement.model.User" %>

<%
    String mode = (String) request.getAttribute("mode");
    User user = (User) request.getAttribute("user");
    String error = (String) request.getAttribute("error");

    boolean isEdit = "edit".equals(mode);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= isEdit ? "Edit User" : "Add User" %> - TicketSewa</title>

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
            <h1><%= isEdit ? "Edit User" : "Add New User" %></h1>
            <p><%= isEdit ? "Update user account details." : "Create a new user account from admin panel." %></p>
        </div>

        <a href="<%= request.getContextPath() %>/admin/users" class="admin-header-btn">
            Back to Users
        </a>
    </div>

    <div class="admin-form-card">

        <% if (error != null) { %>
            <div class="admin-message error-admin-message"><%= error %></div>
        <% } %>

        <form action="<%= request.getContextPath() %>/admin/users" method="post" class="admin-form">

            <input type="hidden" name="action" value="<%= isEdit ? "edit" : "add" %>">

            <% if (isEdit) { %>
                <input type="hidden" name="id" value="<%= user.getId() %>">
            <% } %>

            <div class="form-row">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text"
                           name="firstName"
                           value="<%= isEdit ? user.getFirstName() : "" %>"
                           placeholder="Enter first name"
                           required>
                </div>

                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text"
                           name="lastName"
                           value="<%= isEdit ? user.getLastName() : "" %>"
                           placeholder="Enter last name"
                           required>
                </div>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email"
                       name="email"
                       value="<%= isEdit ? user.getEmail() : "" %>"
                       placeholder="Enter email"
                       required>
            </div>

            <div class="form-group">
                <label>Mobile Number</label>
                <input type="text"
                       name="mobileNumber"
                       value="<%= isEdit ? user.getMobileNumber() : "" %>"
                       placeholder="Enter mobile number"
                       required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="text"
                       name="password"
                       value="<%= isEdit ? user.getPassword() : "" %>"
                       placeholder="Enter password"
                       required>
            </div>

            <div class="form-group">
                <label>Role</label>
                <select name="role" required>
                    <option value="USER"
                        <%= isEdit && "USER".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>
                        USER
                    </option>

                    <option value="ADMIN"
                        <%= isEdit && "ADMIN".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>
                        ADMIN
                    </option>
                </select>
            </div>

            <button type="submit" class="admin-submit-btn">
                <%= isEdit ? "Update User" : "Add User" %>
            </button>

        </form>

    </div>

</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>