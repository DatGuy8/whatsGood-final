<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</body>
</html>