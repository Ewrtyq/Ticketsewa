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
      href="<%= request.getContextPath() %>/css/main.css?v=500">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background: #f8fafc;
    color: #0f172a;
    line-height: 1.6;
}

a {
    text-decoration: none;
}

/* HEADER FIX */
.topbar {
    background: #0f172a;
    color: #ffffff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 7%;
    flex-wrap: wrap;
    gap: 12px;
    font-size: 14px;
}

.topbar-left,
.topbar-right {
    display: flex;
    align-items: center;
    gap: 18px;
    flex-wrap: wrap;
}

.topbar-right a {
    color: #ffffff;
    font-weight: 500;
}

.signup-btn {
    background: #f97316;
    padding: 9px 18px;
    border-radius: 8px;
    color: #ffffff !important;
    font-weight: 600;
}

.dashboard-btn {
    background: #3f67b1;
    padding: 9px 18px;
    border-radius: 8px;
    color: #ffffff !important;
    font-weight: 600;
}

.navbar {
    background: #ffffff;
    padding: 18px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 12px rgba(0,0,0,0.06);
}

.logo {
    font-size: 30px;
    font-weight: 800;
    color: #1f2937;
}

.nav-links {
    display: flex;
    gap: 30px;
    flex-wrap: wrap;
}

.nav-links a {
    color: #475569;
    font-weight: 600;
    transition: 0.25s ease;
}

.nav-links a:hover {
    color: #f97316;
}

/* SCHEDULE PAGE */
.schedule-offer-page {
    min-height: 80vh;
    padding: 80px 7%;
    background: #ffffff;
}

.schedule-offer-header {
    text-align: center;
    margin-bottom: 55px;
}

.schedule-offer-header h1 {
    font-size: 52px;
    font-weight: 800;
    color: #0f172a;
    margin-bottom: 12px;
}

.schedule-offer-header p {
    font-size: 18px;
    color: #64748b;
}

.schedule-offer-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 34px;
}

.schedule-offer-card {
    background: #ffffff;
    border-radius: 20px;
    padding: 38px;
    box-shadow: 0 15px 40px rgba(15, 23, 42, 0.08);
    transition: 0.25s ease;
}

.schedule-offer-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 22px 55px rgba(15, 23, 42, 0.14);
}

.schedule-badge {
    display: inline-block;
    background: #f97316;
    color: #ffffff;
    padding: 8px 18px;
    border-radius: 999px;
    font-size: 14px;
    font-weight: 700;
    margin-bottom: 28px;
}

.schedule-offer-card h3 {
    font-size: 28px;
    color: #0f172a;
    font-weight: 800;
    margin-bottom: 18px;
}

.schedule-offer-card p {
    color: #64748b;
    font-size: 17px;
    line-height: 1.8;
    margin-bottom: 22px;
}

.schedule-info {
    display: grid;
    gap: 8px;
    margin-bottom: 22px;
    color: #475569;
    font-size: 15px;
}

.schedule-offer-card a {
    color: #f97316;
    font-size: 17px;
    font-weight: 800;
    transition: 0.25s ease;
}

.schedule-offer-card a:hover {
    color: #ea580c;
}

/* FOOTER FIX */
.footer {
    background: #0f172a;
    color: #cbd5e1;
    padding: 60px 7%;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 40px;
}

.footer h3 {
    color: #ffffff;
    margin-bottom: 16px;
}

.footer p {
    margin-bottom: 10px;
}

@media (max-width: 900px) {
    .schedule-offer-grid,
    .footer {
        grid-template-columns: 1fr;
    }

    .schedule-offer-header h1 {
        font-size: 34px;
    }

    .navbar,
    .topbar {
        padding-left: 5%;
        padding-right: 5%;
    }

    .nav-links {
        display: none;
    }
}
</style>
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

            <p>
                Luxury bus with AC, comfortable seats and daily departure.
            </p>

            <div class="schedule-info">
                <span>Departure: 7:00 AM</span>
                <span>Duration: 6 Hours</span>
                <span>Price: Rs. 1200</span>
            </div>

            <a href="${pageContext.request.contextPath}/booking">Book Now →</a>
        </div>

        <div class="schedule-offer-card">
            <div class="schedule-badge">Day</div>

            <h3>Kathmandu → Chitwan</h3>

            <p>
                Tourist bus service with safe travel and comfortable seating.
            </p>

            <div class="schedule-info">
                <span>Departure: 10:00 AM</span>
                <span>Duration: 5 Hours</span>
                <span>Price: Rs. 800</span>
            </div>

            <a href="${pageContext.request.contextPath}/booking">Book Now →</a>
        </div>

        <div class="schedule-offer-card">
            <div class="schedule-badge">Evening</div>

            <h3>Kathmandu → Butwal</h3>

            <p>
                Affordable evening travel option for long-distance passengers.
            </p>

            <div class="schedule-info">
                <span>Departure: 5:00 PM</span>
                <span>Duration: 7 Hours</span>
                <span>Price: Rs. 1000</span>
            </div>

            <a href="${pageContext.request.contextPath}/booking">Book Now →</a>
        </div>

    </div>

</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>