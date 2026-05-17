<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Ticket Management System</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=100000">
</head>
<body class="auth-body">

    <div class="auth-page">
        <div class="auth-card">

            <h1 class="auth-title">Login</h1>

            <% String error = (String) request.getAttribute("error"); %>
            <% String success = (String) request.getAttribute("success"); %>

            <% if (error != null) { %>
                <div class="message error-message"><%= error %></div>
            <% } %>

            <% if (success != null) { %>
                <div class="message success-message"><%= success %></div>
            <% } %>

            <form action="<%= request.getContextPath() %>/login" method="post" class="auth-form">

                <div class="input-group">
                    <input type="email" name="email" placeholder="Email" required>
                </div>

                <div class="input-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>

                <div class="auth-options">
                    <label class="remember-label">
                        <input type="checkbox" name="remember">
                        <span>Remember me</span>
                    </label>

                    <a href="<%= request.getContextPath() %>/forgot-password" class="auth-link">
                        Forgot password?
                    </a>
                </div>

                <button type="submit" class="auth-btn">Login</button>
            </form>

            <p class="auth-switch">
                Don't have an account?
                <a href="<%= request.getContextPath() %>/register">Register</a>
            </p>

        </div>
    </div>

</body>
</html>