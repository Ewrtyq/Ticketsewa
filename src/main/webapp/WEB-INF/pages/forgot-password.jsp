<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password - Ticket Management System</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=100000">
</head>
<body class="auth-body">

    <div class="auth-page">
        <div class="auth-card">

            <h1 class="auth-title">Reset Password</h1>

            <% String error = (String) request.getAttribute("error"); %>
            <% String success = (String) request.getAttribute("success"); %>

            <% if (error != null) { %>
                <div class="message error-message"><%= error %></div>
            <% } %>

            <% if (success != null) { %>
                <div class="message success-message"><%= success %></div>
            <% } %>

            <form action="<%= request.getContextPath() %>/forgot-password" method="post" class="auth-form">

                <div class="input-group">
                    <input type="email" name="email" placeholder="Enter your registered email" required>
                </div>

                <div class="input-group">
                    <input type="password" name="newPassword" placeholder="New Password" required>
                </div>

                <div class="input-group">
                    <input type="password" name="confirmPassword" placeholder="Confirm New Password" required>
                </div>

                <button type="submit" class="auth-btn">Reset Password</button>
            </form>

            <p class="auth-switch">
                Remember your password?
                <a href="<%= request.getContextPath() %>/login">Login</a>
            </p>

        </div>
    </div>

</body>
</html>