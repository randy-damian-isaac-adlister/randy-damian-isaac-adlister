
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Register to JobSeeker</title>
    <link rel="stylesheet" href="/css/register.css">
    <link rel="stylesheet" href="/css/nav.css">
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <div class="row">
            <div class="register-card">
                <h2>Please fill in the required information</h2>
                <form action="/register" method="post" class="register-form">
                    <div class="form-el">
                        <label for="company">Company Name</label>
                        <input id="company" name="company" type="text" value="${sessionScope.company}">
                    </div>
                    <div class="form-el">
                        <label for="username">Username</label>
                        <input id="username" name="username" type="text" value="${sessionScope.username}">
                    </div>
                    <div class="form-el">
                        <label for="email">Email</label>
                        <input id="email" name="email" type="text" value="${sessionScope.email}" >
                    </div>
                    <div class="form-el">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" value="">

                    </div>
                    <div class="form-el">
                        <label for="confirm_password">Confirm Password</label>
                        <input id="confirm_password" name="confirm_password" type="password">
                    </div>
                    <input type="submit" class="submit-btn" value="Register">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
