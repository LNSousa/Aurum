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
    <div class="container d-flex align-items-center flex-column">
        <!-- Page Title -->
        <div class="my-3">
            <h1>Account Money Transfer</h1>
        </div>
        <!-- End Page Title -->
        <div class="border border-dark-subtle p-5 col-6 bg-white rounded-3">
            <!-- Form -->
               <c:if test="${ error != null }">
               		<p class="text-danger"><c:out value="${ error }"/></p>
               </c:if>
               <h3>Checking account balance: $<fmt:formatNumber type="number" maxFractionDigits="2" value="${checking.getBalance()}" /></h3>
               <h3>Savings account balance: $<fmt:formatNumber type="number" maxFractionDigits="2" value="${savings.getBalance()}" /></h3>
               <form action="/process-request" method="post" class="deposit-form">
                   <label class="mt-5" for="action">Which account would you like to transfer money into?</label>
                   <div class="my-3 d-flex justify-content-around">
                       <div class="form-check">
	                       <input name="action" class="form-check-input" type="radio" value="transfer-in"/>
	                       <label class="form-check-label" for="action">Checking</label>
                       </div>
                       <div class="form-check">
	                       <input name="action" class="form-check-input" type="radio" value="transfer-out"/>
	                       <label class="form-check-label" for="action">Savings</label>
                       </div>
                   </div>
                   <div class="my-3">
                       <input name="amount" type="text" class="form-control" placeholder="Amount"/>
                   </div>
                   <div class="my-3">
                       <input name="password" type="password" class="form-control" placeholder="Password"/>
                       <label for="password" class="text-nowrap">Please enter your password for authentication</label>
                   </div>
                   <div class="d-flex justify-content-center my-4">                   	
	                   <button type="submit" class="btn btn-primary btn-lg">Submit Request</button>
                   </div>
               </form>
            <!-- End Form -->
            <!-- Past Transactions -->
            <div class="mt-5">
                <h3>Last 5 transfers</h3>
                <div class="transaction-list my-4">
                    <c:choose>
						<c:when test="${trans.size() == 0}">
							<p>You have no transactions...</p>
						</c:when>
						<c:otherwise>
							<ul style="list-style-type: none; width: 80%;">
								<c:forEach var="transaction" items="${trans}" end="4">
									<li>
										<div class="d-flex justify-content-between">
											<p><fmt:formatDate pattern="MM/dd" value="${ transaction.getCreatedAt() }"/></p>
											<c:choose>
												<c:when test="${ transaction.getAction().equals('transfer-in') }">
													<p>From Savings</p>
													<p style="color:red;">-$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
												</c:when>
												<c:when test="${ transaction.getAction().equals('transfer-out') }">
													<p>To Savings</p>
													<p style="color:green;">+$<fmt:formatNumber type="number" maxFractionDigits="2" value="${transaction.getAmount()}"/></p>
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
            </div>
            <!-- End Past Transactions -->
        </div>
    </div>
    <!-- End Main Content -->
</body>

</html>