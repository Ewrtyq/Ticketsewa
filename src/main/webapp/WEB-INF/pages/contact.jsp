<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Contact</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="page-container">
    <h1>Contact Us</h1>

    <form class="search-form">
        <div class="form-group">
            <label>Name</label>
            <input type="text">
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email">
        </div>

        <div class="form-group">
            <label>Message</label>
            <textarea></textarea>
        </div>

        <button class="search-btn">Send Message</button>
    </form>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>
</html>