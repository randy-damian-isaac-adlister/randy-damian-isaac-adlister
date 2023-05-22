<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="../css/layout.css">
    <link rel="stylesheet" type="text/css" href="../css/resets.css">
    <link rel="stylesheet" type="text/css" href="../css/profile.css">
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
            <div class="row left">
                <div class="column shrink">
                    <div class="avatar"></div>
                </div>
                <div class="column shrink">
                    <button class="">Edit Profile</button>
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
                        <div class="ad-wrapper" data-id="${ad.id}">
                            <h2 class="ad-title">${ad.title}</h2>
                            <p class="ad-location">${ad.location}</p>
                            <p class="ad-salary">${ad.salary}</p>
                            <p class="ad-job_type">${ad.job_type}</p>
                            <p class="ad-shift">${ad.shift}</p>
                            <p class="ad-description">${ad.description}</p>
                            <button class="editBtn">Edit</button>
                            <button class="deleteBtn">Delete</button>
                        </div>
                    </c:forEach>
                </div>
                <div class="editFormPopup">
                    <div class="overlay">
                    </div>
                    <div class="popup">
                        <form action="ads/edit" method="post" class="my-form">
                            <div class="title">
                                <label for="title">Title</label>
                                <input id="title" name="title" class="edit-form" value="${ad.title}">
                            </div>
                            <div class="form-group">
                                <label for="location" class="form-label">Location</label>
                                <input id="location" name="location" type="text" class="form-input">
                                <label for="salary" class="form-label">Salary</label>
                                <input id="salary" name="salary" type="text" class="form-input">
                                <label for="type" class="form-label">Type</label>
                                <input id="type" name="job_type" type="text" class="form-input">
                                <select name="shift" id="shift" class="form-select">
                                    <option value="day">Day-Shift</option>
                                    <option value="swings">Swing-Shift</option>
                                    <option value="night">Night-Shift</option>
                                </select>
                                <input id="ad-id" name="ad-id" type="hidden" value="">
                                <label for="description" class="form-label">Description</label>
                                <textarea id="description" name="description" type="text" rows="5" cols="70" class="form-textarea"></textarea>
                            </div>
                            <input type="submit" class="btn btn-block btn-primary">
                        </form>

                    </div>
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
<script>
    const editForm = document.querySelector(".editFormPopup");
    const formBg = editForm.querySelector(".overlay");
    const ads = document.querySelectorAll(".ad-wrapper");
    formBg.addEventListener("click", function() {
        editForm.classList.toggle("show");
    });
    ads.forEach((ad) => {
        const editBtn = ad.querySelector(".editBtn");
        editBtn.addEventListener("click", function() {
            editForm.classList.toggle("show");
            document.querySelector('#title').value = ad.querySelector("h2").innerText;
            document.querySelector('#description').value = ad.querySelector(".ad-description").innerText;
            document.querySelector('#location').value = ad.querySelector(".ad-location").innerText;
            document.querySelector('#salary').value = ad.querySelector(".ad-salary").innerText;
            document.querySelector('#type').value = ad.querySelector(".ad-job_type").innerText;
            document.querySelector('#shift').value = ad.querySelector(".ad-shift").innerText;
            document.querySelector('#ad-id').value = ad.getAttribute("data-id");
        });
        if(editForm.style.opacity === "1"){
            document.addEventListener('click', function(event) {
                const isClickedInsideForm = editForm.contains(event.target);

                if (!isClickedInsideForm) {
                    // Clicked outside the form, so close it
                    editForm.style.opacity = "0";
                }
            });
        }
    });
</script>

</body>
</html>
