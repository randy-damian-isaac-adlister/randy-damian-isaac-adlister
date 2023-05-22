<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="../css/layout.css">
    <link rel="stylesheet" type="text/css" href="../css/resets.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/createAd.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"></jsp:include>
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="location">Location</label>
            <input id="location" name="location" type="text">
        </div>
        <div class="form-group">
            <label for="salary">Salary</label>
            <input id="salary" name="salary" type="text">
        </div>
        <div class="form-group">
            <label for="type">Type</label>
            <input id="type" name="type" type="text">
        </div>
        <div class="form-group">
            <label for="shift">Shift</label>
            <select name="shift" id="shift">
                <option value="day">Day-Shift</option>
                <option value="swings">Swing-Shift</option>
                <option value="night">Night-Shift</option>
            </select>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" rows="6"></textarea>
        </div>
        <input type="submit" class="btn btn-block btn-primary" value="Submit">
    </form>
</div>
</body>
</html>
