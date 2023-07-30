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
<link rel="stylesheet" href="../css/style.css">
<script src="https://kit.fontawesome.com/bde4faa4fd.js" crossorigin="anonymous"></script>
</head>
<body class="d-flex align-items-center justify-content-center">
    <div class="card registration-card col-6 bg-transparent border-0">
        <div class="card-body">
            <h1 class="form-header card-title mb-3">
                <i class="fa fa-edit"></i> Register
            </h1>
            <form:form action="/register" class="registration-form" modelAttribute="newUser" method="post">
                <div class="row">
                    <div class="form-group col">
                        <form:input type="text" path="firstName" class="form-control form-control-lg" placeholder="First Name"/>
        				<form:errors path="firstName" style="color:red"/>
                    </div>
                    <div class="form-group col">
                        <form:input type="text" path="lastName" class="form-control form-control-lg" placeholder="Last Name"/>
        				<form:errors path="lastName" style="color:red"/>
                    </div>
                </div>
                <div class="form-group col">
                    <form:input type="text" class="form-control form-control-lg" path="email" placeholder="Email Address"/>
       			 	<form:errors path="email" style="color:red"/>
                </div>
                <div class="row">
                    <div class="form-group col">
                        <form:input type="password" path="password" class="form-control form-control-lg" placeholder="Password"/>
        				<form:errors path="password" style="color:red"/>
                    </div>
                    <div class="form-group col">
                        <form:input type="password" path="confirm" class="form-control form-control-lg" placeholder="Confirm Password"/>
        				<form:errors path="confirm" style="color:red"/>
                    </div>
                </div>
                <div class="form-group col mt-3">
                    <button class="btn btn-md">Register</button>
                </div>
            </form:form>
            <p class="card-text text-white mt-3">
                Already have an account? <span class="ms-2 "><a href="/login" class="btn btn-sm text-warning">Sign in</a></span>
            </p>

            <small class="text-warning">
                <i class="fa fa-arrow-alt-circle-left"></i><a href="/" class="btn btn-sm text-warning">Back</a>
            </small>
        </div>
    </div>
</body>
</html>