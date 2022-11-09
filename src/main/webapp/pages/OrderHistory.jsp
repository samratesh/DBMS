<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html
        lang="en"
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
                    <a class="nav-link active" href="Index"
                    >Home</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="DisplayProfile"
                    >Profile</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"
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
<h1 style="text-align: center">Order History</h1>
<div
        class="table-responsive mt-xl-0"
        style="margin-bottom: 157px; padding-bottom: 0px; padding-top: 53px"
>
    <table class="table">
        <thead>
        <tr>
            <th class="border rounded-0">Order ID</th>
            <th class="border rounded-0">Product Name</th>
            <th class="border rounded-0">Time</th>
            <th class="border rounded-0">Status</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <% try {
                String username = (String) request.getAttribute("User_Name");
                String url = "jdbc:mysql://localhost:3306/aashiyana";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", ",yG5(b)r#qgb");
                PreparedStatement stmt = con.prepareStatement("SELECT USER_ID FROM USERS WHERE USERNAME = ?;");
                stmt.setString(1, username);
                ResultSet rs4 = stmt.executeQuery();
                Statement stmt2 = con.createStatement();
                if (rs4.next()) {
                    ResultSet rs = stmt.executeQuery("SELECT * FROM ORDERS WHERE USER_ID = " + rs4.getInt(1) + ";");

            %>
            <% while (rs.next()) {
            %>
            <td class="border rounded-0"><%= rs.getInt(1) %>
            </td>
            <td class="border rounded-0">
                <%
                    String ProductName;
                    ResultSet rs3 = stmt2.executeQuery("SELECT PRODUCT_NAME FROM PRODUCT WHERE PRODUCT_ID = " + rs.getInt(3) + ";");
                    if (rs3.next()) {
                        out.print(rs3.getString(1));
                    }
                %>
            </td>
            <td class="border rounded-0"><%= rs.getTimestamp(4) %>
            </td>
            <td class="border rounded-0">
                <%=rs.getString(5)%>
            </td>
        </tr>
        <% }
        }%>
        <tr></tr>
        </tbody>
    </table>
    <% } catch (Exception ex) {
        System.out.println("Exception Occurred:: " + ex.getMessage());
    }
    %>
</div>
<script src="/script.js"></script>
<script src="/jquert.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"--%>
<%--        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"--%>
<%--        crossorigin="anonymous"></script>--%>
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