<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Routes - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=600">

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

/* =========================
   HEADER FIX
========================= */
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

.signup-btn:hover {
    background: #ea580c;
}

.dashboard-btn {
    background: #3f67b1;
    padding: 9px 18px;
    border-radius: 8px;
    color: #ffffff !important;
    font-weight: 600;
}

.dashboard-btn:hover {
    background: #2f5599;
}

.navbar {
    background: #ffffff;
    padding: 18px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 12px rgba(0,0,0,0.06);
    position: sticky;
    top: 0;
    z-index: 100;
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

.nav-links a:hover,
.nav-links a.active {
    color: #f97316;
}

/* =========================
   ROUTES PAGE
========================= */
.routes-page {
    min-height: 80vh;
    padding: 80px 7%;
    background: #ffffff;
}

.routes-header {
    text-align: center;
    margin-bottom: 55px;
}

.routes-header h1 {
    font-size: 52px;
    font-weight: 800;
    color: #0f172a;
    margin-bottom: 12px;
}

.routes-header p {
    font-size: 18px;
    color: #64748b;
}

.routes-modern-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 34px;
}

.route-modern-card {
    background: #ffffff;
    border-radius: 20px;
    padding: 38px;
    box-shadow: 0 15px 40px rgba(15, 23, 42, 0.08);
    transition: 0.25s ease;
    border: 1px solid #eef2f7;
}

.route-modern-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 22px 55px rgba(15, 23, 42, 0.14);
}

.route-icon {
    width: 70px;
    height: 70px;
    background: #fff7ed;
    color: #f97316;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 34px;
    margin-bottom: 28px;
}

.route-modern-card h3 {
    font-size: 28px;
    color: #0f172a;
    font-weight: 800;
    margin-bottom: 18px;
}

.route-modern-card p {
    color: #64748b;
    font-size: 17px;
    line-height: 1.8;
    margin-bottom: 22px;
}

.route-info {
    display: grid;
    gap: 8px;
    margin-bottom: 22px;
    color: #475569;
    font-size: 15px;
}

.route-btn {
    color: #f97316;
    font-size: 17px;
    font-weight: 800;
    transition: 0.25s ease;
}

.route-btn:hover {
    color: #ea580c;
}

/* =========================
   FOOTER FIX
========================= */
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

/* =========================
   RESPONSIVE
========================= */
@media (max-width: 900px) {
    .routes-modern-grid,
    .footer {
        grid-template-columns: 1fr;
    }

    .routes-header h1 {
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

<section class="routes-page">

    <div class="routes-header">
        <h1>Popular Routes</h1>
        <p>Explore the most travelled routes across Nepal.</p>
    </div>

    <div class="routes-modern-grid">

        <div class="route-modern-card">
            <div class="route-icon">🚌</div>

            <h3>Kathmandu → Pokhara</h3>

            <p>
                Fast and comfortable tourist buses available daily with multiple departure times.
            </p>

            <div class="route-info">
                <span>Starting Price: Rs. 850</span>
                <span>Duration: 6 Hours</span>
                <span>Available: Bus / Flight / Tour</span>
            </div>

            <a href="${pageContext.request.contextPath}/search-results" class="route-btn">
                View Tickets →
            </a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">🌄</div>

            <h3>Kathmandu → Chitwan</h3>

            <p>
                Travel to Chitwan easily with safe, affordable and comfortable transport options.
            </p>

            <div class="route-info">
                <span>Starting Price: Rs. 700</span>
                <span>Duration: 5 Hours</span>
                <span>Available: Bus / Tour</span>
            </div>

            <a href="${pageContext.request.contextPath}/search-results" class="route-btn">
                View Tickets →
            </a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">✈️</div>

            <h3>Kathmandu → Biratnagar</h3>

            <p>
                Choose bus or flight services for quick and reliable travel to Biratnagar.
            </p>

            <div class="route-info">
                <span>Starting Price: Rs. 1600</span>
                <span>Duration: 8 Hours by Bus</span>
                <span>Available: Bus / Flight</span>
            </div>

            <a href="${pageContext.request.contextPath}/search-results" class="route-btn">
                View Tickets →
            </a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">🚐</div>

            <h3>Pokhara → Butwal</h3>

            <p>
                Affordable travel route for passengers going from Pokhara to Butwal.
            </p>

            <div class="route-info">
                <span>Starting Price: Rs. 900</span>
                <span>Duration: 6.5 Hours</span>
                <span>Available: Bus</span>
            </div>

            <a href="${pageContext.request.contextPath}/search-results" class="route-btn">
                View Tickets →
            </a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">🏞️</div>

            <h3>Kathmandu → Dharan</h3>

            <p>
                Long-distance travel option with deluxe and tourist bus facilities.
            </p>

            <div class="route-info">
                <span>Starting Price: Rs. 1500</span>
                <span>Duration: 9 Hours</span>
                <span>Available: Bus</span>
            </div>

            <a href="${pageContext.request.contextPath}/search-results" class="route-btn">
                View Tickets →
            </a>
        </div>

        <div class="route-modern-card">
            <div class="route-icon">🎒</div>

            <h3>Pokhara Tour Package</h3>

            <p>
                Explore Pokhara with hotel, sightseeing and comfortable travel included.
            </p>

            <div class="route-info">
                <span>Starting Price: Rs. 8500</span>
                <span>Duration: 3 Days / 2 Nights</span>
                <span>Available: Tour</span>
            </div>

            <a href="${pageContext.request.contextPath}/search-results" class="route-btn">
                View Package →
            </a>
        </div>

    </div>

</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>