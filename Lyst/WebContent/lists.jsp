<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lysts!!!</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.47/jquery.form-validator.min.js"></script>

<script src="JS/lists.js"></script>
<link rel="stylesheet" href="Stylesheets/lists.css">
<link rel="stylesheet" href = "Stylesheets/MenuStyle.css">

<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>
	<!-- <script id = "item-template" type "text/template">
<div class="item-desktop" id="tester">
<div class="row">
	<div class="col-md-3">picpath</div>
	<div class="col-md-6">
		<div class="list-name-description">
		{{list_name}}	</div>
		<div class="current-leader-description">
			Current Leader: {{curent_leader}}
		</div>
	</div>
	<div class="col-md-3 category-name-description">Category: {{category}}</div>

</div>


</div>







</script>
 -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="btn-group" role="group">
			${sessionScope.CategoryHTML}
			<button type="button" id="categoryselect" class="btn btn-default">
				<span id="showCategory">Everything</span><span class="caret"></span>
			</button>
			<button type="button" id="filterbutton" class="btn btn-default">Filter</button>

		</div>
	</div>
	</nav>
	<button id="clicker">CLICK ME!</button>
	<div class="container-fluid main-body" id = "main-body">

		<!-- <div class="col-md-6">
			<div class="item-desktop">
				<img class="img-responsive" src="imageservlet/dicaps.png">
				<div class="show-info">
					<span>Current Category: Sports</span> <span>Current Leader:
						poster on curry</span>
				</div>
				<div class="showlist-desktop">Lebron's Best Dunks of 2015</div>

			</div>
		</div>
		<div class="col-md-6">
			<div class="item-desktop">
				<img class="img-responsive" src="imageservlet/dicaps.png">
				<div class="show-info">
					<span>Current Category: Sports</span> <span>Current Leader:
						poster on curry</span>
				</div>
				<div class="showlist-desktop">Lebron's Best Dunks of 2015</div>

			</div>
		</div>
		<div class="col-md-6">
			<div class="item-desktop">
				<img class="img-responsive" src="imageservlet/dicaps.png">
				<div class="show-info">
					<span>Current Category: Sports</span> <span>Current Leader:
						poster on curry</span>
				</div>
				<div class="showlist-desktop">Lebron's Best Dunks of 2015</div>

			</div>
		</div>
 -->	</div><div class="container-fluid main-body">
 
		<div class="spinner">
			<div class="rect1"></div>
			<div class="rect2"></div>
			<div class="rect3"></div>
			<div class="rect4"></div>
			<div class="rect5"></div>
		</div>
	</div>



</body>
</html>