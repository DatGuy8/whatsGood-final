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
<title>Add an item to ${business.name }</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->

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
	<div class="container mt-3">
		<img src="${business.photos[0].filePath }" height="200px" />
		<h1>
			Add an item to
			<c:out value="${business.name}" />
		</h1>
		<form:form action="/business/${business.id }/item/new" method="POST"
			modelAttribute="newItem" enctype="multipart/form-data">

			<form:errors path="name" class="text-danger" />
			<form:label path="name">Item Name: </form:label>
			<form:input type="text" path="name" class="form-control" />
			<br />

			<form:errors path="description" class="text-danger" />
			<form:label path="description">Description: </form:label>
			<form:textarea type="text" path="description" class="form-control" />
			<br />

			<form:errors path="price" class="text-danger" />
			<form:label path="price">Price: </form:label>
			<form:input type="number" path="price" min="0" step=".01"
				class="form-control" />
			<br />


			<div class="form-group">
				<%-- <form:errors path="photos" class="text-danger" /> --%>
				<label for="imageFile">Item Photo: </label>
				<input type="file" name="imageFiles"
					accept="image/png, image/jpeg"
					onchange="previewImages(event)" multiple/>
				<div id="imagePreviewContainer"></div>
			</div>
			<br />

			<button class="btn btn-primary">Submit</button>
		</form:form>
	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/script.js"></script>
	<script type="text/javascript" src="/js/item/addItem.js"></script>
</body>
</html>