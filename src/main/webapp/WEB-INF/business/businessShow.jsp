<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>What's Good at ${business.name }</title>
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
			style="height: 450px; background-image: url('${business.photosImagePath}'); background-repeat: no-repeat; background-position: center; background-color: #F9F5FF;">

		</section>
		<div class="container">
			<h1 class="text-center">
				<c:out value="${business.name }" />
			</h1>
			
			<h4 class="text-center">
				<a href="#" style="color: blue;"><c:out
						value="${business.address }" /></a>
			</h4>
			<p class="text-center">
				<a href="/business/${business.id }/item/new">Add to Menu</a>
			</p>
		</div>
		<div class="album py-3 backgroundColor">
			<h1 class="text-center">Menu</h1>


		</div>
		<c:forEach var="item" items="${business.items }">
			<img alt="${item.name }" src="${item.photosImagePath }" height="100px">
			<c:out value="${item.name }" />
		</c:forEach>


	</main>
</body>
</html>