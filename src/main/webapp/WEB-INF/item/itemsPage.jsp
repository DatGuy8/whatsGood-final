<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>What's Good</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
</head>
<body>
	<div class="w-100 bg-dark navContainer">
		<header class="navBar">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg">
				<a class="navbar-brand text-white offcanvas-header whatsGoodLogo"
					href="/"> <img src="/images/whatsgoodlogo2.png" height="60" />
				</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="d-flex flex-column flex-md-row justify-content-between w-100">

						<div class="marginLeft30">
							<!----------- Nav Links ----------->
							<ul class="navbar-nav mr-auto">


								<!-- Profile Tab -->
								<li class="nav-item dropDown"><a class="nav-link dropBtn"
									href="/user/profile">Profile</a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="/user/profile">Profile Page</a>
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
										<a class="dropdown-item" href="/">View
											Businesses</a> <a class="dropdown-item" href="/business/add">Add
											a Business</a>
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


	<div class="container mt-3">
		<h1 class="text-center">All Items on What's Good</h1>
		
		<div class="filter-container d-flex w-100 flex-row-reverse my-3">
			<div>
			<label for="filter">Select Filter:</label>
				<select id="filter" class="form-select w-100">
					<option value="none">Select...</option>
					<option value="highestPrice">Highest Price</option>
					<option value="lowestPrice">Lowest Price</option>
					<option value="highestRated">Highest Rated</option>
					<option value="lowestRated">Lowest Rated</option>
				</select>
			</div>
		</div>
		<div class="album">
			<div class="row" id="itemsContainer">
				<c:forEach var="item" items="${items }">
					<div class="col-md-3 itemCards" data-price="${item.price }"
						data-rating="${item.averageRating }">
						<div class="card mb-3">
							<c:if test="${item.photos[0].filePath != null }">
								<div class="w-100 d-flex justify-content-center"
									style="height: 200px">
									<img class="card-img-top" src="${item.photos[0].filePath }"
										alt="table food" />
								</div>
							</c:if>
							<div class="card-body">
								<p class="card-text">
									<c:out value="${item.name }" />
								</p>
								<p>
									<a href="/business/${item.business.id }">${item.business.name }</a>
								</p>
								<p>
									$
									<c:out value="${item.price }" />
								</p>
								<c:choose>
									<c:when test="${fn:length(item.ratings) > 0}">
										<div class="d-flex gap-1">
											<div>
												<c:forEach var="i" begin="1" end="${item.averageRating}">
													<i class="fa fa-star starAverage"></i>
													<!-- Replace with your star icon class -->
												</c:forEach>
											</div>
											<p>(${fn:length(item.ratings)} Ratings)</p>
										</div>

									</c:when>
									<c:otherwise>
										<p>No ratings yet</p>
									</c:otherwise>
								</c:choose>
								<div class="btn-group">
									<a href="/item/${item.id }">
										<button type="button" class="btn btn-sm btn-outline-secondary">See
											Ratings/More Pictures</button>
									</a>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>


			</div>
		</div>
	</div>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="module" src="/js/item/itemsPage.js"></script>
	<script type="module" src="/js/script.js"></script>
</body>
</html>