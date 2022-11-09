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

<div class="container py-4 py-xl-5">
    <div class="row mb-5">
        <div class="col-md-8 col-xl-6 text-center mx-auto">
            <h2>Products</h2>
            <a style="margin: 20px 0" class="btn btn-primary"
               href="/Admin/Product/Add">Add Product</a><br>
        </div>
    </div>
    <div class="row gy-4 row-cols-1 row-cols-md-2">
        <%
            try {
                String url = "jdbc:mysql://localhost:3306/aashiyana";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", ",yG5(b)r#qgb");
                Statement stmt = con.createStatement();
                Statement stmt2 = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM PRODUCT");
        %>
        <%
            while (rs.next()) {
        %>
        <div class="col">
            <div class="d-flex flex-column flex-lg-row">
                <div class="w-100">
                    <img
                            class="rounded img-fluid d-block w-100 fit-cover"
                            style="height: 200px; width: 400px; object-fit: contain;"
                            src=<%= rs.getString(3) %>
                    />
                </div>
                <div class="py-4 py-lg-0 px-lg-4">
                    <h4><%= rs.getString(2) %>
                    </h4>
                    <p>
                        <%= rs.getString(8) %>
                    </p>
                    <p><b>Category : </b>
                        <%
                            int category_Id = rs.getInt(4);
                            ResultSet rs2 = stmt2.executeQuery("SELECT * FROM CATEGORY where CATEGORY_ID = " + category_Id + ";");
                            if (rs2.next()) {
                                out.print(rs2.getString(2));
                            }
                        %></p>
                    <p><b>Quantity : </b><%= rs.getInt(5) %>
                    </p>
                    <p><b>Expiry : </b><%= rs.getString(7) %>
                    </p>
                    <p><b>Price : Rs</b><%= rs.getInt(6) %>
                    </p>
                    <form action="/Admin/Product/Delete" method="get">
                        <input type="hidden" name="Product_Id" id="Product_Id" value="<%=rs.getInt(1)%>">
                        <button class="btn btn-primary" type="submit">
                            Delete
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <% }%>
        <% } catch (Exception ex) {
            System.out.println("Exception Occurred:: " + ex.getMessage());
        }
        %>
    </div>
</div>
<script src="/script.js"></script>
<script src="/jquery.js"></script>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"--%>
<%--        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"--%>
<%--        crossorigin="anonymous"></script>--%>
<style>.fit-cover {
    object-fit: fill
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
}</style>
</body>
</html>
