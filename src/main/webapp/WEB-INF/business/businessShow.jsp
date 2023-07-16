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
	src="https://maps.googleapis.com/maps/api/js?key=${googleApiKey }&libraries=places"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="w-100 bg-dark navContainer">
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

	<main role="main">
		<h1 class="text-center m-3">${business.name }</h1>
		<!--================================CAROUSEL======================================  -->
		<div id="myCarousel" class="carousel slide"
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
				<c:forEach var="photo" items="${business.photos }"
					varStatus="status">
					<div class="carousel-item${status.first ? ' active': '' }">
						<div class="d-flex justify-content-center">
							<img src="<c:out value="${photo.filePath }"/>" height="500px"
								class="mx-auto rounded">
						</div>
						
					</div>
				</c:forEach>

			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon filterInvert"
					aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon filterInvert"
					aria-hidden="true"></span> <span class="visually-hidden">Next</span>
			</button>
		</div>
		<!--================================END CAROUSEL======================================  -->
		
		<div class="container d-flex mt-5">
			<div class="leftBusinessShow w-75">
				<div class="leftColumnShow">
					<div class="p-3 border-bottom">
						<button class="btn btn-success">Add Business Photo</button>
						<button class="btn btn-outline-success">Write a review</button>
						<button class="btn btn-outline-success">Add Menu Item</button>
						<button class="btn btn-outline-success">Add to Favorites</button>
					</div>
					<div class="p-3 border-bottom">
						<h3>Top 3 Items</h3>
					</div>
					<div class="p-3 border-bottom">
						<h3>Location</h3>
					</div>
					<div class="p-3 border-bottom">
						<h3>All Submitted Items</h3>
					</div>
				</div>
				
				
			</div>
			<div class="rightColumnShow w-25 border border-dark p-3">
				<p><a href="${business.website }">${business.website }</a></p>
				<br>
				<p>${business.address.street } ${business.address.city }, ${business.address.state } ${business.address.zipCode }</p>
				
			</div>
		</div>
		
		
		
		
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
		var latitude = $
		{
			business.latitude
		};
		var longitude = $
		{
			business.longitude
		};
	</script>
</body>
</html>