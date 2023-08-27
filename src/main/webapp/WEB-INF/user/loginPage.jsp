<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- =========JSTL TAGS==========-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ========For Forms ============-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login to see What's Good</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
</head>
<body>
	<!-- Section: Design Block -->
	<section class="text-center text-lg-start w-75 mx-auto mt-4">

		<div class="card mb-3">
			<div class="row g-0 d-flex align-items-center">
				<div class="col-lg-4 d-none d-lg-flex">
					<img src="/images/stockDishPhoto.jpg" alt="login photo"
						class="w-100 rounded-t-5 rounded-tr-lg-0 rounded-bl-lg-5" />
				</div>
				<div class="col-lg-8">
					<div class="card-body py-5 px-md-5">

						<form action="/login" method="post">
							<!-- Email input -->
							<h1 class="text-center">Login to What's Good</h1>
							<c:if test="${logoutMessage != null}">
								<div class="alert alert-success"><c:out value="${logoutMessage}"></c:out></div>
							</c:if>
							<c:if test="${errorMessage != null}">
								<div class="alert alert-danger"><c:out value="${errorMessage}"></c:out></div>
							</c:if>
							<div class="form-outline mb-4 mt-5">
								<input type="email" name="email" class="form-control" /> <label
									class="form-label" for="email">Email address</label>
							</div>

							<!-- Password input -->
							<div class="form-outline mb-4">
								<input type="password" name="password" class="form-control" />
								<label class="form-label" for="password">Password</label>

							</div>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<!-- Submit button -->
							<button class="btn btn-primary btn-block mb-4">Sign in</button>

						</form>
						<p>
							Not Registered? <a href="/register">Registration Page</a>
						</p>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Section: Design Block -->
</body>
</html>