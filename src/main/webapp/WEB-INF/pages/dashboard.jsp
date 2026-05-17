<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=100000">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<div class="dashboard-page">

    <div class="dashboard-header">
        <h1>Welcome to Your Dashboard</h1>
        <p>Manage your tickets, bookings and account from one place.</p>
    </div>

    <div class="dashboard-grid">

        <div class="dashboard-card">
            <h3>My Tickets</h3>
            <p>View all your booked tickets and see travel details.</p>
            <a href="#" class="btn btn-primary">View Tickets</a>
        </div>

        <div class="dashboard-card">
            <h3>Book New Ticket</h3>
            <p>Search available routes and book your next journey.</p>
            <a href="<%= request.getContextPath() %>/home" class="btn btn-secondary">Book Now</a>
        </div>

        <div class="dashboard-card">
            <h3>Profile</h3>
            <p>Update your account information and contact details.</p>
            <a href="#" class="btn btn-success">Manage Profile</a>
        </div>

        <div class="dashboard-card">
            <h3>Upcoming Trips</h3>
            <p>Check your future travel schedule and departure times.</p>
            <a href="#" class="btn btn-primary">View Trips</a>
        </div>

        <div class="dashboard-card">
            <h3>Payment History</h3>
            <p>See your previous transactions and payment records.</p>
            <a href="#" class="btn btn-secondary">View History</a>
        </div>

        <div class="dashboard-card">
            <h3>Support</h3>
            <p>Need help? Contact support for refunds or booking issues.</p>
            <a href="<%= request.getContextPath() %>/contact" class="btn btn-success">Get Help</a>
        </div>

    </div>

</div>

<jsp:include page="includes/footer.jsp" />

</body>
</html>