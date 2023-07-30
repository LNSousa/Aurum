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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/bde4faa4fd.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/main.css">
</head>

<body>
	<!-- Nav -->
	<nav class="navbar navbar-expand-lg bg-primary px-3 border-bottom">
		<div class="container-fluid">
			<a class="navbar-brand text-warning" href="/dashboard">Aurum</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="/goals">Goal
							Tracker</a></li>
					<li class="nav-item"><a class="nav-link" href="/request">Withdraw/Deposit
							Request</a></li>
					<li class="nav-item"><a class="nav-link" href="/transfer">Transfer
							Money</a></li>
				</ul>
				<div class="d-flex">
					<a href="/logout" class="btn btn-danger">Logout</a>
				</div>
			</div>
		</div>
	</nav>
	<!-- End Nav -->
    <div class="container">
        <h1 class="my-3">Goal</h1>
        <form:form action="/goals/new" class="goal-form" modelAttribute="newGoal" method="post">
            <form:input type="hidden" path="progress" value="0.0"/>
            <div class="form-group col-4">
                <form:input type="text" class="form-control form-control-lg" path="name" placeholder="Goal name"></form:input>
                <form:errors path="name" style="color:red"/>
            </div>
            <div class="form-group col-4 mt-3">
                <form:textarea path="description" class="form-control form-control-lg" rows="4" placeholder="Description"></form:textarea>
                <form:errors path="description" style="color:red"/>
            </div>
            <div class="form-group col-4 mt-3">
                <form:input type="number" path="goalAmount" class="form-control form-control-lg" placeholder="Goal amount"/>
                <form:errors path="goalAmount" style="color:red"/>
            </div>
            <div class="form-group col mt-3">
                <button class="btn btn-md btn-warning">Create Goal</button>
            </div>
        </form:form>
    </div>
</body>
</html>