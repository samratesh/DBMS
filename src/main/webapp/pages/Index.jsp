<!DOCTYPE html>
<html
        lang="en"
        xmlns:th="http://www.thymeleaf.org"
        xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Aashiyana Medicals</title>
    <link
            rel="stylesheet"
            href="/style.css"
<%--            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"--%>
    />
</head>
<body style="background-image: url('/img/background.webp')">
<nav class="navbar navbar-light navbar-expand-md py-3">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#"
        ><span>Aashiyana Medicals</span></a
        >
        <button
                data-bs-toggle="collapse"
                class="navbar-toggler"
                data-bs-target="#navcol-2"
        >
					<span class="visually-hidden">Toggle navigation</span
                    ><span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navcol-2">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" th:href="@{/}" href="#"
                    >Home</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="DisplayProfile"
                    >Profile</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="OrderHistory"
                    >Order History</a
                    >
                </li>
                <li class="nav-item"></li>
            </ul>
            <a
                    class="btn btn-primary ms-md-2"
                    role="button"
                    sec:authorize="isAuthenticated()"
                    href="LogOut"
            >Logout</a
            >
        </div>
    </div>
</nav>
<div class="container py-4 py-xl-5">
    <div class="row gy-4 gy-md-0">
        <div class="col-md-6">
            <div class="p-xl-5 m-xl-5">
                <img
                        class="rounded img-fluid w-100 fit-cover"
                        style="min-height: 300px"
                        src="/img/Medicines.webp"
                />
            </div>
        </div>
        <div class="col-md-6 d-md-flex align-items-md-center">
            <div style="max-width: 350px">
                <h2 class="text-uppercase fw-bold">
                    Welcome,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;${UserName}
                </h2>
                <p class="my-3">
                    Aashiyana Medicals provide a large variety of daily
                    need medical products.
                </p>
                <a
                        class="btn btn-primary btn-lg me-2"
                        role="button"
                        href="/UserProduct"
                >Products</a
                >
            </div>
        </div>
    </div>
</div>
<script src="/script.js"></script>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>--%>
<script src="/jquery.js"></script>
<style>
    .fit-cover {
        object-fit: cover;
    }
</style>
</body>
</html>
