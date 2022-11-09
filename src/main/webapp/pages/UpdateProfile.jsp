<!DOCTYPE html>
<html lang="en"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
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
                    <a class="nav-link active" href="Index">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="OrderHistory">Order History</a>
                </li>
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
<section
        class="position-relative py-4 py-xl-5"
        style="margin-top: 22px"
>
    <div class="container position-relative">
        <div class="row d-flex justify-content-center">
            <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                <div class="card mb-5">
                    <div class="card-body p-sm-5">
                        <h2 class="text-center mb-4">Update Profile</h2>
                        <form action="UpdateUser" method="post">
                            <div class="mb-3">
                                <input
                                        type="hidden"
                                        name="OldName"
                                        value="${UserName}"
                                />
                                <input
                                        class="form-control"
                                        type="text"
                                        id="NewName"
                                        name="NewName"
                                        placeholder="Name"
                                        value="${UserName}"
                                        style="margin-bottom: 10px"
                                /><input
                                    class="form-control"
                                    type="email"
                                    id="name-4"
                                    name="Email"
                                    placeholder="Email"
                                    value="${Email}"
                                    style="margin-bottom: 10px"
                            /><input
                                    class="form-control"
                                    type="text"
                                    id="Address"
                                    name="Address"
                                    placeholder="Address"
                                    value="${Address}"
                                    style="margin-bottom: 10px"
                            />
                            </div>
                            <div class="mb-3"></div>
                            <div class="mb-3"></div>
                            <div>
                                <button
                                        class="btn btn-primary d-block w-100"
                                        type="submit" value="UpdateUser"
                                >
                                    Update
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="/script.js"></script>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>--%>
<style>
    .fit-cover {
        object-fit: cover
    }

    .bs-icon {
        --bs-icon-size: .75rem;
        display: flex;
        flex-shrink: 0;
        justify-content: center;
        align-items: center;
        font-size: var(--bs-icon-size);
        width: calc(var(--bs-icon-size) * 2);
        height: calc(var(--bs-icon-size) * 2);
        color: var(--bs-primary)
    }

    .bs-icon-xs {
        --bs-icon-size: 1rem;
        width: calc(var(--bs-icon-size) * 1.5);
        height: calc(var(--bs-icon-size) * 1.5)
    }

    .bs-icon-sm {
        --bs-icon-size: 1rem
    }

    .bs-icon-md {
        --bs-icon-size: 1.5rem
    }

    .bs-icon-lg {
        --bs-icon-size: 2rem
    }

    .bs-icon-xl {
        --bs-icon-size: 2.5rem
    }

    .bs-icon.bs-icon-primary {
        color: var(--bs-white);
        background: var(--bs-primary)
    }

    .bs-icon.bs-icon-primary-light {
        color: var(--bs-primary);
        background: rgba(var(--bs-primary-rgb), .2)
    }

    .bs-icon.bs-icon-semi-white {
        color: var(--bs-primary);
        background: rgba(255, 255, 255, .5)
    }

    .bs-icon.bs-icon-rounded {
        border-radius: .5rem
    }

    .bs-icon.bs-icon-circle {
        border-radius: 50%
    }
</style>
</body>
</html>
