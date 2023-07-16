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
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
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
					<a class="navbar-brand text-white offcanvas-header whatsGoodLogo" href="/"> 
						<img 
							src="/images/icon-whats-good.png"
							alt="whats good logo" 
							class="logo-whats-good" 
							width="40"
							height="40">
							What's Good
					</a>
					<button 
						class="navbar-toggler" 
						type="button" 
						data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" 
						aria-expanded="false"
						aria-label="Toggle navigation"
					>
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<div class="d-flex justify-content-between w-100">
							
							<div class="marginLeft30">
							<!----------- Nav Links ----------->
							<ul class="navbar-nav mr-auto">
							

								<!-- Profile Tab -->
								<li class="nav-item dropDown">
									<a class="nav-link dropBtn" href="/profile">Profile</a>
										<div class="dropDownContent">
											<a class="dropdown-item" href="#">Profile Page</a>
											<form 
												id="logoutForm" 
												method="POST" 
												action="/logout"
												class="dropdown-item form-logout-button"
											>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<button type="submit" class="logout-link">Logout</button>
											</form>
										</div>
								</li>
								
								<!-- Admin Tab -->
								<c:if test="${currentUser.roles[0].name == 'ROLE_ADMIN'}">
									<li class="nav-item dropDown">
										<a href="/admin" class="nav-link dropBtn">Admin</a>
									</li>
								</c:if>
								
								<!-- Business Tab -->
								<li class="nav-item dropDown"><a class="nav-link dropBtn"
									href="/businesses"> Businesses </a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="#">View Businesses</a> <a
											class="dropdown-item" href="#">Add a Business</a>
									</div>
								</li>
								
								<!-- Items Tab -->	
								<li class="nav-item dropDown"><a class="nav-link dropBtn"
									href="/items"> Items </a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="#">View Highest Rated Items</a>
										<a class="dropdown-item" href="#">Add a Item</a>
									</div>
								</li>
									
							</ul>
							</div>
							
							<!-- Search Bar -->
							<form class="d-flex" action="/search" method="get">
								<input 
									class="form-control me-2" 
									type="text"
									placeholder="Search What's Good" 
									aria-label="Search"
									name="searchParams"
								>
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
					</div>

				</nav>


			</header>
		</div>
		<!--=================================END NAV BAR ========================================-->


		<div class="container text-box">

			<h2 style="font-weight: 400; color: #ebf2fa; border-radius: 5px;">
				Look for Items Users have reviewed from Businesses in San Jose, or help the community by adding business or items reviews to What's Good
			</h2>
			<p>
				<a href="/business/add" class="btn btn-success my-2"> 
				Recommend a Business</a>
			</p>

		</div>
	</section>

	<!--CAROUSEL -->
	<h2 class="text-center mt-3 text-success">Featured Businesses</h2>
	<div id="myCarousel" class="carousel slide mb-6"
		data-bs-ride="carousel" data-bs-theme="light">

		<div class="carousel-inner">
			<c:forEach var="business" items="${businesses }" varStatus="status">
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
									class="text-decoration-none text-dark"> <c:out
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
			<span class="carousel-control-prev-icon filterInvert" aria-hidden="true"></span> <span
				class="">Previous</span>
		</button>
		<button class="carousel-control-next filterInvert" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
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

		</div>

	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/script.js"></script>
</body>
</html>