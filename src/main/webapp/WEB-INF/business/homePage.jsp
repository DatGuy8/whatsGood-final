<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What's Good</title>
<link rel="icon" href="/images/icon-whats-good.png"
	class="logo-whats-good" />
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
				<nav class="navbar navbar-expand-lg paddingBottom60px">
					<a class="navbar-brand text-white offcanvas-header whatsGoodLogo"
						href="/"> <img src="/images/whatsgoodlogo2.png" height="60" />
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<div
							class="d-flex flex-column flex-md-row justify-content-between w-100">

							<div class="marginLeft30">
								<!----------- Nav Links ----------->
								<ul class="navbar-nav mr-auto">


									<!-- Profile Tab -->
									<li class="nav-item dropDown"><a class="nav-link dropBtn"
										href="/user/profile">Profile</a>
										<div class="dropDownContent">
											<a class="dropdown-item" href="/user/profile">Profile
												Page</a>
											<form id="logoutForm" method="POST" action="/logout"
												class="dropdown-item form-logout-button">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
												<button type="submit" class="logout-link">Logout</button>
											</form>
										</div></li>

									<!-- Admin Tab -->
									<c:if test="${currentUser.roles[0].name == 'ROLE_ADMIN'}">
										<li class="nav-item dropDown"><a href="/admin"
											class="nav-link dropBtn">Admin</a></li>
									</c:if>

									<!-- Business Tab -->
									<li class="nav-item dropDown"><a class="nav-link dropBtn"
										href="/"> Businesses </a>
										<div class="dropDownContent">
											<a class="dropdown-item" href="/">View Businesses</a> <a
												class="dropdown-item" href="/business/add">Add a
												Business</a>
										</div></li>

									<!-- Items Tab -->
									<li class="nav-item dropDown"><a class="nav-link dropBtn"
										href="/items"> Items </a>
										<div class="dropDownContent">
											<a class="dropdown-item" href="/items">View Highest Rated
												Items</a>
										</div></li>

								</ul>
							</div>

							<!-- Search Bar -->
							<form class="d-flex" action="/search" method="get">
								<input class="form-control me-2" type="text"
									placeholder="Search What's Good" aria-label="Search"
									name="searchParams">
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>

						</div>
					</div>

				</nav>


			</header>
		</div>
		<!--=================================END NAV BAR ========================================-->

		<div id="wrapper" class="fade-in">
			<div id="intro">

				<h1 style="width: 60%;" class="d-none d-lg-block">Look for
					Items Users have reviewed from Businesses, or help the community by
					adding business or items reviews to What's Good!</h1>
				<h2 class="d-lg-none">Look for Items Users have reviewed from
					Businesses, or help the community by adding business or items
					reviews to What's Good!</h2>
				<p>
					<a href="/business/add" class="btn btn-success my-2"> Recommend
						a Business</a>
				</p>

			</div>
		</div>
	</section>

	<!--CAROUSEL -->
	<div class="w-100">
		<div class="featureLogoDiv mx-auto rounded m-3">
			<h1 class="text-center fontWeight900 diffFont">FEATURED
				BUSINESSES</h1>
		</div>

	</div>

	<div id="myCarousel" class="carousel slide mb-6"
		data-bs-ride="carousel" data-bs-theme="light">

		<div class="carousel-inner">
			<c:forEach var="business" items="${featuredBusinesses }"
				varStatus="status">
				<div class="carousel-item${status.first ? ' active': '' }">
					<div class="d-flex justify-content-center">
						<a href="/business/${business.id }"> <img
							src="${business.photos[0].filePath }" height="500px"
							class="mx-auto rounded">
						</a>
					</div>
					<div class="container">
						<div class="text-center mt-1">
							<h1>
								<a href="/business/${business.id }"
									class="text-decoration-none text-dark"> <c:out
										value="${business.name }" />
								</a>
							</h1>
							<p class="opacity-75">
								<a href="/business/${business.id }"
									class="text-decoration-none text-success"> <c:out
										value="${business.address.city }" />
								</a>
							</p>

						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon filterInvert"
				aria-hidden="true"></span> <span class="">Previous</span>
		</button>
		<button class="carousel-control-next filterInvert" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!--END CAROUSEL-->
	<hr />

	<!-- ==================================LISTING OF BUSINESSES=================================== -->
	<div class="album py-5 backgroundColor">
		<div class="w-100">
			<div class="featureLogoDiv mx-auto rounded m-3">
				<h1 class="text-center fontWeight900 diffFont">What's Good
					Businesses</h1>
			</div>

		</div>
		<div class="w-75 mt-2 mx-auto">
			<div class="mt-2 my-2 d-flex justify-content-between">
				<button id="sortHigh" onclick="sortHighestBusiness()"
					class="btn btn-success">Sort By Highest Average</button>
				<input type="text" id="filterInput" placeholder="What's Good At..."
					class="form-control mb-3" style="width: 300px;">
			</div>
			<div class="row" id="businessContainer">
				<div id="noResultsMessage" style="display: none; height: 300px">
					<h4 class="text-center">No Matching Business</h4>
				</div>
				<!--------------------LOOPING THROUGH THE LIST OF BUSINESSES--------------------- -->
				<c:forEach var="business" items="${businesses }">
					<!--SET TO FORMAT RATING -->
					<c:set var="formatRating" value="${business.averageRating }" />
					<div class="col-md-3 businessCards"
						data-rating="${business.averageRating }">
						<!--  -->
						<div class="card mb-4 box-shadow">
							<div class="w-100 d-flex justify-content-center"
								style="height: 300px;">
								<img class="card-img-top" src="${business.photos[0].filePath }"
									alt="pic of food">
							</div>
							<div class="card-body">

								<p class="card-text">
									<c:out value="${business.name }" />
								</p>

								<p class="text-success">${business.address.city }</p>

								<div
									class="d-flex justify-content-between align-items-center mt-2">
									<div class="btn-group">
										<a href="/business/${business.id }" class="textNone">
											<button type="button"
												class="btn btn-sm btn-outline-secondary">View</button>
										</a>
									</div>
									<c:choose>
										<c:when test="${business.averageRating == null }">
											<small class="text-muted">No Ratings Yet</small>
										</c:when>
										<c:otherwise>

											<div>
												<c:forEach var="i" begin="1" end="${business.averageRating}">
													<i class="fa fa-star starAverage"></i>
													<!-- Replace with your star icon class -->
												</c:forEach>
												<small class="text-muted"><fmt:formatNumber
														type="number" maxFractionDigits="2"
														value="${formatRating}" /> Average Dish Rating</small>
											</div>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!--------------------END LOOPING THROUGH THE LIST OF BUSINESSES--------------------- -->

			</div>
		</div>

	</div>

	<div style="height: 500px"></div>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/script.js"></script>
	<script type="text/javascript" src="/js/business/homePage.js"></script>
</body>
</html>