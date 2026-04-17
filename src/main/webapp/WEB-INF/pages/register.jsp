<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Ticket Management System</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body class="auth-body">

    <div class="auth-page">
        <div class="auth-card">

            <h1 class="auth-title">Register</h1>

            <% String error = (String) request.getAttribute("error"); %>
            <% String success = (String) request.getAttribute("success"); %>

            <% if (error != null) { %>
                <div class="message error-message"><%= error %></div>
            <% } %>

            <% if (success != null) { %>
                <div class="message success-message"><%= success %></div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post" class="auth-form">

                <div class="input-group">
                    <input type="text" name="firstName" placeholder="First Name" required>
                    <span class="input-icon">👤</span>
                </div>

                <div class="input-group">
                    <input type="text" name="lastName" placeholder="Last Name" required>
                    <span class="input-icon">👤</span>
                </div>

                <div class="input-group">
                    <input type="email" name="email" placeholder="Email" required>
                    <span class="input-icon">✉️</span>
                </div>

                <div class="input-group">
                    <input type="text" name="mobileNumber" placeholder="Mobile Number" required>
                    <span class="input-icon">📞</span>
                </div>

                <div class="input-group">
                    <input type="password" name="password" placeholder="Password" required>
                    <span class="input-icon">🔒</span>
                </div>

                <div class="input-group">
                    <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
                    <span class="input-icon">🔐</span>
                </div>

                <button type="submit" class="auth-btn">Register</button>
            </form>

            <p class="auth-switch">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login">Login</a>
            </p>

        </div>
    </div>

</body>
</html>