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
	<header>
		<div class="navbar navbar-dark betterBlue box-shadow">
			<div class="container d-flex justify-content-between">
				<a href="/" class="navbar-brand d-flex align-items-center"> <strong>What's
						Good</strong>
				</a>
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
				<form id="logoutForm" method="POST" action="/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="submit" value="Logout!" />
				</form>
			</div>
		</div>
	</header>
	<main role="main">
		<section class="jumbotron text-center"
			style="background-color: #F9F5FF;">
			<div class="container">
				<img src="${item.photosImagePath }" alt="stock photo" height="150px" />
				<h1>
					<c:out value="${item.name }" />
				</h1>
				<p>
					By <a href="/business/${item.business.id }"><c:out
							value="${item.business.name }" /></a>
				</p>
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
					<div class="rating">
						<input type="radio" id="star5" name="rating" value="5" /> <label
							for="star5" class="star">&#9733;</label> <input type="radio"
							id="star4" name="rating" value="4" /> <label for="star4"
							class="star">&#9733;</label> <input type="radio" id="star3"
							name="rating" value="3" /> <label for="star3" class="star">&#9733;</label>

						<input type="radio" id="star2" name="rating" value="2" /> <label
							for="star2" class="star">&#9733;</label> <input type="radio"
							id="star1" name="rating" value="1" /> <label for="star1"
							class="star">&#9733;</label>

						<form:textarea path="comment" placeholder="Add a comment"></form:textarea>
						<form:errors path="comment" class="text-danger" />
						<button type="submit">Add rating</button>
					</div>
				</form:form>
			</div>

			<%-- <form:form action="/menuitem/${menuItem.id}/rate" method="post"
				modelAttribute="newRating">
				<form:errors path="rating" class="text-danger" />
				<form:label path="rating">Rate this dish: </form:label>
				<form:input type="number" path="rating" max="5" step=".5" min="0" />
				<form:hidden path="menuItem" value="${menuItem.id}" />
				<form:hidden path="user" value="${userId }" />
				<button>Submit</button>
			</form:form> --%>


			<hr />
		</section>
		<div class="album backgroundColor">
			<h1 class="text-center mb-5">Reviews</h1>
			<div class="container">
				<div class="row">
					<c:forEach var="oneRating" items="${item.ratings }">
						<div class="col-md-3">
							<p>
								<img src="/uploadedImages/stockDishPhoto.jpg" alt="stock"
									height="100px" width="100px" />
							</p>
							<p>
								<c:out value="${oneRating.user.userName }" />
								rated it
							</p>
							<p>
								<c:out value="${oneRating.rating }" />
								stars
							</p>
							<p>
								<c:out value="${oneRating.comment }" />
							</p>
						</div>
					</c:forEach>

				</div>

			</div>
		</div>


	</main>
</body>
</html>