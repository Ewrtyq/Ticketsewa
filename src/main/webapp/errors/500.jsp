<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Something Went Wrong</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/main.css">
</head>
<body class="error-page-body">

    <div class="error-container">
        <div class="error-card">
            <h1>500</h1>
            <h2>Something Went Wrong</h2>

            <p>
                An unexpected error occurred while processing your request.
                Please try again later.
            </p>

            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
                    Go To Home
                </a>

                <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary">
                    Dashboard
                </a>
            </div>
        </div>
    </div>

</body>
</html>