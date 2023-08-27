<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What's Good at ${business.name }</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/business/businessShow.css" />

<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="module" src="/js/businessShow/index.js"></script>
<script type="module" src="/js/script.js"></script>
<script>
	function addPhotoForm() {
		let form = document.getElementById("addPhotoInput");
		if (form.style.display === "none") {
			form.style.display = "block";
		} else {
			form.style.display = " none";
		}
	};
</script>
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
		<c:set var="formatRating" value="${business.averageRating }" />
		<h1 class="text-center m-3">${business.name }</h1>


		<!--================================CAROUSEL======================================  -->
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel"
			data-bs-theme="light">
			<div class="carousel-indicators">
				<c:forEach var="photo" items="${business.photos}" varStatus="status">
					<button type="button" data-bs-target="#myCarousel"
						data-bs-slide-to="${status.index}"
						class="${status.first ? 'active' : ''}"
						aria-current="${status.first}"
						aria-label="Slide ${status.index + 1}"></button>
				</c:forEach>

			</div>
			<div class="carousel-inner">
				<c:forEach var="photo" items="${business.photos }"
					varStatus="status">
					<div class="carousel-item${status.first ? ' active': '' }">
						<div class="d-flex justify-content-center">
							<img src="${photo.filePath }" height="500px"
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


		<div class="mt-5 ">
			<div class="d-md-flex flex-md-row-reverse container">
				<!-- RIGHT COLUMN -->
				<div class="rightColumnShow w-100 border border-dark p-3">
					<p class="website-link">
						<a href="${business.website }" target="_blank">${business.website }</a>
					</p>
					<br>
					<p>
						<a
							href="https://www.google.com/maps/dir/?api=1&destination=${business.latitude},${business.longitude}"
							target="_blank">Get Directions</a>
					</p>
					<p>${business.address.street }${business.address.city },
						${business.address.state } ${business.address.zipCode }</p>

				</div>
				
				<!-- LEFT COLUMN -->
				<!-- BUTTONS -->
				<div class="leftBusinessShow w-100">
					<div class="leftColumnShow">
						<div class="p-3 border-bottom d-flex gap-1">
							<!-- SHOW BUSINESS PHOTO FORM BUTTON -->
							<button class="btn btn-success" onclick="addPhotoForm()"
								aria-expanded="false">Add Business Photo</button>

							<!-- ADD MENU ITEM BUTTON -->
							<a href="/business/${business.id }/item/new"><button
									class="btn btn-outline-success">Add Menu Item</button></a>

							<!-- ADD TO FAVORITES BUTTON -->
							<form action="/user/addFavoriteBusiness/${business.id }"
								method="post">
								<input type="hidden" name="businessId" value="${business.id }" />
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button class="btn btn-outline-success">Add to
									Favorites</button>
							</form>
						</div>

						<!-- PHOTO INPUT FORM -->
						<div id="addPhotoInput" style="display: none;">
							<form action="/business/photo/${business.id }" method="POST"
								enctype="multipart/form-data">
								<div class="form-group">
									<label for="imageFile">Add Photo: </label> <input type="file"
										name="imageFile" accept="image/png, image/jpeg"> <input
										type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<button>Submit Photo</button>
								</div>
							</form>

						</div>
						<div class="p-3 border-bottom">
							<!-- CHECK HERE LATER WHEN AND OTHERWISE FOR FN:length was working -->
							<c:choose>
								<c:when test="${formatRating != null}">
									<h3>
										Overall Rating:
										<fmt:formatNumber type="number" maxFractionDigits="2"
											value="${formatRating}" />
										stars
									</h3>
								</c:when>
								<c:otherwise>
									<h3>Overall Rating: No Reviews Yet</h3>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="p-3 border-bottom">
							<h3>What's Good? (Top Items)</h3>
							<div class="album">
								<div class="row">
									<c:forEach var="item" items="${highestRatedItems }"
										varStatus="status">
										<!--SET TO FORMAT RATING -->
										<c:set var="formatRating" value="${item.averageRating }" />
										<c:if test="${status.index < 4}">
											<div class="col-md-3 item-card">
												<div class="card mb-3">
													<c:if test="${item.photos[0].filePath != null }">
														<div class="w-100 d-flex justify-content-center"
															style="height: 150px">
															<img class="card-img-top"
																src="${item.photos[0].filePath }" alt="table food" />
														</div>
													</c:if>
													<div class="card-body">
														<p class="card-text">
															<c:out value="${item.name }" />
														</p>

														<c:choose>
															<c:when test="${fn:length(item.ratings) > 0}">
																<div>
																	<div>
																		<div>
																			<c:forEach var="i" begin="1"
																				end="${item.averageRating}">
																				<i class="fa fa-star starAverage"></i>
																				<!-- Replace with your star icon class -->
																			</c:forEach>
																		</div>
																		<p>${item.averageRating } out of ${fn:length(item.ratings)} Ratings</p>
																	</div>

																	<p>
																		$
																		<c:out value="${item.price }" />
																	</p>
																</div>

															</c:when>
															<c:otherwise>
																<p>No ratings yet</p>
															</c:otherwise>
														</c:choose>
														<div class="btn-group">
															<a href="/item/${item.id }">
																<button type="button"
																	class="btn btn-sm btn-outline-secondary">See
																	ratings/More Pictures</button>
															</a>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="p-3 border-bottom">
							<h3>Location</h3>
							<!-- BUSINESS GOOGLE MAP  -->
							
							<img class="img-fluid"
								src="http://maps.googleapis.com/maps/api/staticmap?
								center=${business.latitude },${business.longitude}
								&zoom=13
								&size=600x300
								&maptype=roadmap
								&markers=color:green%7Clabel:A%7C${business.latitude },${business.longitude}&key=${googleApiKey}">
							
							<p class="text-primary">
								<a
									href="https://www.google.com/maps/dir/?api=1&destination=${business.latitude},${business.longitude}"
									target="_blank"> ${business.address.street }</a>
							</p>
							<p>${business.address.city },${business.address.state }
								${business.address.zipCode }</p>
						</div>


						<!-- ALL ITEMS -->
						<div class="p-3 border-bottom">
							<h3 class="text-center">All Submitted Items</h3>
							<div class="form-group d-flex flex-row-reverse">
								<input type="text" id="filterInput"
									placeholder="Search Items..." class="form-control mb-3"
									style="width: 300px;">
							</div>
							<div class="album">
								<div class="row">
									<c:forEach var="item" items="${sortedItems }">
										<div class="col-md-3 item-card">
											<div class="card mb-3">
												<c:if test="${item.photos[0].filePath != null }">
													<div class="w-100 d-flex justify-content-center"
														style="height: 150px">
														<img class="card-img-top"
															src="${item.photos[0].filePath }" alt="table food" />
													</div>
												</c:if>
												<div class="card-body">
													<p class="card-text">
														<c:out value="${item.name }" />
													</p>

													<c:choose>
														<c:when test="${fn:length(item.ratings) > 0}">
															<div>
																<div>
																	<div>
																		<c:forEach var="i" begin="1"
																			end="${item.averageRating}">
																			<i class="fa fa-star starAverage"></i>
																			<!-- Replace with your star icon class -->
																		</c:forEach>
																	</div>
																	<p>${item.averageRating } out of ${fn:length(item.ratings)} ratings</p>
																</div>

																<p>
																	$
																	<c:out value="${item.price }" />
																</p>
															</div>

														</c:when>
														<c:otherwise>
															<p>No ratings yet</p>
														</c:otherwise>
													</c:choose>
													<div class="btn-group">
														<a href="/item/${item.id }">
															<button type="button"
																class="btn btn-sm btn-outline-secondary">See
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
					</div>


				</div>

			</div>
		</div>




	</main>

	<div style="height: 500px"></div>
</body>
</html>