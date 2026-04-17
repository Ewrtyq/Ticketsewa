<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="topbar">
    <div class="topbar-left">
        <span>📍 Kathmandu, Nepal</span>
        <span>📞 +977-9800000000</span>
        <span>✉️ support@ticketsewa.com</span>
    </div>

    <div class="topbar-right">
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <a href="${pageContext.request.contextPath}/login">Login</a>

        <a href="${pageContext.request.contextPath}/register" class="signup-btn">
            Sign Up
        </a>

        <a href="${pageContext.request.contextPath}/dashboard" class="dashboard-btn">
            Dashboard
        </a>
    </div>
</div>

<nav class="navbar">
    <div class="logo">🚌 TicketSewa</div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home" class="active">Home</a>
        <a href="#">Routes</a>
        <a href="#">Schedules</a>
        <a href="#">Offers</a>
        <a href="#">Contact</a>
    </div>
</nav>