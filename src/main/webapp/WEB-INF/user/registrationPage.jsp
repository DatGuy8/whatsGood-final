<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register to What's Good</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Section: Design Block -->
	<section class="background-radial-gradient overflow-hidden">

		<div
			class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
			<div class="row gx-lg-5 align-items-center mb-5">
				<div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
					<h1 class="my-5 display-5 fw-bold ls-tight"
						style="color: hsl(218, 81%, 95%)">
						Register to <br /> <a href="/" class="text-decoration-none"><span style="color: hsl(218, 81%, 75%)">What's
							Good</span></a>
					</h1>
					<p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
						By signing up you are able to add a restaurant, review dishes, and
						be part of our growing community!</p>
				</div>

				<div class="col-lg-6 mb-5 mb-lg-0 position-relative">
					<div id="radius-shape-1"
						class="position-absolute rounded-circle shadow-5-strong"></div>
					<div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

					<div class="card bg-glass">
						<div class="card-body px-4 py-5 px-md-5">
						
							<form:form action="/register" method="post" modelAttribute="user">
								<!-- User Name -->
								<div class="form-outline mb-4">
									<form:errors path="userName" class="text-danger" />
									<form:input type="text" path="userName" class="form-control" />
									<form:label class="form-label" path="userName">User Name</form:label>								
								</div>
								<!-- Email input -->
								<div class="form-outline mb-4">
									<form:errors path="email" class="text-danger" />
									<form:input type="email" path="email" class="form-control" />
									<form:label class="form-label" path="email">Email address</form:label>
								</div>

								<!-- Password input -->
								<div class="form-outline mb-4">
								<form:errors path="password" class="text-danger" />
									<form:input type="password" path="password"
										class="form-control" />
									<form:label class="form-label" path="password">Password</form:label>
								</div>
								<div class="form-outline mb-4">
								<form:errors path="confirm" class="text-danger" />
									<form:input type="password" path="confirm" class="form-control" />
									<form:label class="form-label" path="confirm">Confirm Password</form:label>
								</div>


								<!-- Submit button -->
								<button type="submit" class="btn btn-primary btn-block mb-4">
									Sign up</button>

								<p>
									Already Registered? <a href="/login">Login page</a>
								</p>




							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Section: Design Block -->
</body>
</html>