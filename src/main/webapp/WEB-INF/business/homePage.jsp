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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/business/homePage.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
</head>
<body>
	<section class="section-home">
		<div class="w-100 navContainer">
			<header class="navBar">
				<!-- Navbar -->

				<nav class="navbar navbar-expand-lg">
					<a class="navbar-brand text-white offcanvas-header whatsGoodLogo" href="/"> <img
						src="/images/icon-whats-good.png" alt="whats good logo"
						class="logo-whats-good" width="40" height="40">What's Good
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<div class="d-flex justify-content-between w-100">
							<ul class="navbar-nav mr-auto">


								<li class="nav-item dropDown"><a class="nav-link dropBtn"
									href="/profile"> Profile </a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="#">Profile Page</a>
										<form id="logoutForm" method="POST" action="/logout"
											class="dropdown-item form-logout-button">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
											<button type="submit" class="logout-link">Logout</button>
										</form>
									</div></li>
								<li class="nav-item dropDown"><a class="nav-link dropBtn"
									href="/businesses"> Businesses </a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="#">View Businesses</a> <a
											class="dropdown-item" href="#">Add a Business</a>
									</div></li>
								<li class="nav-item dropDown"><a class="nav-link dropBtn"
									href="/items"> Items </a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="#">View Highest Rated Items</a>
										<a class="dropdown-item" href="#">Add a Item</a>
									</div></li>
							</ul>
							<form class="d-flex">
								<input class="form-control me-2" type="search"
									placeholder="Search What's Good" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
					</div>

				</nav>


			</header>
		</div>
		<!--=================================END NAV BAR ========================================-->


		<div class="container text-box">

			<h2>
				<!-- style="font-weight: 800; color: #F9F5FF; border-radius: 5px;" -->
				Look for food ratings that businesses/restaurants have to offer and
				what Users are rating those items!
			</h2>
			<p>
				<a href="/business/add" class="btn btn-success my-2"> Add a
					Business</a>
			</p>
			<!-- Content to show for Admin users -->
			<c:if test="${currentUser.roles[0].name == 'ROLE_ADMIN'}">
				<p>
					<a href="/admin" class="btn btn-primary">Admin Page</a>
				</p>
			</c:if>
		</div>
	</section>

	<!--CAROUSEL -->
	<h2 class="text-center">Featured Businesses</h2>
	<div id="myCarousel" class="carousel slide mb-6"
		data-bs-ride="carousel" data-bs-theme="light">

		<div class="carousel-inner">
			<c:forEach var="business" items="${businesses }" varStatus="status">
				<div class="carousel-item${status.first ? ' active': '' }">
					<div class="d-flex justify-content-center">
						<img src="<c:out value="${business.photos[0].filePath }"/>"
							height="500px" class="mx-auto">
					</div>
					<div class="container">
						<div class="carousel-caption text-end">
							<h1>
								<c:out value="${business.name }" />
							</h1>
							<p class="opacity-75">
								<c:out value="${business.website }" />
							</p>
							<p>
								<a class="btn btn-lg btn-primary"
									href="/business/${business.id }">View Business</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon bg-black " aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon  bg-black" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<!--END CAROUSEL-->

	<!-- ==================================LISTING OF BUSINESSES=================================== -->
	<div class="album py-5 backgroundColor">
		<h1 class="text-center">Businesses Near You?</h1>
		<div class="container mt-3">
			<div class="row">
				<!--------------------LOOPING THROUGH THE LIST OF BUSINESSES--------------------- -->
				<c:forEach var="business" items="${businesses }">
					<div class="col-md-4">
						<!--  -->
						<div class="card mb-4 box-shadow">

							<img class="card-img-top" src="${business.photos[0].filePath }"
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
			<h1 class="text-center">Highly Rated Dishes</h1>
			<div class="container mt-3">
				<div class="row">
					<c:forEach var="item" items="${sortedItems }">
						<div class="col-3 my-3">
							<!--  -->
							<div class="card box-shadow" style="width: 18rem;">

								<img class="card-img-top" src="${item.photos[0].filePath }"
									alt="pic of food" height="300px">

								<div class="card-body">

									<p class="card-text">
										<c:out value="${item.name}" />
									</p>

									<p>
										|
										<c:out value="${item.business.name}" />
										|
									</p>

									<div
										class="d-flex justify-content-between align-items-center mt-2">
										<div class="btn-group">
											<a href="#" class="textNone">
												<button type="button"
													class="btn btn-sm btn-outline-secondary">View</button>
											</a>
										</div>
										<small class="text-muted"><c:out
												value="${item.averageRating}" /> stars</small>
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

								<img class="card-img-top"
									src="https://images.pexels.com/photos/16960416/pexels-photo-16960416/free-photo-of-deniz-manzarasi.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
									alt="pic of food" height="300px">

								<div class="card-body">

									<p class="card-text">
										<c:out value="${item}" />
									</p>

									<p>
										|
										<c:out value="${item}" />
										|
									</p>

									<div
										class="d-flex justify-content-between align-items-center mt-2">
										<div class="btn-group">
											<a href="#" class="textNone">
												<button type="button"
													class="btn btn-sm btn-outline-secondary">View</button>
											</a>
										</div>
										<small class="text-muted"><c:out value="${item}" />
											stars</small>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="/js/script.js"></script>
</body>
</html>