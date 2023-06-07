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
				<div class="dropdown">
					<button class="dropdown-toggle btn btn-info"
						onclick="toggleDropdown()" aria-expanded="false">
						<c:out value="${currentUser.userName }" />
					</button>
					<ul class="dropdown-menu" id="dropdownMenu" style="display: none;">
						<li><a href="/user/${currentUser.id }">My Profile</a></li>

						<li><form id="logoutForm" method="POST" action="/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" value="Logout!" />
							</form></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<h1 class="text-center mt-1">Businesses Seeking Approval</h1>
		<div class="album backgroundColor">
			<div class="container mt-3">
				<div class="row">
					<c:forEach var="business" items="${businesses }">
						<div class="col-md-4">
							<div class="card mb-4 box-shadow">
								<img class="card-img-top" src="${business.photos[0].filePath }"
									alt="pic of food" height="300px">
								<div class="card-body">
									<p class="card-text">
										Business Name:
										<c:out value="${business.name }" />
									</p>
									<p>
										Website:
										<c:out value="${business.website}" />
									</p>
									<p>
										Address:
										<c:out value="${business.address}" />
									</p>
									<a href="/admin/edit/business/${business.id }">
										<button class="btn btn-dark">Edit</button>
									</a>
									<div
										class="d-flex justify-content-between align-items-center mt-2">
										<form action="/admin/approve/business/${business.id }" method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
											<input type="hidden" name="_method" value="put" />
											<button class="btn btn-primary">Approve</button>
										</form>
										<form action="/admin/delete/business/${business.id }" method="POST">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
											<input type="hidden" name="_method" value="delete" />
											<button class="btn btn-danger">Deny</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>


</body>
</html>