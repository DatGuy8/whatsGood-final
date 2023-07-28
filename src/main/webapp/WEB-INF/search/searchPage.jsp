<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<div class="w-100 bg-dark navContainer">
		<header class="navBar">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg">
				<a class="navbar-brand text-white offcanvas-header whatsGoodLogo"
					href="/"> <img src="/images/icon-whats-good.png"
					alt="whats good logo" class="logo-whats-good" width="40"
					height="40"> What's Good
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="d-flex justify-content-between w-100">

						<div class="marginLeft30">
							<!----------- Nav Links ----------->
							<ul class="navbar-nav mr-auto">


								<!-- Profile Tab -->
								<li class="nav-item dropDown"><a class="nav-link dropBtn"
									href="/profile">Profile</a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="#">Profile Page</a>
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
									href="/businesses"> Businesses </a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="#">View Businesses</a> <a
											class="dropdown-item" href="#">Add a Business</a>
									</div></li>

								<!-- Items Tab -->
								<li class="nav-item dropDown"><a class="nav-link dropBtn"
									href="/items"> Items </a>
									<div class="dropDownContent">
										<a class="dropdown-item" href="#">View Highest Rated Items</a>
										<a class="dropdown-item" href="#">Add a Item</a>
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
	<div class="container">
		<h1 class="text-center mt-2">Search Results for <span class="text-success">${param.searchParams }</span></h1>
		<h2 class="text-center m-2">${fn:length(businesses) + fn:length(items) + fn:length(users)} results</h2>
		<h3 class="text-danger">${error }</h3>

	</div>
	<div class="container">
		<h1>Businesses</h1>
		<hr/>
		<c:choose>
			<c:when test="${not empty businesses}">
				<c:forEach var="business" items="${businesses}">
					<p><a href="/business/${business.id }">${business.name}</a></p>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>No businesses found</p>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="container">
		<h1>Items</h1>
		<hr/>
		<c:choose>
			<c:when test="${not empty items}">
				<c:forEach var="item" items="${items}">
				
					<p>
						<a href="/item/${item.id }"> ${item.name}</a> - from ${item.business.name }
					</p>
					
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>No items found</p>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="container">
		<h1>Users</h1>
		<hr/>
		<c:choose>
			<c:when test="${not empty users}">
				<c:forEach var="user" items="${users}">
					<p>${user.userName}</p>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>No users found</p>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>