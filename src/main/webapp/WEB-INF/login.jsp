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
<title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/bde4faa4fd.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/style.css">
</head>
<body class="d-flex align-items-center justify-content-center">
    <div class="card login-card col-4 bg-transparent border-0">
        <div class="card-body">
            <h1 class="form-header card-title mb-3">
                <i class="fa fa-user-circle"></i> Login
            </h1>
            <form:form action="/login" class="login-form" modelAttribute="newLogin" method="post">
                <div class="form-group col">
                    <form:input type="text" class="form-control form-control-lg" path="email" placeholder="Email Address"/>
                    <form:errors path="email" style="color:red"/>
                </div>
                <div class="form-group col">
                    <form:input type="password" path="password" class="form-control form-control-lg" placeholder="Password"/>
                    <form:errors path="password" style="color:red"/>
                </div>
                <div class="form-group col mt-3">
                    <button class="btn btn-md">Login</button>
                </div>
            </form:form>
            <p class="card-text text-white mt-3">
                <a href="/register" class="btn btn-sm text-warning"><i class="fa fa-edit"></i> Need to open an account?</a>
            </p>

            <small class="text-warning">
                <i class="fa fa-arrow-alt-circle-left"></i><a href="/" class="btn btn-sm text-warning">Back</a>
            </small>
        </div>
    </div>
</body>
</html>