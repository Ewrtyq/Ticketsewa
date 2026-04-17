<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TicketSewa - Home</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

    <jsp:include page="includes/header.jsp" />

    <!-- HERO -->
    <section class="hero">
        <div class="hero-content">

            <div class="hero-text">
                <h1>Book Your Journey With Ease</h1>
                <p>
                    Travel across Nepal with the easiest and fastest online ticket booking system.
                    Compare routes, schedules and fares in one place.
                </p>
            </div>

            <div class="booking-card">

                <div class="booking-tabs">
                    <button class="tab active">Bus</button>
                    <button class="tab">Flight</button>
                    <button class="tab">Tour</button>
                </div>

                <form class="search-form">

                    <div class="form-group">
                        <label>From</label>
                        <select>
                            <option>Kathmandu</option>
                            <option>Pokhara</option>
                            <option>Chitwan</option>
                            <option>Butwal</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>To</label>
                        <select>
                            <option>Pokhara</option>
                            <option>Kathmandu</option>
                            <option>Biratnagar</option>
                            <option>Dharan</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Date</label>
                        <input type="date">
                    </div>

                    <button type="submit" class="search-btn">
                        Search Tickets
                    </button>
                </form>

            </div>
        </div>
    </section>

    <!-- FEATURES -->
    <section class="section">
        <div class="section-header">
            <h2>Why Choose TicketSewa?</h2>
            <p>Everything you need for smooth and secure ticket booking.</p>
        </div>

        <div class="card-grid three">

            <div class="feature-card">
                <div class="icon-circle">⚡</div>
                <h3>Fast Booking</h3>
                <p>Book tickets in less than a minute with a simple and user-friendly process.</p>
            </div>

            <div class="feature-card">
                <div class="icon-circle">💳</div>
                <h3>Secure Payment</h3>
                <p>Pay safely using Khalti, eSewa, cards and other secure methods.</p>
            </div>

            <div class="feature-card">
                <div class="icon-circle">🕒</div>
                <h3>24/7 Availability</h3>
                <p>Book tickets anytime and anywhere without visiting a ticket counter.</p>
            </div>

        </div>
    </section>

    <!-- POPULAR ROUTES -->
    <section class="section routes-section">
        <div class="section-header">
            <h2>Popular Routes</h2>
            <p>Most searched travel destinations in Nepal.</p>
        </div>

        <div class="routes-grid">
            <div class="route-pill">Kathmandu → Pokhara</div>
            <div class="route-pill">Kathmandu → Chitwan</div>
            <div class="route-pill">Pokhara → Butwal</div>
            <div class="route-pill">Kathmandu → Biratnagar</div>
            <div class="route-pill">Kathmandu → Dharan</div>
            <div class="route-pill">Pokhara → Nepalgunj</div>
        </div>
    </section>

    <!-- OFFERS -->
    <section class="section">
        <div class="section-header">
            <h2>Special Offers</h2>
            <p>Grab the latest deals before they are gone.</p>
        </div>

        <div class="card-grid three">

            <div class="offer-card">
                <div class="offer-badge">20% OFF</div>
                <h3>New User Discount</h3>
                <p>Register today and get up to 20% off on your first booking.</p>
                <a href="${pageContext.request.contextPath}/register">Claim Offer →</a>
            </div>

            <div class="offer-card">
                <div class="offer-badge">Cashback</div>
                <h3>Khalti Cashback</h3>
                <p>Pay using Khalti and receive cashback on selected routes.</p>
                <a href="#">View Details →</a>
            </div>

            <div class="offer-card">
                <div class="offer-badge">Festival Offer</div>
                <h3>Dashain Special</h3>
                <p>Special discounts available for Dashain and Tihar travel bookings.</p>
                <a href="#">Explore →</a>
            </div>

        </div>
    </section>

    <!-- STATS -->
    <section class="section">
        <div class="stats-grid">

            <div class="stat-card">
                <h3>10K+</h3>
                <p>Bookings Completed</p>
            </div>

            <div class="stat-card">
                <h3>500+</h3>
                <p>Routes Available</p>
            </div>

            <div class="stat-card">
                <h3>50+</h3>
                <p>Travel Partners</p>
            </div>

            <div class="stat-card">
                <h3>24/7</h3>
                <p>Customer Support</p>
            </div>

        </div>
    </section>

    <!-- CTA -->
    <section class="section">
        <div class="cta-box">
            <div>
                <h2>Ready To Travel?</h2>
                <p>Book your next trip now and enjoy a hassle-free journey.</p>
            </div>

            <a href="${pageContext.request.contextPath}/register" class="cta-btn">
                Get Started
            </a>
        </div>
    </section>

    <jsp:include page="includes/footer.jsp" />

</body>
</html>