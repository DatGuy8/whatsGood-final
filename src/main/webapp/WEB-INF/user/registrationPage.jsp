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
<style>
.background-radial-gradient {
	background-color: hsl(218, 41%, 15%);
	background-image: radial-gradient(650px circle at 0% 0%, hsl(218, 41%, 35%)
		15%, hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%,
		hsl(218, 41%, 19%) 80%, transparent 100%),
		radial-gradient(1250px circle at 100% 100%, hsl(218, 41%, 45%) 15%,
		hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%, hsl(218, 41%, 19%) 80%,
		transparent 100%);
}

#radius-shape-1 {
	height: 220px;
	width: 220px;
	top: -60px;
	left: -130px;
	background: radial-gradient(#44006b, #ad1fff);
	overflow: hidden;
}

#radius-shape-2 {
	border-radius: 38% 62% 63% 37%/70% 33% 67% 30%;
	bottom: -60px;
	right: -110px;
	width: 300px;
	height: 300px;
	background: radial-gradient(#44006b, #ad1fff);
	overflow: hidden;
}

.bg-glass {
	background-color: hsla(0, 0%, 100%, 0.9) !important;
	backdrop-filter: saturate(200%) blur(25px);
}
</style>

		<div
			class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
			<div class="row gx-lg-5 align-items-center mb-5">
				<div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
					<h1 class="my-5 display-5 fw-bold ls-tight"
						style="color: hsl(218, 81%, 95%)">
						Register to <br /> <span style="color: hsl(218, 81%, 75%)">What's
							Good</span>
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


							<p class="text-danger">
								<form:errors path="user.*" />
							</p>
							<form:form action="/register" method="post" modelAttribute="user">
								<!-- 2 column grid layout with text inputs for the first and last names --> 
								<div class="row">
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<form:input type="text" path="firstName" class="form-control" />
											<form:label class="form-label" path="firstName">First name</form:label>
											
										</div>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<form:input type="text" path="lastName" class="form-control" />
											<form:label class="form-label" path="lastName">Last name</form:label>
											
										</div>
									</div>
								</div>
								<!-- User Name -->
								<div class="form-outline mb-4">
									<form:input type="text" path="userName" class="form-control" />
									<form:label class="form-label" path="userName">User Name</form:label>
								</div>
								<!-- Email input -->
								<div class="form-outline mb-4">
									<form:input type="email" path="email" class="form-control" />
									<form:label class="form-label" path="email">Email address</form:label>
								</div>

								<!-- Password input -->
								<div class="form-outline mb-4">
									<form:input type="password" path="password"
										class="form-control" />
									<form:label class="form-label" path="password">Password</form:label>
								</div>
								<div class="form-outline mb-4">
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