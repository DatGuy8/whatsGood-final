
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>What's Good</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/admin/index.css" />
</head>
<body>
	<header class="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow">

		<!------------------------ NAV BAR------------------------>


		<a href="/"
			class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-5 text-white"><strong>What's
				Good</strong></a>
		<!------------------SEARCH BAR--------------------  -->
		<div class="d-none d-md-block">
			<form action="action_page.php">
				<div class="input-group d-flex align-items-center">
					<input type="text" class="form-control height40px"
						placeholder="Search What's Good">
					<div class="input-group-append">
						<button class="btn bg-danger" type="submit">Search</button>
					</div>
				</div>
			</form>
		</div>

		<!------------------------SEARCH AND LIST BUTTON ON MID OR LOWER SCREENS------------------------>
		<ul class="navbar-nav flex-row d-md-none">

			<li class="nav-item text-nowrap">
				<button class="nav-link px-3 text-white bg-dark border-0"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSearch" aria-controls="navbarSearch"
					aria-expanded="false" aria-label="Toggle search">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  							<path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
						</svg>
				</button>
			</li>
			<li class="nav-item text-nowrap">
				<button type="button"
					class="nav-link px-3 bg-dark text-white border-0"
					data-bs-toggle="offcanvas" data-bs-target="#sidebarMenu">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  							<path fill-rule="evenodd"
							d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
						</svg>
				</button>
			</li>
		</ul>

		<div id="navbarSearch" class="navbar-search w-100 collapse d-md-none">
			<form action="action_page.php">
				<div class="input-group">
					<input type="text" class="form-control height40px"
						placeholder="Search What's Good" aria-label="Recipient's username"
						aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn bg-danger" type="submit">Search</button>
					</div>
				</div>
			</form>
		</div>


		<!----------------------------SIDE BAR----------------------------------->
	</header>
	<div class="container-fluid">
		<div class="row">
			<div class="sidebar border border-right col-md-3 col-lg-2 p-0">
				<div class="offcanvas-lg offcanvas-end" tabindex="-1"
					id="sidebarMenu">

					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="sidebarMenuLabel">What's Good</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" data-bs-target="#sidebarMenu"></button>
					</div>

					<div
						class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
						<ul class="nav flex-column">
							<li class="nav-item"><a href="/admin"
								class="nav-link align-items-center gap-2 active"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="black" class="bi bi-buildings-fill" viewBox="0 0 16 16">
  									<path
											d="M15 .5a.5.5 0 0 0-.724-.447l-8 4A.5.5 0 0 0 6 4.5v3.14L.342 9.526A.5.5 0 0 0 0 10v5.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V14h1v1.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5V.5ZM2 11h1v1H2v-1Zm2 0h1v1H4v-1Zm-1 2v1H2v-1h1Zm1 0h1v1H4v-1Zm9-10v1h-1V3h1ZM8 5h1v1H8V5Zm1 2v1H8V7h1ZM8 9h1v1H8V9Zm2 0h1v1h-1V9Zm-1 2v1H8v-1h1Zm1 0h1v1h-1v-1Zm3-2v1h-1V9h1Zm-1 2h1v1h-1v-1Zm-2-4h1v1h-1V7Zm3 0v1h-1V7h1Zm-2-2v1h-1V5h1Zm1 0h1v1h-1V5Z" />
								</svg> Businesses
							</a></li>
							<li class="nav-item"><a href="/admin/users"
								class="nav-link align-items-center gap-2"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="black" class="bi bi-people-fill" viewBox="0 0 16 16">
  									<path
											d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z" />
								</svg> Users
							</a></li>
							<li class="nav-item"><a href="/admin/items"
								class="nav-link align-items-center gap-2"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="black" class="bi bi-cup-hot-fill" viewBox="0 0 16 16">
  									<path fill-rule="evenodd"
											d="M.5 6a.5.5 0 0 0-.488.608l1.652 7.434A2.5 2.5 0 0 0 4.104 16h5.792a2.5 2.5 0 0 0 2.44-1.958l.131-.59a3 3 0 0 0 1.3-5.854l.221-.99A.5.5 0 0 0 13.5 6H.5ZM13 12.5a2.01 2.01 0 0 1-.316-.025l.867-3.898A2.001 2.001 0 0 1 13 12.5Z" />
  									<path
											d="m4.4.8-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 3.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 3.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 3 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 4.4.8Zm3 0-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 6.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 6.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 6 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 7.4.8Zm3 0-.003.004-.014.019a4.077 4.077 0 0 0-.204.31 2.337 2.337 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.198 3.198 0 0 1-.202.388 5.385 5.385 0 0 1-.252.382l-.019.025-.005.008-.002.002A.5.5 0 0 1 9.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 9.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 9 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 10.4.8Z" />
								</svg> Items
							</a></li>
							
						</ul>


						<hr class="my-3">

						<ul class="nav flex-column mb-auto">
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="black" class="bi bi-gear-fill" viewBox="0 0 16 16">
  									<path
											d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
								</svg> Settings
							</a></li>
							<li class="nav-item">
								<form id="logoutForm" method="POST" action="/logout">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <a
										class="nav-link d-flex align-items-center gap-2" href="#">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="black" class="bi bi-door-closed" viewBox="0 0 16 16">
									  <path
												d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z" />
									  <path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z" />
									</svg> <input type="submit" value="Logout!"
										class="nav-link btn btn-link p-0" />
									</a>
								</form>
							</li>
						</ul>
					</div>
				</div>
			</div>




			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h3 text-center">Users</h1>
				</div>
				<div class="btn-group" role="group" aria-label="Filter">
					<button type="button" class="btn btn-primary filter-btn-users"
						data-filter="all">All</button>
					<button type="button" class="btn btn-secondary filter-btn-users"
						data-filter="ROLE_ADMIN">Admins</button>
					<button type="button" class="btn btn-secondary filter-btn-users"
						data-filter="ROLE_USER">Users</button>
				</div>
				<div class="table-responsive small">
					<table class="table table-striped table-sm" id="businessTable">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Username</th>
								<th scope="col">Email</th>
								<th scope="col">Admin?</th>
								<th scope="col">Change Role</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${allUsers }">
								<tr>
									<td>${user.id }</td>
									<td>${user.userName }</td>
									<td>${user.email}</td>
									<td>${user.roles[0].name}</td>
									<td><c:choose>
											<c:when test="${user.id == 1 }">
											Master
											</c:when>
											<c:when test="${user.roles[0].name == 'ROLE_USER'}">
											<button class="btn btn-primary">Make Admin</button>
											</c:when>
											<c:otherwise>
											<button class="btn btn-danger">Remove Admin</button>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>



			</main>
		</div>
	</div>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/admin/index.js"></script>
</body>
</html>