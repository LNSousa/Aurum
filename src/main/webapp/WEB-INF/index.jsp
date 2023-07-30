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
<title>Aurum</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css">
</head>
<body class="d-flex align-items-center justify-content-center">
    <div id="index-card" class="card col-4 bg-transparent border-0">
        <div class="card-body">
            <h1 class="mb-3">Aurum</h1>
            <h5 class="card-title">Easy Banking Solutions</h5>
            <p class="card-text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laudantium suscipit ipsa ducimus iste a optio impedit quia necessitatibus dolore possimus! Ipsa doloribus repellat explicabo voluptatem. Dolorum quaerat ex debitis nemo?</p>

            <div class="button-wrapper d-flex align-items-center">
                <a href="/register" class="btn btn-md register me-3" role="button">Open an account</a>
                <a href="/login" class="btn btn-md login" role="button">Login</a>
            </div>
        </div>
    </div>
</body>
</html>