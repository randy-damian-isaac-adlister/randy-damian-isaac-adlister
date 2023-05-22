<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--    //Inline style by RH//--%>
    <div class="container" style="background-color:#1B9C85; font-family: 'Rockwell', sans-serif; padding: 30px;">
        <h1  style="color:#E8F6EF;text-align:center";>Welcome to the JobSeeker</h1>
        <h4 style="color:#E8F6EF;text-align:center">Your Gateway to a new Career!</h4>

    </div>
</body>
</html>
