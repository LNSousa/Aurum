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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bde4faa4fd.js"
	crossorigin="anonymous"></script>
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
		<!-- Greeting -->
		<div class="d-flex align-items-center my-5">
			<h1>
				Welcome,
				<c:out value="${user.getFirstName()}"></c:out>
			</h1>
		</div>
		<!-- End Greeting -->
		<!-- Main Content -->
		<div class="col-12 col-lg-8">
			<!-- Checking Card -->
			<div>
				<div class="card checking-card">
					<div
						class="d-flex justify-content-between align-items-center card-header">
						<div class="px-3 py-2">
							<h4>Checking Account</h4>
							<p class="fst-italic">
								Acct #:
								<c:out value="${ checking.getAcctNumber() }" />
							</p>
						</div>
						<div class="px-3 py-2">
							<h3>
								Balance: $
								<fmt:formatNumber type="number" maxFractionDigits="2"
									value="${checking.getBalance()}" />
							</h3>
						</div>
					</div>
					<div class="card-body p-3">
							<div class="col">
								<h3><a href="/transactions" class="transactions-link">Last 3
									transactions:</a></h3>
								<c:choose>
									<c:when test="${checkTrans.size() == 0}">
										<p>You have no transactions...</p>
									</c:when>
									<c:otherwise>
										<ul
											style="list-style-type: none; margin-top: 20px;" class="transactions-list">
											<c:forEach var="transaction" items="${checkTrans}" end="2">
												<li>
													<div class="d-flex justify-content-between">
														<p style="width: 20%;">
															<fmt:formatDate pattern="MM-dd"
																value="${ transaction.getCreatedAt() }" />
														</p>
														<c:choose>
															<c:when
																test="${ transaction.getAction().equals('deposit') }">
																<p class="mx-3" style="width: 50%;">Deposit</p>
																<p style="color: green;width: 30%;text-wrap:nowrap"><span>
																	+$<fmt:formatNumber type="number" maxFractionDigits="2"
																		value="${transaction.getAmount()}" /></span>
																</p>
															</c:when>
															<c:when
																test="${ transaction.getAction().equals('withdraw') }">
																<p class="mx-3" style="width: 50%;">Withdraw</p>
																<p style="color: red;width: 30%;text-wrap:nowrap">
																	-$<fmt:formatNumber type="number" maxFractionDigits="2"
																		value="${transaction.getAmount()}" />
																</p>
															</c:when>
															<c:when
																test="${ transaction.getAction().equals('transfer-in') }">
																<p class="mx-3" style="width: 50%;">Account Transfer to savings</p>
																<p style="color: red;width: 30%;text-wrap:nowrap"><span>
																	-$<fmt:formatNumber type="number" maxFractionDigits="2"
																		value="${transaction.getAmount()}" /></span>
																</p>
															</c:when>
															<c:when
																test="${ transaction.getAction().equals('transfer-out') }">
																<p class="mx-3" style="width: 50%;">Account transfer from savings</p>
																<p style="color: green;width: 30%;text-wrap:nowrap;"><span>
																	+$<fmt:formatNumber type="number" maxFractionDigits="2"
																		value="${transaction.getAmount()}" /></span>
																</p>
															</c:when>
														</c:choose>
													</div>
													<hr />
												</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
							<ul class="col flex-column my-3 action-list">
								<li><h3 class="list-group-item fw-bold">Actions</h3></li>
								<li><a href="/request" class="btn btn-warning my-3">Withdraw / Deposit</a></li>
								<li><a href="/transfer" class="btn btn-warning ">Transfer</a></li>
							</ul>
					</div>
				</div>
			</div>
			<!-- End Checking Card -->
			<!-- Savings Card -->
			<div>
				<div class="card savings-card">
					<div
						class="d-flex justify-content-between align-items-center card-header">
						<div class="px-3 py-2">
							<h4>Savings Account</h4>
							<p class="fst-italic">
								Acct #:
								<c:out value="${ savings.getAcctNumber() }" />
							</p>
						</div>
						<div class="px-3 py-2">
							<h3>
								Balance: $
								<fmt:formatNumber type="number" maxFractionDigits="2"
									value="${savings.getBalance()}" />
							</h3>
						</div>
					</div>
					<div class="card-body p-3">
							<div class="col">
								<h3><a href="/transactions" class="transactions-link">Last 3
									transactions:</a></h3>
								<c:choose>
									<c:when test="${savings.getTransactions().size() == 0}">
										<p>You have no transactions...</p>
									</c:when>
									<c:otherwise>
										<ul
											style="list-style-type: none; margin-top: 20px;" class="transactions-list">
											<c:forEach var="transaction" items="${savingsTrans}" end="2">
												<li>
													<div class="d-flex justify-content-between">
														<p>
															<fmt:formatDate pattern="MM-dd"
																value="${ transaction.getCreatedAt() }" />
														</p>
														<c:choose>
															<c:when
																test="${ transaction.getAction().equals('transfer-out') }">
																<p class="mx-3">Account Transfer</p>
																<p style="color: red;">
																	-$<fmt:formatNumber type="number" maxFractionDigits="2"
																		value="${transaction.getAmount()}" />
																</p>
															</c:when>
															<c:when
																test="${ transaction.getAction().equals('transfer-in') }">
																<p class="mx-3">Account Transfer</p>
																<p style="color: green;">
																	+$<fmt:formatNumber type="number" maxFractionDigits="2"
																		value="${transaction.getAmount()}" />
																</p>
															</c:when>
														</c:choose>
													</div>
													<hr />
												</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col my-auto action-list">
								<h6 class="fs-5">Goal:</h6>
								<c:set var="pct" scope="session"
									value="${ goal.getProgress().intValue() / goal.getGoalAmount() * 100 }" />
								<c:choose>
									<c:when test="${ goal == null }">
										<p class="fst-italic mt-3">
											You have not set a goal yet. Create your first goal <a
												href="/goals/new">here</a>.
										</p>
									</c:when>
									<c:when
										test="${ goal.getProgress().intValue() / goal.getGoalAmount() * 100 > 99 }">
										<div class="progress mt-3" role="progressbar"
											aria-label="Basic example" aria-valuenow="100"
											aria-valuemin="0" aria-valuemax="100" style="height: 30px">
											<div class="progress-bar progress-bar-striped bg-warning"
												style="width: 100%">100%!</div>
										</div>
										<p class="fst-italic mt-3">
											Congratulations! You have completed your goal of $
											<fmt:formatNumber type="number" maxFractionDigits="2"
												value="${goal.getGoalAmount()}" />
											.
										</p>
										<p>Create a new one</p>
										<form action="/${ goal.getId() }/restart" method="post">
											<input type="hidden" name="_method" value="delete">
											<button class="btn btn-warning">here</button>
										</form>
									</c:when>
									<c:otherwise>
										<div class="progress mt-3" role="progressbar"
											aria-label="Basic example" aria-valuenow="${ pct }"
											aria-valuemin="0" aria-valuemax="100" style="height: 30px">
											<div class="progress-bar progress-bar-striped bg-fuschia"
												style="width: ${pct}%">${pct}%</div>
										</div>
										<div class="d-flex justify-content-between">
											<p>
												Progress: $
												<fmt:formatNumber type="number" maxFractionDigits="2"
													value="${goal.getProgress()}" />
											</p>
											<p>
												Goal: $
												<fmt:formatNumber type="number" maxFractionDigits="2"
													value="${goal.getGoalAmount()}" />
											</p>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
		</div>
		<!-- End Main Content -->
	</div>

</body>
</html>