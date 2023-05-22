<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Search Ads</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/resets.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>
<div class="page-wrapper">
    <div class="container">
        <div class="row">
            <div class="column">
                <c:if test="${empty search}">
                    <h1>JobSeeker Search:</h1>
                </c:if>

                <c:if test="${not empty search}">
                    <h1>Here are your results for:
                        <c:out value="${search}"/></h1>
                </c:if>

                <c:forEach var="ad" items="${adsByTitle}">
                            <!-- Display ad information here -->
                    <h2><c:out value="${ad.title}"/></h2>
                    <p><strong>Location:</strong> <c:out value="${ad.location}"/></p>
                    <p><strong>Salary:</strong> <c:out value="${ad.salary}"/></p>
                    <p><strong>Job Type:</strong> <c:out value="${ad.job_type}"/></p>
                    <p><strong>Shift:</strong> <c:out value="${ad.shift}"/></p>
                    <p><strong>Description:</strong> <c:out value="${ad.description}"/></p>
                </c:forEach>
                <c:forEach var="ad" items="${adsByLocation}">
                    <h2><c:out value="${ad.title}"/></h2>
                    <p><strong>Location:</strong> <c:out value="${ad.location}"/></p>
                    <p><strong>Salary:</strong> <c:out value="${ad.salary}"/></p>
                    <p><strong>Job Type:</strong> <c:out value="${ad.job_type}"/></p>
                    <p><strong>Shift:</strong> <c:out value="${ad.shift}"/></p>
                    <p><strong>Description:</strong> <c:out value="${ad.description}"/></p>
                </c:forEach>
                <c:forEach var="ad" items="${adsByJob_type}">
                    <h2><c:out value="${ad.title}"/></h2>
                    <p><strong>Location:</strong> <c:out value="${ad.location}"/></p>
                    <p><strong>Salary:</strong> <c:out value="${ad.salary}"/></p>
                    <p><strong>Job Type:</strong> <c:out value="${ad.job_type}"/></p>
                    <p><strong>Shift:</strong> <c:out value="${ad.shift}"/></p>
                    <p><strong>Description:</strong> <c:out value="${ad.description}"/></p>
                </c:forEach>
                <c:forEach var="ad" items="${adsBySalary}">
                    <h2><c:out value="${ad.title}"/></h2>
                    <p><strong>Location:</strong> <c:out value="${ad.location}"/></p>
                    <p><strong>Salary:</strong> <c:out value="${ad.salary}"/></p>
                    <p><strong>Job Type:</strong> <c:out value="${ad.job_type}"/></p>
                    <p><strong>Shift:</strong> <c:out value="${ad.shift}"/></p>
                    <p><strong>Description:</strong> <c:out value="${ad.description}"/></p>
                </c:forEach>
                    <c:forEach var="ad" items="${adsByShift}">
                        <h2><c:out value="${ad.title}"/></h2>
                        <p><strong>Location:</strong> <c:out value="${ad.location}"/></p>
                        <p><strong>Salary:</strong> <c:out value="${ad.salary}"/></p>
                        <p><strong>Job Type:</strong> <c:out value="${ad.job_type}"/></p>
                        <p><strong>Shift:</strong> <c:out value="${ad.shift}"/></p>
                        <p><strong>Description:</strong> <c:out value="${ad.description}"/></p>
                    </c:forEach>

                <form action="${pageContext.request.contextPath}/search" method="POST">
                    <label>
                        <input type="text" name="title" placeholder="Search by title">
                    </label>
                    <label>
                        <input type="text" name="location" placeholder="Search by location">
                    </label>
                    <label>
                        <input type="text" name="salary" placeholder="Search by salary">
                    </label>
                    <label>
                        <input type="text" name="job_type" placeholder="Search by job type">
                    </label>
                    <label>
                        <input type="text" name="shift" placeholder="Search by shift">
                    </label>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>