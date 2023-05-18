<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input id="location" name="location"type="text">
                <label for="salary">Title</label>
                <input id="salary" name="salary" type="text">
                <label for="title">Title</label>
                <input id="type" name="type" type="text">
                <label for="type">Description</label>
                <select name="shift" id="shift">
                    <option value="day">Day-Shift</option>
                    <option value="swings">Swing-Shift</option>
                    <option value="night">Night-Shift</option>
                </select>
                <label for="description">Description</label>
                <textarea id="description" name="description" type="text" rows="30" cols="70"></textarea>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
