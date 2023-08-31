<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- ========For Forms ============-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What's Good</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
										<a class="dropdown-item" href="/">View Businesses</a> <a
											class="dropdown-item" href="/business/add">Add a Business</a>
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


	<main role="main">
		<section class="text-center">
			<div class="container mt-3">
				<div class="d-flex justify-content-center gap-3">
					<c:forEach var="item" items="${ item.photos}">
						<img src="${item.filePath }" alt="stock photo" height="250px" />
					</c:forEach>
				</div>
				<h1 class="mt-3">
					<c:out value="${item.name }" />
				</h1>
				<c:if test="${not empty successMessage}">
					<div class="alert alert-success">${successMessage}</div>
				</c:if>
				<p>
					By <a href="/business/${item.business.id }"><c:out
							value="${item.business.name }" /></a>
				</p>
				
				<p>Description: ${item.description }</p>
				
				<p>
					<c:choose>
						<c:when test="${fn:length(item.ratings) > 0}">
							<fmt:formatNumber value="${averageRating}" pattern="#0.00"
								var="formattedRating" />
							<c:out value="${formattedRating}" />
					out of 5 stars (
					<c:if test="${fn:length(item.ratings) > 0}">
						${fn:length(item.ratings)}
					</c:if>
					reviews )
					</c:when>
						<c:otherwise>
							<p>No ratings yet</p>
						</c:otherwise>
					</c:choose>
				</p>
				<form:form action="/item/${item.id}" method="post"
					modelAttribute="itemRating">
					<h3 class="text-center">Add a Review?</h3>
					<div class="rating">
						<div class="form-group">
							<input type="radio" id="star5" name="rating" value="5" /> <label
								for="star5" class="star">&#9733;</label> <input type="radio"
								id="star4" name="rating" value="4" /> <label for="star4"
								class="star">&#9733;</label> <input type="radio" id="star3"
								name="rating" value="3" /> <label for="star3" class="star">&#9733;</label>

							<input type="radio" id="star2" name="rating" value="2" /> <label
								for="star2" class="star">&#9733;</label> <input type="radio"
								id="star1" name="rating" value="1" /> <label for="star1"
								class="star">&#9733;</label>
						</div>
						<form:textarea path="comment" placeholder="Add a comment"
							class="form-control"></form:textarea>
						<form:errors path="comment" class="text-danger" />
						<button type="submit" class="btn btn-success">Submit
							Review</button>
					</div>

					<form:errors path="rating" class="text-danger" />
					<form:errors path="comment" class="text-danger" />

				</form:form>
			</div>


		</section>
		<div class="album backgroundColor">
			<h1 class="text-center m-3">Reviews</h1>
			<div class="container">
				<div>
					<c:forEach var="oneRating" items="${item.ratings }">
						<div>

							<p>
								<a href="/user/${oneRating.user.id }">${oneRating.user.userName }</a>

							</p>
							<p>
								<c:out value="${oneRating.comment }" />
							</p>

							<c:forEach var="i" begin="1" end="${oneRating.rating}">

								<i class="fa fa-star starAverage"></i>

							</c:forEach>
							reviewed on
							<fmt:formatDate value="${oneRating.createdAt}"
								pattern="MMMM dd, yyyy, h:mm a" />

						</div>

						<hr />
					</c:forEach>

				</div>


			</div>
		</div>


	</main>
	<div style="height: 500px"></div>
</body>
</html>