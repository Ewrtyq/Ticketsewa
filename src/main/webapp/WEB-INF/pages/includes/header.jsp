<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ticketmanagement.model.User" %>

<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
%>

<header class="site-header">

    <div class="topbar">
        <div class="topbar-left">
            <span>📞 01-4115951</span>
            <span>✉️ support@ticketsewa.com</span>
        </div>

        <div class="topbar-right">

            <% if (loggedInUser == null) { %>

                <a href="<%= request.getContextPath() %>/login">Login</a>
                <a href="<%= request.getContextPath() %>/register" class="signup-btn">Sign Up</a>

            <% } else { %>

                <div class="user-profile-box">
                    <div class="user-avatar">
                        <%= loggedInUser.getFirstName().substring(0, 1).toUpperCase() %>
                    </div>

                    <div class="user-profile-info">
                        <span class="welcome-text">Welcome</span>

                        <% if (loggedInUser.isAdmin()) { %>
                            <a href="<%= request.getContextPath() %>/admin/dashboard" class="profile-name">
                                <%= loggedInUser.getFirstName() %> Admin
                            </a>
                        <% } else { %>
                            <a href="<%= request.getContextPath() %>/dashboard" class="profile-name">
                                <%= loggedInUser.getFirstName() %>
                            </a>
                        <% } %>
                    </div>
                </div>

                <% if (loggedInUser.isAdmin()) { %>
                    <a href="<%= request.getContextPath() %>/admin/dashboard" class="dashboard-btn">
                        Admin Dashboard
                    </a>
                <% } else { %>
                    <a href="<%= request.getContextPath() %>/dashboard" class="dashboard-btn">
                        Dashboard
                    </a>
                <% } %>

                <a href="<%= request.getContextPath() %>/logout" class="logout-btn">
                    Logout
                </a>

            <% } %>

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