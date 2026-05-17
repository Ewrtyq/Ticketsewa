<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedules - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=100000">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<section class="schedule-offer-page">

    <div class="schedule-offer-header">
        <h1>Travel Schedules</h1>
        <p>Choose your preferred route and departure time.</p>
    </div>

    <div class="schedule-offer-grid">

        <div class="schedule-offer-card">
            <div class="schedule-badge">Morning</div>
            <h3>Kathmandu → Pokhara</h3>
            <p>Luxury bus with AC, comfortable seats and daily departure.</p>

            <div class="schedule-info">
                <span>Departure: 7:00 AM</span>
                <span>Duration: 6 Hours</span>
                <span>Price: Rs. 1200</span>
            </div>

            <a href="<%= request.getContextPath() %>/booking">Book Now →</a>
        </div>

        <div class="schedule-offer-card">
            <div class="schedule-badge">Day</div>
            <h3>Kathmandu → Chitwan</h3>
            <p>Tourist bus service with safe travel and comfortable seating.</p>

            <div class="schedule-info">
                <span>Departure: 10:00 AM</span>
                <span>Duration: 5 Hours</span>
                <span>Price: Rs. 800</span>
            </div>

            <a href="<%= request.getContextPath() %>/booking">Book Now →</a>
        </div>

        <div class="schedule-offer-card">
            <div class="schedule-badge">Evening</div>
            <h3>Kathmandu → Butwal</h3>
            <p>Affordable evening travel option for long-distance passengers.</p>

            <div class="schedule-info">
                <span>Departure: 5:00 PM</span>
                <span>Duration: 7 Hours</span>
                <span>Price: Rs. 1000</span>
            </div>

            <a href="<%= request.getContextPath() %>/booking">Book Now →</a>
        </div>

        <div class="schedule-offer-card">
            <div class="schedule-badge">Night</div>
            <h3>Kathmandu → Dharan</h3>
            <p>Comfortable night bus service for long-distance travel.</p>

            <div class="schedule-info">
                <span>Departure: 7:30 PM</span>
                <span>Duration: 9 Hours</span>
                <span>Price: Rs. 1500</span>
            </div>

            <a href="<%= request.getContextPath() %>/booking">Book Now →</a>
        </div>

        <div class="schedule-offer-card">
            <div class="schedule-badge">Flight</div>
            <h3>Kathmandu → Biratnagar</h3>
            <p>Quick flight option for passengers who want faster travel.</p>

            <div class="schedule-info">
                <span>Departure: 11:15 AM</span>
                <span>Duration: 40 Minutes</span>
                <span>Price: Rs. 4500</span>
            </div>

            <a href="<%= request.getContextPath() %>/booking">Book Now →</a>
        </div>

        <div class="schedule-offer-card">
            <div class="schedule-badge">Tour</div>
            <h3>Pokhara Tour Package</h3>
            <p>Travel, hotel and sightseeing package for Pokhara trip.</p>

            <div class="schedule-info">
                <span>Departure: 6:30 AM</span>
                <span>Duration: 3 Days / 2 Nights</span>
                <span>Price: Rs. 8500</span>
            </div>

            <a href="<%= request.getContextPath() %>/booking">Book Now →</a>
        </div>

    </div>

</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>