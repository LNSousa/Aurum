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
<link rel="stylesheet" href="../css/main.css">
<script src="https://kit.fontawesome.com/bde4faa4fd.js" crossorigin="anonymous"></script>
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
    <div class="container transactions-page">
        <h1 class="my-3">All Transactions</h1>
        <div class="col-5 border border-dark rounded-3 p-3 me-5 d-inline-block align-top bg-white">
            <div class="d-flex justify-content-between flex-column flex-md-row">
                <h4>Checking Account</h4>
                <p>Acct #: <c:out value="${ c.getAcctNumber() }"/></p>
            </div>
            <ul class="transaction-list">
                <c:forEach var="transaction" items="${ cTrans }">
                <li>
					<div class="d-flex justify-content-between flex-column flex-md-row">
						<p style=""><fmt:formatDate pattern="MM-dd" value="${ transaction.getCreatedAt() }"/></p>
						<c:choose>
							<c:when test="${ transaction.getAction().equals('deposit') }">
								<p class="trans-desc">Deposit</p>
								<p style="color:green;" class="amount">+$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
							</c:when>
							<c:when test="${ transaction.getAction().equals('withdraw') }">
								<p class="trans-desc">Withdraw</p>
								<p style="color:red;" class="amount">-$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
							</c:when>
							<c:when test="${ transaction.getAction().equals('transfer-in') }">
								<p class="trans-desc">Account Transfer</p>
								<p style="color:red;" class="amount">-$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
							</c:when>
							<c:when test="${ transaction.getAction().equals('transfer-out') }">
								<p class="trans-desc">Account Transfer</p>
								<p style="color:green;" class="amount">+$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
							</c:when>
						</c:choose>
					</div>
					<hr />
				</li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-5 border border-dark rounded-3 p-3 d-inline-block align-top bg-white">
            <div class="d-flex justify-content-between flex-column flex-md-row">
                <h4>Savings Account</h4>
                <p>Acct #: <c:out value="${ s.getAcctNumber() }"/></p>
            </div>
            <ul class="transaction-list">
                <c:forEach var="transaction" items="${ sTrans }">
                <li>
					<div class="d-flex justify-content-between flex-column flex-md-row">
						<p class="trans-date"><fmt:formatDate pattern="MM-dd" value="${ transaction.getCreatedAt() }"/></p>
						<c:choose>
							<c:when test="${ transaction.getAction().equals('deposit') }">
								<p class="trans-desc">Deposit</p>
								<p style="color:green;" class="amount">+$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
							</c:when>
							<c:when test="${ transaction.getAction().equals('withdraw') }">
								<p class="trans-desc">Withdraw</p>
								<p style="color:red;" class="amount">-$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
							</c:when>
							<c:when test="${ transaction.getAction().equals('transfer-in') }">
								<p class="trans-desc">Account Transfer</p>
								<p style="color:red;" class="amount">-$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
							</c:when>
							<c:when test="${ transaction.getAction().equals('transfer-out') }">
								<p class="trans-desc">Account Transfer</p>
								<p style="color:green;" class="amount">+$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
							</c:when>
						</c:choose>
					</div>
					<hr />
				</li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!-- End Main Content -->
</body>

</html>