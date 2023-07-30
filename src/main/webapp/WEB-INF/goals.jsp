<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/main.css">
<script src="https://kit.fontawesome.com/bde4faa4fd.js"
	crossorigin="anonymous"></script>
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
	<!-- Main Content -->
	<div class="container">
		<h1 class="my-3">Goal</h1>
		<div class="row">
			<c:choose>
				<c:when
					test="${ goal.getProgress().intValue() / goal.getGoalAmount() * 100 > 99 }">
					<!-- Goal Complete Card -->
					<div class="card p-3 col-8">
						<div class="progress mt-3" role="progressbar"
							aria-label="Basic example" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100" style="height: 30px">
							<div class="progress-bar progress-bar-striped bg-warning"
								style="width: 100%">100%!</div>
						</div>

						<p class="fst-italic mt-3">
							Congratulations! You have completed your goal of $
							<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${goal.getGoalAmount()}" />.
						</p>
						<p>Create a new one</p>
						<form action="/${ goal.getId() }/restart" method="post">
							<input type="hidden" name="_method" value="delete">
							<button class="btn btn-warning">here</button>
						</form>
					</div>
					<!-- End Goal Complete Card -->
				</c:when>
				<c:when test="${ goal != null }">
					<div class="col-8">
						<!-- Goal Card -->
						<div class="card p-3">
							<div class="d-flex justify-content-between align-items-center">
								<h3>
									Goal:
									<c:out value="${ goal.getName() }" />
								</h3>
								<p class="m-0">
									Date created:
									<fmt:formatDate pattern="MM/dd/YYYY"
										value="${ goal.getCreatedAt() }" />
								</p>
							</div>
							<div class="d-flex justify-content-between mt-3">
								<p>
									Progress: $
									<c:out value="${ String.format('%.2f', goal.getProgress()) }" />
								</p>
								<p>
									Goal: $
									<c:out value="${ goal.getGoalAmount() }" />
								</p>
							</div>
							<c:set var="goalPrct"
								value="${ goal.getProgress().intValue() / goal.getGoalAmount() * 100 }" />
							<div class="progress" role="progressbar"
								aria-label="Basic example"
								aria-valuenow="${ goalPrct.intValue() }" aria-valuemin="0"
								aria-valuemax="100" style="height: 30px">

								<div class="progress-bar progress-bar-striped bg-warning"
									style="width: ${ goalPrct.intValue() }%">
									<c:out value="${ goalPrct.intValue() }" />
									%
								</div>
							</div>
						</div>
						<!-- End Goal Card -->
					</div>
					<!-- Edit Goal -->
					<div class="col-4 goal-col">
						<!-- Edit Goal Button -->
						<button class="btn btn-primary btn-lg d-none">Edit Goal</button>
						<!-- End Edit Goal Button -->
						<!-- Edit Goal Form -->
						<div class="card">
							<div class="card-title p-3">
								<h3>Edit goal</h3>
								<form:form action="/goals/edit/${ goal.getId() }"
									class="goal-form" modelAttribute="goal" method="post">
									<input type="hidden" name="_method" value="put">
									<form:input type="hidden" path="progress"
										value="${ goal.getProgress() }" />
									<form:input type="hidden"
										value="${ goal.getSavings().getId() }" path="savings" />
									<div class="form-group">
										<form:input type="text" class="form-control form-control-lg"
											path="name" placeholder="Goal name"></form:input>
										<form:errors path="name" style="color:red" />
									</div>
									<div class="form-group mt-3">
										<form:textarea path="description"
											class="form-control form-control-lg" rows="4"
											placeholder="Description"></form:textarea>
										<form:errors path="description" style="color:red" />
									</div>
									<div class="form-group mt-3">
										<form:input type="number" path="goalAmount"
											class="form-control form-control-lg"
											placeholder="Goal amount" />
										<form:errors path="goalAmount" style="color:red" />
									</div>
									<div class="form-group col mt-3">
										<button class="btn btn-md btn-warning">Update Goal</button>
									</div>
								</form:form>
							</div>
						</div>
						<!-- End Edit Goal Form -->
					</div>
					<!-- End Edit Goal -->
				</c:when>
				<c:otherwise>
					<div class="container col-6 my-5">
						<h4>You have not set your next goal yet!</h4>
						<a href="/goals/new"
							class="btn btn-lg btn-outline-warning text-black my-3">Set
							your goal here</a>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<!-- End Main Content -->
</body>

</html>