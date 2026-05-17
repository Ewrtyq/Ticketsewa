<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/main.css?v=100000">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<section class="contact-page">

    <div class="contact-header">
        <h1>Contact Us</h1>
        <p>Need help with booking, payment or travel details? Send us a message.</p>
    </div>

    <div class="contact-layout">

        <div class="contact-info-card">
            <h2>Get In Touch</h2>
            <p>
                Our support team is ready to help you with ticket booking,
                cancellation, payment and route information.
            </p>

            <div class="contact-info-list">
                <div>
                    <span>📞</span>
                    <p>01-4115951</p>
                </div>

                <div>
                    <span>✉️</span>
                    <p>support@ticketsewa.com</p>
                </div>

                <div>
                    <span>📍</span>
                    <p>Kathmandu, Nepal</p>
                </div>

                <div>
                    <span>🕒</span>
                    <p>Available 24/7</p>
                </div>
            </div>
        </div>

        <div class="contact-form-card">

            <h2>Send Message</h2>

            <% String error = (String) request.getAttribute("error"); %>
            <% String success = (String) request.getAttribute("success"); %>

            <% if (error != null) { %>
                <div class="message contact-error"><%= error %></div>
            <% } %>

            <% if (success != null) { %>
                <div class="message contact-success"><%= success %></div>
            <% } %>

            <form action="<%= request.getContextPath() %>/contact" method="post" class="search-form">

                <div class="form-group">
                    <label>Name</label>
                    <input type="text" name="name" placeholder="Enter your name" required>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="form-group">
                    <label>Message</label>
                    <textarea name="message" placeholder="Write your message" required></textarea>
                </div>

                <button type="submit" class="search-btn">Send Message</button>

            </form>

        </div>

    </div>

</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>