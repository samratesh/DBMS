<!DOCTYPE html>
<html lang="en">
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
                <li class="nav-item"></li>
                <li class="nav-item"></li>
                <li class="nav-item"></li>
            </ul>
            <a class="btn btn-primary ms-md-2" role="button" href="/LogOut"
            >LogOut</a
            >
        </div>
    </div>
</nav>
<div class="container py-4 py-xl-5">
    <div class="row mb-5">
        <div class="col-md-8 col-xl-6 text-center mx-auto">
            <h2>Admin Home</h2>
        </div>
    </div>
    <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3">
        <div class="col">
            <div class="card">
                <div class="card-body p-4">
                    <h4 class="card-title mb-xl-4 pb-xl-0">
                        Categories
                    </h4>
                    <p class="card-text">Manage Your Categories Here</p>
                    <a class="btn btn-primary" href="/Admin/Category">
                        Manage
                    </a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body p-4">
                    <h4 class="card-title mb-xl-4 pb-xl-0">Products</h4>
                    <p class="card-text">Manage Your Products Here</p>
                    <a class="btn btn-primary" href="/Admin/Product">
                        Manage
                    </a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body p-4">
                    <h4 class="card-title mb-xl-4 pb-xl-0">
                        Customers
                    </h4>
                    <p class="card-text">Manage Your Customers Here</p>
                    <a class="btn btn-primary" href="/Admin/Customer">
                        Manage
                    </a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body p-4">
                    <h4 class="card-title mb-xl-4 pb-xl-0">Orders</h4>
                    <p class="card-text">Manage Your Orders Here</p>
                    <a class="btn btn-primary" href="/Admin/Orders">
                        Manage
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
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
