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
	<div class="w-100 mt-3">
		<h3 class="text-center">Submit a Business to be added to What's Good</h3>
		<form:form class="container" action="/business/new" method="POST"
			modelAttribute="business" enctype="multipart/form-data">
			<br>
			<div class="form-group">
				<form:errors path="name" class="text-danger" />
				<form:label path="name">Business Name:</form:label>
				<form:input type="text" class="form-control" path="name"
					placeholder="ex. Chipotle, Ruth's Chris, Nobu" />
			</div>
			<br>
			<div class="form-group">
				<form:errors path="address" class="text-danger" />
				<form:label path="address">Address:</form:label>
				<form:input type="text" class="form-control" path="address"
					placeholder="ex. 123 Main Street" />
			</div>
			<br>
			<div class="form-group">
				<form:errors path="website" class="text-danger" />
				<form:label path="website">Website:</form:label>
				<form:input type="text" class="form-control" path="website"
					placeholder="ex. www.businesswebsite.com" />
			</div>
			<br>
			<div class="form-group">
				<img id="imagePreview" src="#" alt="Image Preview"
				style="max-width: 200px; max-height: 200px; display: none;" >
				<form:errors path="imageFile" class="text-danger" />
				<form:label path="imageFile">Business Photo: </form:label>
				<form:input type="file" path="imageFile"
					accept="image/png, image/jpeg" name="imageFile" onchange="previewImage(event)"/>
			</div>
			<br>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>

	</div>



</body>
</html>