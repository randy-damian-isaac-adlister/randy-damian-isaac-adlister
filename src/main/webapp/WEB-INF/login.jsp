<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="JobSeeker Login" />
    </jsp:include>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">--%>
    <link rel="stylesheet" type="text/css" href="../css/layout.css">
    <link rel="stylesheet" type="text/css" href="../css/resets.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
<%--    <link rel="stylesheet" href="../css/login.css">--%>
</head>
<body>
<div class="page-wrapper">
    <div class="container align-center">
        <div class="row justify-center">
            <div class="column shrink login">
                <h1>JobSeeker Login</h1>
                <form action="/login" method="POST" class="login-form">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" name="username" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="password">Password </label>
                        <input id="password" name="password" class="form-control" type="password">
                    </div>
                    <span class="register">Need an account? Sign up to JobSeeker <a class="here">here</a></span>
                    <button type="submit" class="login-btn">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>