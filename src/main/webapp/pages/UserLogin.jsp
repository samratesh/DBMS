<!DOCTYPE html>
<html
        lang="en"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Index</title>
    <link
            rel="stylesheet"
            href="/style.css"
<%--            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"--%>
    />
</head>

<body>
<section class="position-relative py-4 py-xl-5">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2>Aashiyana Medicals</h2>
                <p class="w-lg-50">Login Here</p>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-md-6 col-xl-4">
                <div class="card mb-5">
                    <div
                            class="card-body d-flex flex-column align-items-center"
                    >
                        <div
                                class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4"
                        >
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="1em"
                                    height="1em"
                                    fill="currentColor"
                                    viewBox="0 0 16 16"
                                    class="bi bi-person"
                            >
                                <path
                                        d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"
                                ></path>
                            </svg>
                        </div>
                        <form
                                class="text-center"
                                action="ValidateUserLogin"
                                method="post"
                        >
                            <div class="mb-3">
                                <input
                                        class="form-control"
                                        type="username"
                                        name="UserName"
                                        placeholder="UserName"
                                        id="UserName"
                                />
                            </div>
                            <div class="mb-3">
                                <input
                                        class="form-control"
                                        type="password"
                                        name="Password"
                                        placeholder="Password"
                                        id="Password"
                                />
                            </div>
                            <div class="mb-3">
                                <button
                                        class="btn btn-primary d-block w-100"
                                        type="submit"
                                >
                                    Login
                                </button>
                            </div>
                            <div class="mb-3">
                                <a
                                        class="btn btn-primary d-block w-100"
                                        href="RegisterUser"
                                        style="
												color: var(--bs-blue);
												background: var(--bs-white);
												border-color: var(--bs-blue);
											"
                                >SignUp</a
                                >
                            </div>
                            <div class="mb-3">
                                <a
                                        class="btn btn-primary d-block w-100"
                                        href="AdminLogin"
                                        style="
												color: var(--bs-blue);
												background: var(--bs-white);
												border-color: var(--bs-blue);
											"
                                >Admin Login</a
                                >
                            </div>
                            <div class="mb-3"></div>
                            <h3 style="color: red">${message }</h3>
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
