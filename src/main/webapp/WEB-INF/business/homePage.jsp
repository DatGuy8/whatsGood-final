<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>What's Good</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
</head>
<body>
	<header>

		<div class="navbar navbar-dark betterBlue box-shadow">
			<div class="container d-flex justify-content-between">
				<a href="/" class="navbar-brand d-flex align-items-center"> <strong>What's
						Good</strong>
				</a>
				<form action="action_page.php">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search What's Good"
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary bg-danger" type="submit">Search</button>
						</div>
					</div>
				</form>
				<form id="logoutForm" method="POST" action="/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="submit" value="Logout!" />
				</form>
			</div>
		</div>
	</header>

	<section class="jumbotron text-center"
		style="height: 450px; background-image: url('/images/Buisness.jpg'); background-size: 70% 450px; background-repeat: no-repeat; background-position: center; background-color: #F9F5FF;">
		<div class="container">

			<h2 class="mt-3"
				style="font-weight: 800; color: #F9F5FF; border-radius: 5px;">Look
				for what food businesses have to offer and what Users are rating
				those items!</h2>
			<p>

				<!-- <a href="#" class="btn btn-primary my-2">See What's Good Nearby</a> -->
				<a href="/business/add" class="btn btn-primary my-2">Add a
					Business to What's Good</a>
			</p>
		</div>
	</section>
	<div class="album py-5 backgroundColor">
		<h1 class="text-center">Restaurants</h1>
		<div class="container mt-3">
			<div class="row">
				<c:forEach var="business" items="${businesses }">
					<div class="col-md-4">

						<div class="card mb-4 box-shadow">
							<img class="card-img-top" src="${business.photosImagePath }"
								alt="pic of food" height="300px">
							<div class="card-body">
								<p class="card-text">
									<c:out value="${business.name }" />
								</p>
								<p>
									|
									<c:out value="${business.website}" />
									|

								</p>

								<div
									class="d-flex justify-content-between align-items-center mt-2">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<a href="/business/${business.id }" class="textNone">View</a>
										</button>
									</div>
									<small class="text-muted">Average Dish Rating</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</body>
</html>