<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="site-header">

    <div class="topbar">
        <div class="topbar-left">
            <span>📞 01-4115951</span>
            <span>✉️ support@ticketsewa.com</span>
        </div>

        <div class="topbar-right">
            <a href="<%= request.getContextPath() %>/login">Login</a>
            <a href="<%= request.getContextPath() %>/register" class="signup-btn">Sign Up</a>
            <a href="<%= request.getContextPath() %>/dashboard" class="dashboard-btn">Dashboard</a>
        </div>
    </div>

    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/home" class="logo">TicketSewa</a>

        <div class="nav-links">
            <a href="<%= request.getContextPath() %>/home">Home</a>
            <a href="<%= request.getContextPath() %>/routes">Routes</a>
            <a href="<%= request.getContextPath() %>/schedules">Schedules</a>
            <a href="<%= request.getContextPath() %>/offers">Offers</a>
            <a href="<%= request.getContextPath() %>/contact">Contact</a>
        </div>
    </nav>

</header>