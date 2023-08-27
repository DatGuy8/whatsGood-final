<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- GOOGLE PLACES API FOR ADDRESSES -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=${googleApiKey }&libraries=places&callback=initAutocomplete"
	async defer></script>

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

	<div class="mt-3 w-50 mx-auto">
		<h3 class="text-center">Submit a Business to be added to What's
			Good</h3>
		<c:if test="${not empty successMessage}">
			<div class="alert alert-success">${successMessage}</div>
		</c:if>
		<div>
			<form:form action="/business/new" method="POST"
				modelAttribute="business" enctype="multipart/form-data"
				class="d-flex flex-column gap-3">
				<div class="form-group">
					<form:label path="name">Business Name:</form:label>
					<form:input type="text" class="form-control" path="name"
						id="businessName" placeholder="Search/enter a Business" />
						
					<form:errors path="name" class="text-danger" />
				</div>

				<div class="d-flex justify-content-between">
					<div class="form-group col-md-5">
						<form:errors path="address" class="text-danger" />
						<form:label path="address.street">Address:</form:label>
						<form:input type="text" class="form-control" path="address.street"
							placeholder="Enter Address" id="street" />
					</div>


					<div class="form-group col-md-5">
						<form:errors path="address" class="text-danger" />
						<form:label path="address.city">City:</form:label>
						<form:input type="text" class="form-control" path="address.city"
							placeholder="Enter City" id="city" />
					</div>
				</div>

				<div class="d-flex justify-content-between">
					<div class="form-group col-md-5">
						<form:errors path="address.state" class="text-danger" />
						<form:label path="address.state">State:</form:label>
						<form:input type="text" class="form-control" path="address.state"
							placeholder="Enter State" id="state" />
					</div>

					<div class="form-group col-md-5">
						<form:errors path="address.zipCode" class="text-danger" />
						<form:label path="address.zipCode">Zip Code:</form:label>
						<form:input type="text" class="form-control"
							path="address.zipCode" placeholder="Enter Zip Code" id="zipCode" />
					</div>
				</div>



				<div class="form-group">
					<form:errors path="website" class="text-danger" />
					<form:label path="website">Website:</form:label>
					<form:input type="text" class="form-control" path="website"
						placeholder="ex. www.businesswebsite.com" id="website" />
				</div>

				<div class="form-group">
					<img id="imagePreview" src="#" alt="Image Preview"
						style="max-width: 200px; max-height: 200px; display: none;">
					<%-- <form:errors path="photos" class="text-danger" /> --%>
					<label for="imageFile" class="custom-file-upload">Business
						Photo: <input type="file" name="imageFile"
						accept="image/png, image/jpeg" name="imageFile"
						onchange="previewImage(event)" required />
					</label>
				</div>


				<button class="btn btn-success" id="submitButton"
					data-toggle="modal" data-target="#submissionModal">Submit</button>
			</form:form>
		</div>

	</div>
	<div class="modal fade" id="submissionModal" tabindex="-1"
		role="dialog" aria-labelledby="submissionModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="submissionModalLabel">Thank You!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Your business submission has been sent
					for review. Thank you!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/addBusiness/index.js"></script>

</body>
</html>