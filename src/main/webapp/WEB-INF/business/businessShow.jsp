<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>What's Good at ${business.name }</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=${googleApiKey1 }&libraries=places"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="navbar navbar-dark betterBlue box-shadow">
		<div class="container d-flex justify-content-between">
			<a href="/" class="navbar-brand d-flex align-items-center"> <strong>What's
					Good</strong>
			</a>
			<form action="action_page.php">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Search What's Good" aria-label="Recipient's username"
						aria-describedby="basic-addon2">
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

		<!--================================CAROUSEL======================================  -->
	<div id="myCarousel" class="carousel slide mb-6"
			data-bs-ride="carousel" data-bs-theme="light">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<c:forEach var="photo" items="${business.photos }" varStatus="status">
				<div class="carousel-item${status.first ? ' active': '' }">
					<div class="d-flex justify-content-center">
						<img
							src="<c:out value="${photo.filePath }"/>"
							height="500px" class="mx-auto">
					</div>
					<div class="container">
						<div class="carousel-caption text-end">
							<h1><c:out value="${business.name }"/></h1>
							<p class="opacity-75"><c:out value="${business.website }"/></p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Add a photo to ${business.name }</a>
							</p>
						</div>
					</div>
				</div>
				</c:forEach>
				
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon bg-black "
					aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon  bg-black" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	<!--================================END CAROUSEL======================================  -->
			<h1 class="text-center">
				<c:out value="${business.name }" />
			</h1>
			<!--------------GOOGLE MAP--------------------  -->
			<div id="map"></div>
			<p class="text-center">
				<a href="#" id="getDirections">Get Directions from Google</a>
			</p>
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
		<div class="container">
			<div class="row">
				<h3>
					<c:out value="${business.name }" />
				</h3>
				<hr />
				<c:forEach var="item" items="${business.items }">
					<div class="col-md-2">
						<div class="card">
							<img class="card-img-top" src="${item.photos[0].filePath }"
								alt="table food" height="125px" width="125px" />
							<div class="card-body">
								<p class="card-text">
									<c:out value="${item.name }" />
								</p>
								<p>
									$
									<c:out value="${item.price }" />
								</p>
								<c:choose>
									<c:when test="${fn:length(item.ratings) > 0}">
										<c:forEach var="i" begin="1" end="${item.averageRating}">
											<i class="fa fa-star starAverage"></i>
											<!-- Replace with your star icon class -->
										</c:forEach>
										<p>Number of Ratings: ${fn:length(item.ratings)}</p>
									</c:when>
									<c:otherwise>
										<p>No ratings yet</p>
									</c:otherwise>
								</c:choose>
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary">
										<a href="/item/${item.id }">View Dish</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>



			</div>

		</div>


	</main>
	
	<script type="module" src="/js/businessShow/index.js"></script>
	<script>
  // Define the latitude and longitude variables
  		var latitude = ${business.latitude};
  		var longitude = ${business.longitude};
	</script>
</body>
</html>