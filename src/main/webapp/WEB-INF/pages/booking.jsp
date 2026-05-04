<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Ticket - TicketSewa</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<div class="page-container">

    <div class="booking-card booking-page-card">

        <h1>Passenger Details</h1>
        <p class="page-subtitle">Enter your details to continue booking.</p>

        <form action="#" method="post" class="search-form">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullName" placeholder="Enter full name" required>
            </div>

            <div class="form-group">
                <label>Mobile Number</label>
                <input type="text" name="mobileNumber" placeholder="Enter mobile number" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="Enter email address" required>
            </div>

            <div class="form-group">
                <label>Seat Number</label>
                <select name="seatNumber" required>
                    <option value="">Select Seat</option>
                    <option>A1</option>
                    <option>A2</option>
                    <option>A3</option>
                    <option>B1</option>
                    <option>B2</option>
                    <option>B3</option>
                </select>
            </div>

            <div class="form-group">
                <label>Payment Method</label>
                <select name="paymentMethod" required>
                    <option value="">Select Payment Method</option>
                    <option>Cash</option>
                    <option>eSewa</option>
                    <option>Khalti</option>
                    <option>Card</option>
                </select>
            </div>

            <button type="submit" class="search-btn">
                Confirm Booking
            </button>

        </form>

    </div>

</div>

<jsp:include page="includes/footer.jsp" />

</body>
</html>