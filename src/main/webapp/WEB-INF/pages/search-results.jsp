<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<div class="page-container">

    <div class="page-header">
        <h1>Available Tickets</h1>
        <p>Choose your preferred ticket and continue your booking.</p>
    </div>

    <div class="ticket-list">

        <div class="ticket-card">
            <div class="ticket-info">
                <h3>Kathmandu → Pokhara</h3>
                <p>Luxury Bus</p>
                <p>Departure: 7:00 AM</p>
                <p>Duration: 6 Hours</p>
            </div>

            <div class="ticket-price">
                <h2>Rs. 1200</h2>
                <a href="${pageContext.request.contextPath}/booking" class="btn btn-secondary">
                    Book Now
                </a>
            </div>
        </div>

        <div class="ticket-card">
            <div class="ticket-info">
                <h3>Kathmandu → Pokhara</h3>
                <p>Deluxe Bus</p>
                <p>Departure: 9:30 AM</p>
                <p>Duration: 6.5 Hours</p>
            </div>

            <div class="ticket-price">
                <h2>Rs. 1000</h2>
                <a href="${pageContext.request.contextPath}/booking" class="btn btn-secondary">
                    Book Now
                </a>
            </div>
        </div>

        <div class="ticket-card">
            <div class="ticket-info">
                <h3>Kathmandu → Pokhara</h3>
                <p>Standard Bus</p>
                <p>Departure: 12:00 PM</p>
                <p>Duration: 7 Hours</p>
            </div>

            <div class="ticket-price">
                <h2>Rs. 850</h2>
                <a href="${pageContext.request.contextPath}/booking" class="btn btn-secondary">
                    Book Now
                </a>
            </div>
        </div>

    </div>

</div>

<jsp:include page="includes/footer.jsp" />

</body>
</html>