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
	<div class="container mt-3">
		<img src="${business.photosImagePath }" height="200px"/>
		<h1>
			Add an item to
			<c:out value="${business.name}" />
		</h1>
		<form:form action="/business/${business.id }/item/new" method="POST"
			modelAttribute="item" enctype="multipart/form-data">

			<form:errors path="name" class="text-danger" />
			<form:label path="name">Item Name: </form:label>
			<form:input type="text" path="name" />
			<br />

			<form:errors path="description" class="text-danger" />
			<form:label path="description">Description: </form:label>
			<form:input type="text" path="description" />
			<br />

			<form:errors path="price" class="text-danger" />
			<form:label path="price">Price: </form:label>
			<form:input type="number" path="price" min="0" step=".01" />
			<br />


			<form:errors path="imageFile" class="text-danger" />
			<form:label path="imageFile">Add a Photo:</form:label>
			<form:input type="file" path="imageFile"
				accept="image/png, image/jpeg" name="imageFile" />
			<br />
			
			<button>Submit</button>
		</form:form>
	</div>
</body>
</html>