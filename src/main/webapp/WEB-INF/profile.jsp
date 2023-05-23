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
    <link rel="stylesheet" type="text/css" href="../css/profile.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="page-wrapper">
    <div class="container">
        <div class="row">
            <div class="banner">
                <img class="banner-image" src="../assets/job-seeker-logo.jpg">
            </div>
        </div>
        <div class="row left">
            <div class="column shrink">
                <div class="avatar">
                    <img class="avatar-img" src="../assets/avatar.png" alt="avatar">
                </div>
            </div>
            <div class="column shrink">
                <button class="editProfileBtn">Edit Profile</button>
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
                <h4><a class="create-ad-link" href="/ads/create">Click here to Create Ad</a></h4>
                <div class="">
                    <c:forEach var="ad" items="${ads}">
                        <div class="ad-wrapper" data-id="${ad.id}">
                            <h2 class="ad-title">${ad.title}</h2>
                            <div class="row">
                                <p>Location:</p>
                                <p class="ad-location">${ad.location}</p>
                            </div>
                            <div class="row">
                                <p>Salary: $</p>
                                <p class="ad-salary">${ad.salary}</p>
                            </div>
                            <div class="row">
                                <p>Job Type:</p>
                                <p class="ad-job_type">${ad.job_type}</p>
                            </div>
                            <div class="row">
                                <p>Shift:</p>
                                <p class="ad-shift">${ad.shift}</p>
                            </div>
                            <div class="row">
                                <p>Description:</p>
                                <p class="ad-description">${ad.description}</p>
                            </div>
                            <div class="row justify-center gap-10">
                                <button class="editBtn">Edit</button>
                                <button class="deleteBtn">Delete</button>
                            </div>

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
                                <textarea id="description" name="description" type="text" rows="5" cols="70"
                                          class="form-textarea"></textarea>
                            </div>
                            <input type="submit" class="btn btn-block btn-primary">
                        </form>

                    </div>
                </div>
            </div>
            <div class="column align-right shrink account-outline">
                <div class="account-wrapper">
                    <div class="account-title-wrapper">
                        <h2 class="account-title">My Account</h2>
                    </div>
                    <div class="account-info" data-id="${user.id}">
                        <div class="row">
                            <p>Username:</p>
                            <p id="profile-name" class="username">${user.username}</p>
                        </div>
                        <div class="row">
                            <p>Email:</p>
                            <p id="profile-email" class="email">${user.email}</p>
                        </div>
                        <div class="row">
                            <p>Company Name:</p>
                            <p id="profile-company_name" class="company_name">${user.company_name}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="editFormPopupProfile">
                <div class="overlayProfile">
                </div>
                <div class="popup">
                    <form action="profile/edit" method="post" class="my-form">
                        <div class="title">
                            <label for="username">Username</label>
                            <input id="username" name="username" class="edit-form" value="${user.username}">
                        </div>
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input id="email" name="email" type="text" class="form-input">
                            <label for="company_name" class="form-label">Company Name</label>
                            <input id="company_name" name="company_name" type="text" class="form-input">
                            <input id="user-id" name="user-id" type="hidden" value="">
                        </div>
                        <input type="submit" class="btn btn-block btn-primary">
                    </form>

                </div>
            </div>
            <div class="deleteFormPopup">
                <div class="overlayDelete">
                </div>
                <div class="popup">
                    <form action="profile/delete" method="post" class="my-form">
                        <input id="ad-id-delete" name="ad-id" type="hidden" value="">
                        <h2>Are you sure you want to delete</h2>
                        <button type="submit" class="btn btn-block btn-primary">Yes</button>
                        <button type="button" class="btn btn-block btn-primary">No</button>
                    </form>

                </div>

            </div>
        </div>
    </div>
</div>
<script>
    const editForm = document.querySelector(".editFormPopup");
    const editFormProfile = document.querySelector(".editFormPopupProfile");
    const deleteForm = document.querySelector(".deleteFormPopup");
    const formBg = editForm.querySelector(".overlay");
    const formBgProfile = editFormProfile.querySelector(".overlayProfile");
    const formBgDelete = deleteForm.querySelector(".overlayDelete");
    const ads = document.querySelectorAll(".ad-wrapper");
    const editProfile = document.querySelector(".editProfileBtn");
    const user = document.querySelector(".account-info");

    formBg.addEventListener("click", function () {
        editForm.classList.toggle("show");
    });
    formBgProfile.addEventListener("click", function () {
        editFormProfile.classList.toggle("show");
    });
    formBgDelete.addEventListener("click", function () {
        deleteForm.classList.toggle("show");
    });


    ads.forEach((ad) => {
        const editBtn = ad.querySelector(".editBtn");
        const deleteBtn = ad.querySelector(".deleteBtn");
        editBtn.addEventListener("click", function () {
            editForm.classList.toggle("show");
            document.querySelector('#title').value = ad.querySelector("h2").innerText;
            document.querySelector('#description').value = ad.querySelector(".ad-description").innerText;
            document.querySelector('#location').value = ad.querySelector(".ad-location").innerText;
            document.querySelector('#salary').value = ad.querySelector(".ad-salary").innerText;
            document.querySelector('#type').value = ad.querySelector(".ad-job_type").innerText;
            document.querySelector('#shift').value = ad.querySelector(".ad-shift").innerText;
            document.querySelector('#ad-id').value = ad.getAttribute("data-id");
        });
        deleteBtn.addEventListener("click", function () {
            document.querySelector('#ad-id-delete').value = ad.getAttribute("data-id");
           deleteForm.classList.toggle("show");
        });
        if(deleteForm.style.opacity === "1"){
            document.addEventListener('click', function (event) {
                const isClickedInsideForm = deleteForm.contains(event.target);

                if (!isClickedInsideForm) {
                    // Clicked outside the form, so close it
                    deleteForm.style.opacity = "0";
                }
            });
        }
        if (editForm.style.opacity === "1") {
            document.addEventListener('click', function (event) {
                const isClickedInsideForm = editForm.contains(event.target);

                if (!isClickedInsideForm) {
                    // Clicked outside the form, so close it
                    editForm.style.opacity = "0";
                }
            });
        }
    });
    editProfile.addEventListener("click", function () {
        editFormProfile.classList.toggle("show");
        document.querySelector('#username').value = user.querySelector(".username").innerText;
        document.querySelector('#email').value = user.querySelector(".email").innerText;
        document.querySelector('#company_name').value = user.querySelector(".company_name").innerText;
        document.querySelector('#user-id').value = user.getAttribute("data-id");
    });
    if (editFormProfile.style.opacity === "1") {
        document.addEventListener('click', function (event) {
            const isClickedInsideForm = editFormProfile.contains(event.target);

            if (!isClickedInsideForm) {
                // Clicked outside the form, so close it
                editFormProfile.style.opacity = "0";
            }
        });
    }
</script>

</body>
</html>
