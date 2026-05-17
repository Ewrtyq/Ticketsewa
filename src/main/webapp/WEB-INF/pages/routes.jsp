<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Routes - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=100000">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<section class="routes-page">

    <div class="routes-header">
        <h1>Popular Routes</h1>
        <p>Explore the most travelled routes across Nepal.</p>
    </div>

    <div class="routes-modern-grid">

        <div class="route-modern-card">
            <div class="route-icon">🚌</div>
            <h3>Kathmandu → Pokhara</h3>
            <p>Fast and comfortable tourist buses available daily with multiple departure times.</p>

            <div class="route-info">
                <span>Starting Price: Rs. 850</span>
                <span>Duration: 6 Hours</span>
                <span>Available: Bus / Flight / Tour</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="route-btn">View Tickets →</a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">🌄</div>
            <h3>Kathmandu → Chitwan</h3>
            <p>Travel to Chitwan easily with safe, affordable and comfortable transport options.</p>

            <div class="route-info">
                <span>Starting Price: Rs. 700</span>
                <span>Duration: 5 Hours</span>
                <span>Available: Bus / Tour</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="route-btn">View Tickets →</a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">✈️</div>
            <h3>Kathmandu → Biratnagar</h3>
            <p>Choose bus or flight services for quick and reliable travel to Biratnagar.</p>

            <div class="route-info">
                <span>Starting Price: Rs. 1600</span>
                <span>Duration: 8 Hours by Bus</span>
                <span>Available: Bus / Flight</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="route-btn">View Tickets →</a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">🚐</div>
            <h3>Pokhara → Butwal</h3>
            <p>Affordable travel route for passengers going from Pokhara to Butwal.</p>

            <div class="route-info">
                <span>Starting Price: Rs. 900</span>
                <span>Duration: 6.5 Hours</span>
                <span>Available: Bus</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="route-btn">View Tickets →</a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">🏞️</div>
            <h3>Kathmandu → Dharan</h3>
            <p>Long-distance travel option with deluxe and tourist bus facilities.</p>

            <div class="route-info">
                <span>Starting Price: Rs. 1500</span>
                <span>Duration: 9 Hours</span>
                <span>Available: Bus</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="route-btn">View Tickets →</a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">🎒</div>
            <h3>Pokhara Tour Package</h3>
            <p>Explore Pokhara with hotel, sightseeing and comfortable travel included.</p>

            <div class="route-info">
                <span>Starting Price: Rs. 8500</span>
                <span>Duration: 3 Days / 2 Nights</span>
                <span>Available: Tour</span>
            </div>

            <a href="<%= request.getContextPath() %>/search-results" class="route-btn">View Package →</a>
        </div>

    </div>

</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>