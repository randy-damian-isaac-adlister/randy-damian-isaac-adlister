<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="container-header">
    <div class="header">
        <div class="nav-header">
            <h1 class="nav-brand" href="/ads">JobSeeker</h1>
        </div>
        <div class="nav-items">
            <c:if test="${empty sessionScope.user}">
                <h4><a href="/login">Login</a></h4>
                <h4><a href="/register">Register</a></h4>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <h4><a href="/logout">Logout</a></h4>
                <h4><a href="/profile">Profile</a></h4>
                <h4><a href="/search">Search</a></h4>
            </c:if>

        </div>
    </div>
</nav>
