<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="../css/layout.css">
    <link rel="stylesheet" type="text/css" href="../css/resets.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="page-wrapper">
    <div class="container">
        <div class="row">
            <div class="banner">

            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="column shrink">
                    <div class="avatar"></div>
                </div>
                <div class="column shrink">
                    <button class="">Edit Profile</button>
                </div>
            </div>
        </div>
        <div class="row profile-info">
            <div class="column">
                <div class="title">
                    <h1>Welcome, ${sessionScope.user.username}!</h1>
                </div>
                <div class="">
                    <h2>${user.username}'s Ads</h2>
                </div>
                <div class="">
                    <c:forEach var="ad" items="${ads}">
                        <div class="ad-wrapper">
                            <h2>${ad.title}</h2>
                            <p>${ad.description}</p>
                            <button class="button">Edit</button>
                            <button class="button">Delete</button>
                        </div>
                    </c:forEach>
                </div>

            </div>
            <div class="column align-right">
                <div class="account-wrapper">
                    <div class="account-title-wrapper">
                        <h2 class="account-title">My Account</h2>
                    </div>
                    <div class="account-info">
                        <p>Username: ${user.username}</p>
                        <p>Email: ${user.email}</p>
                        <p>Company: ${user.company_name}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
