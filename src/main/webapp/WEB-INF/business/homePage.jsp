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
<link rel="stylesheet" href="/css/business/homePage.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
</head>
<body>
	<section class="section-home">
	<header>
		<!--================================= NAV BAR ========================================-->
		
			<div class="d-flex justify-content-between pt-3 navBar">
				
				<div>
				<!---------------------WHATS GOOD LOGO-------------------- -->
				<a href="/" class="navbar-brand d-flex align-items-center text-white logo-text"><img src="/images/icon-whats-good.png" alt="whats good logo" class="logo-whats-good"> <strong>What's
						Good</strong></a>
				</div>
				

				<!------------------------SEARCH BAR----------------------  -->
				<form action="/search" method="GET"
					onsubmit="return validateSearchForm()">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search What's Good" name="searchParams">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">Search</button>
						</div>
					</div>
				</form>

				<!----------------------DROP DOWN MENU WITH LOGOUT AND PROFILE PAGE LINK---------------  -->
				<div class="dropdown">
				<button class="btn"
						onclick="toggleDropdown()" aria-expanded="false">
					<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="white" class="bi bi-list" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
					</svg>
				</button>
					<ul class="dropdown-menu" id="dropdownMenu" style="display: none;">
						<li><p><a href="/user/${currentUser.id }" class="textNone">
									My Profile</a></p></li>
						<li>
							<form id="logoutForm" method="POST" action="/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> 
									<button type="submit" class="logout-link">Logout!</button>
							</form>
						</li>
					</ul>
				</div>
			
			</div>
		
	</header>
	<!--=================================END NAV BAR ========================================-->


		<div class="container text-box">
			
			<h2>
				<!-- style="font-weight: 800; color: #F9F5FF; border-radius: 5px;" -->
				Look for food ratings that businesses/restaurants have to offer and what Users are
				rating those items!
			</h2>
			<p>
				<a href="/business/add" class="btn btn-primary my-2"> Add a
					Business to What's Good </a>
			</p>
			<!-- Content to show for Admin users -->
			<c:if test="${currentUser.roles[0].name == 'ROLE_ADMIN'}">
				<p><a href="/admin" class="btn btn-primary">Admin Page</a></p>
			</c:if>
		</div>
	</section>

	<!--================================CAROUSEL======================================  -->
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
	<!--================================END CAROUSEL======================================  -->

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

</body>
</html>