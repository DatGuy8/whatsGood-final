<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<header>
		<!--================================= NAV BAR ========================================-->
		<div class="navbar navbar-dark betterBlue box-shadow">
			<div class="container d-flex justify-content-between">

				<!---------------------WHATS GOOD LOGO-------------------- -->
				<a href="/" class="navbar-brand d-flex align-items-center"> <strong>What's
						Good</strong>
				</a>

				<!------------------------SEARCH BAR----------------------  -->
				<form action="/search" method="GET">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search What's Good" name="searchParams">
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
						<li><a href="/user/${currentUser.id }"><button
									class="btn btn-info">My Profile</button></a></li>
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
	<div class="container">
		<h1>Search Results for ${param.searchParams }</h1>
		<c:if test="${not empty param.searchParams}">
			<div>You searched for:
				${param.searchParams}</div>
		</c:if>
		<h3 class="text-danger">${error }</h3>

	</div>
	<div>
		<h1 class="text-center">Businesses</h1>
		<c:forEach var="business" items="${businesses }">
			<p>${business.name }</p>
		</c:forEach>
	</div>
	<div>
		<h1 class="text-center">Items</h1>
		<c:forEach var="item" items="${items }">
			<p>${item.name }</p>
		</c:forEach>
	</div>
	<div>
		<h1 class="text-center">Users</h1>
		<c:forEach var="user" items="${users }">
			<p>${user.userName }</p>
		</c:forEach>
	</div>

</body>
</html>