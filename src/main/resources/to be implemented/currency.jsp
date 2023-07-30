<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/style.css">
<script src="https://kit.fontawesome.com/bde4faa4fd.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- Nav -->
    <nav class="navbar navbar-expand-lg bg-primary px-3 border-bottom">
        <div class="container-fluid">
            <a class="navbar-brand text-warning" href="/dashboard">Aurum</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ">
                    <li class="nav-item">
                        <a class="nav-link" href="/goals">Goal Tracker</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/exchange">Exchange</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/withdraw">Withdraw</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/deposit">Deposit</a>
                    </li>
                </ul>
            </div>
        </div>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="/logout" class="btn btn-danger">Logout</a>
            </li>
        </ul>
    </nav>
    <!-- End Nav -->

    <!-- Main Content -->
    <div class="container">
        <h1 class="my-3">Currency Tracker</h1>
        <div class="currency-content text-center">
            <h3 class="">$1.00 (USD) compared to:</h3>
            <div class="border border-black p-3 col-4 mx-auto">
                <ul class="p-0">
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                    <li class="currency-item d-flex justify-content-between my-2">
                        <h5>Euro (EUR)</h5>
                        <h5>£1.00</h5>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</body>

</html>