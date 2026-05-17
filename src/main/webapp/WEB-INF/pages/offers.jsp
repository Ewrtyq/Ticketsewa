<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offers - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=100000">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<section class="offers-page">

    <div class="offers-header">
        <h1>Special Offers</h1>
        <p>Save more on your next trip with our latest travel deals.</p>
    </div>

    <div class="offers-modern-grid">

        <div class="offers-modern-card">
            <div class="offer-badge">20% OFF</div>
            <h3>New User Discount</h3>
            <p>Register today and get up to 20% off on your first ticket booking.</p>

            <div class="offer-details">
                <span>Valid For: New Users</span>
                <span>Payment: Any Method</span>
                <span>Status: Available</span>
            </div>

            <a href="<%= request.getContextPath() %>/register" class="offer-modern-btn">Claim Offer →</a>
        </div>

        <div class="offers-modern-card">
            <div class="offer-badge">Cashback</div>
            <h3>Khalti Cashback</h3>
            <p>Pay using Khalti and receive cashback on selected routes and travel packages.</p>

            <div class="offer-details">
                <span>Valid For: Selected Routes</span>
                <span>Payment: Khalti</span>
                <span>Status: Limited Time</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="offer-modern-btn">Book Now →</a>
        </div>

        <div class="offers-modern-card">
            <div class="offer-badge">Festival</div>
            <h3>Dashain Special</h3>
            <p>Special discounts available for Dashain and Tihar travel bookings across Nepal.</p>

            <div class="offer-details">
                <span>Valid For: Festival Travel</span>
                <span>Routes: Nationwide</span>
                <span>Status: Coming Soon</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="offer-modern-btn">Explore →</a>
        </div>

        <div class="offers-modern-card">
            <div class="offer-badge">Tour</div>
            <h3>Pokhara Tour Deal</h3>
            <p>Get discount on Pokhara tour package including transport, hotel and sightseeing.</p>

            <div class="offer-details">
                <span>Package: 3 Days / 2 Nights</span>
                <span>Destination: Pokhara</span>
                <span>Status: Available</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="offer-modern-btn">View Package →</a>
        </div>

        <div class="offers-modern-card">
            <div class="offer-badge">Student</div>
            <h3>Student Discount</h3>
            <p>Students can enjoy special travel discounts on selected bus routes.</p>

            <div class="offer-details">
                <span>Valid For: Students</span>
                <span>Document: Student ID</span>
                <span>Status: Available</span>
            </div>

            <a href="<%= request.getContextPath() %>/contact" class="offer-modern-btn">Learn More →</a>
        </div>

        <div class="offers-modern-card">
            <div class="offer-badge">Family</div>
            <h3>Family Travel Offer</h3>
            <p>Book multiple tickets for family travel and receive special group pricing.</p>

            <div class="offer-details">
                <span>Minimum: 4 Tickets</span>
                <span>Payment: Any Method</span>
                <span>Status: Available</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="offer-modern-btn">Book Family Trip →</a>
        </div>

    </div>

</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>