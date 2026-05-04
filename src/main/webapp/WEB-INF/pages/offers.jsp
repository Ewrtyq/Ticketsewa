<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offers - TicketSewa</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<div class="page-container">
    <div class="page-header">
        <h1>Special Offers</h1>
        <p>Save more on your next trip with our latest deals.</p>
    </div>

    <div class="card-grid three">
        <div class="offer-card">
            <div class="offer-badge">20% OFF</div>
            <h3>New User Discount</h3>
            <p>Register today and get up to 20% off on your first ticket booking.</p>
            <a href="${pageContext.request.contextPath}/register">Claim Offer →</a>
        </div>

        <div class="offer-card">
            <div class="offer-badge">Cashback</div>
            <h3>Khalti Cashback</h3>
            <p>Pay using Khalti and receive cashback on selected routes.</p>
            <a href="${pageContext.request.contextPath}/search-results">Book Now →</a>
        </div>

        <div class="offer-card">
            <div class="offer-badge">Festival Offer</div>
            <h3>Dashain Special</h3>
            <p>Special discounts available for Dashain and Tihar travel bookings.</p>
            <a href="${pageContext.request.contextPath}/search-results">Explore →</a>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />

</body>
</html>