<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Search Ads</title>
    <link rel="stylesheet" href="/css/resets.css">
    <link rel="stylesheet" href="/css/layout.css">
</head>
<body>
<%--<jsp:include page="/WEB-INF/ads/search.jsp"/>--%>

<div class="page-wrapper">
    <div class="container">
        <div class="row">
            <div class="column">
                <c:if test="${empty search}">
                    <h1>All the ads!</h1>
                </c:if>

                <c:if test="${not empty search}">
                    <h1>You are searching for:
                    <c:out value="${search}"/></h1>
                </c:if>

                <c:forEach var="ad" items="${adsByTitle}">
                    <!-- Display ad information here -->
                    <h2><c:out value="${ad.title}"/></h2>
                    <!-- Add more fields as required -->
                </c:forEach>

                <form action="${pageContext.request.contextPath}/search" method="POST">
                    <label>
                        <input type="text" name="search" placeholder="Search">
                    </label>
                    <button type="submit">Search</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
