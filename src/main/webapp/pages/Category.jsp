<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
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
<nav
        class="navbar navbar-light navbar-expand-md border rounded-0 py-3 pb-xl-0 mb-xl-5"
>
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
<h1 style="text-align: center">Category</h1>
<section class="position-relative py-4 py-xl-5">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6 col-xl-4">
                <div class="card mb-5">
                    <div class="card-body d-flex flex-column align-items-center">
                        <form action="SendCategory" class="text-center" method="get">
                            <div class="mb-3"><input class="form-control" type="text" name="CategoryName"
                                                     id="CategoryName" placeholder="Category Name"></div>
                            <div class="mb-3"></div>
                            <div class="mb-3">
                                <button class="btn btn-primary d-block w-100" type="submit">Add Category</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div
        class="table-responsive mt-xl-0"
        style="margin-bottom: 157px; padding-bottom: 0px; padding-top: 53px"
>
    <table class="table">
        <thead>
        <tr>
            <th class="border rounded-0">Category ID</th>
            <th class="border rounded-0">Category Name</th>
            <th class="border rounded-0">Delete</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <% try {
                String url = "jdbc:mysql://localhost:3306/aashiyana";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", "password");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM CATEGORY");
            %>
            <% while (rs.next()) {
            %>
            <td class="border rounded-0"><%= rs.getInt(1) %>
            </td>
            <td class="border rounded-0"><%= rs.getString(2) %>
            </td>
            <td class="border rounded-0">
                <form action="Category/Delete" method="get">
                    <input type="hidden" name="Category_Name" id="Category_Name" value="<%=rs.getString(2)%>">
                    <button class="btn btn-primary" type="submit">
                        DELETE
                    </button>
                </form>
            </td>
        </tr>
        <% } %>
        <tr></tr>
        </tbody>
    </table>
    <% } catch (Exception ex) {
        System.out.println("Exception Occurred:: " + ex.getMessage());
    }
    %>
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
