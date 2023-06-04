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
		<!--================================= NAV BAR ========================================-->
		<div class="navbar navbar-dark betterBlue box-shadow">
			<div class="container d-flex justify-content-between">

				<!---------------------WHATS GOOD LOGO-------------------- -->
				<a href="/" class="navbar-brand d-flex align-items-center"> <strong>What's
						Good</strong>
				</a>

				<!------------------------SEARCH BAR----------------------  -->
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

				<!----------------------DROP DOWN MENU WITH LOGOUT AND PROFILE PAGE LINK---------------  -->
				<div class="dropdown">
					<button class="dropdown-toggle btn btn-info"
						onclick="toggleDropdown()" aria-expanded="false">
						<c:out value="${currentUser.userName }" />
					</button>
					<ul class="dropdown-menu" id="dropdownMenu" style="display: none;">
						<li><a href="/user/${currentUser.id }">My Profile</a></li>
						<li>
							<form id="logoutForm" method="POST" action="/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" value="Logout!"
									class="btn btn-info" />
							</form>
						</li>
					</ul>
				</div>

			</div>
		</div>
	</header>
	<!--=================================END NAV BAR ========================================-->

	<!--================================CAROUSEL======================================  -->
	<section class="jumbotron text-center"
		style="height: 450px; background-image: url('/images/Buisness.jpg'); background-size: 70% 450px; background-repeat: no-repeat; background-position: center; background-color: grey;">
		<div class="container">
			<h2 class="mt-3"
				style="font-weight: 800; color: #F9F5FF; border-radius: 5px;">
				Look for what food businesses have to offer and what Users are
				rating those items!</h2>
			<p>
				<a href="/business/add" class="btn btn-primary my-2"> Add a
					Business to What's Good </a>
			</p>
		</div>
	</section>
	<!--================================END CAROUSEL======================================  -->

	<!-- ==================================LISTING OF BUSINESSES=================================== -->
	<div class="album py-5 backgroundColor">
		<h1 class="text-center">Businesses</h1>
		<div class="container mt-3">
			<div class="row">
				<!--------------------LOOPING THROUGH THE LIST OF BUSINESSES--------------------- -->
				<c:forEach var="business" items="${businesses }">
					<div class="col-md-4">
						<!--  -->
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
										<a href="/business/${business.id }" class="textNone">
											<button type="button"
												class="btn btn-sm btn-outline-secondary">View</button>
										</a>
									</div>
									<small class="text-muted">Average Dish Rating</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!--------------------END LOOPING THROUGH THE LIST OF BUSINESSES--------------------- -->

			</div>
		</div>

		<!-- HIGHEST RATED DISHES  -->
		<div>
			<h1 class="text-center">Highest Rated Dishes</h1>
			<div class="container mt-3">
				<div class="row">
				<c:forEach var="item" items="${sortedItems }">
					<div class="col-3 my-3">
						<!--  -->
						<div class="card box-shadow" style="width: 18rem;">

							<img class="card-img-top" src="${item.photosImagePath }" alt="pic of food"
								height="300px">

							<div class="card-body">

								<p class="card-text"><c:out value="${item.name}"/></p>

								<p>| <c:out value="${item.business.name}"/> |</p>

								<div
									class="d-flex justify-content-between align-items-center mt-2">
									<div class="btn-group">
										<a href="#" class="textNone">
											<button type="button"
												class="btn btn-sm btn-outline-secondary">View</button>
										</a>
									</div>
									<small class="text-muted"><c:out value="${item.averageRating}"/> stars</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
		<!-- HIGHEST RATED DISHES  -->
		<div>
			<h1 class="text-center">Top 8 Dishes</h1>
			<div class="container mt-3">
				<div class="row">
				<c:forEach var="item" begin="1" end="8">
					<div class="col-3 my-3">
						
						<div class="card box-shadow" style="width: 18rem;">

							<img class="card-img-top" src="https://images.pexels.com/photos/16960416/pexels-photo-16960416/free-photo-of-deniz-manzarasi.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="pic of food"
								height="300px">

							<div class="card-body">

								<p class="card-text"><c:out value="${item}"/></p>

								<p>| <c:out value="${item}"/> |</p>

								<div
									class="d-flex justify-content-between align-items-center mt-2">
									<div class="btn-group">
										<a href="#" class="textNone">
											<button type="button"
												class="btn btn-sm btn-outline-secondary">View</button>
										</a>
									</div>
									<small class="text-muted"><c:out value="${item}"/> stars</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>