<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
</body>
</html>