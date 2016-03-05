<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lyst</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="jquery.validate.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.47/jquery.form-validator.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="style.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<div class="container-fluid">
		<div class="row myrow">
			<div class=" col-xs-4 col-sm-4 col-md-5 col-lg-5">
				<img class="img-responsive pull-right" width="250" height="250"
					src="images/ICON.png"></img>
			</div>
			<div class="col-xs-8 col-sm-8 col-md-4 col-lg-4">
				<div class="input-group stylish-input-group pull-left">
					<input type="text" class="form-control input-lg"
						placeholder="Search"> <span class="input-group-addon">
						<button type="submit">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-0 col-sm-0 col-md-2 col-lg-2"></div>
			<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
				<nav class="navbar navbar-default" role="navigation"> <!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-ex1-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
						<li><a href="#">Movies</a></li>
						<li><a href="#">Sports</a></li>
						<li><a href="#">Music</a></li>
						<li><a href="#">Places</a></li>
						<li><a href="#">Products</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Dropdown <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse --> </nav>
			</div>
		</div>
		<div class="col-xs-0 col-sm-0 col-md-2 col-lg-2"></div>
		<div
			class="col-xs-6 col-sm-6 col-md-4 col-lg-4 centerAlign marginTop3">
			<table class="table table-hover">
				<tbody>
					<c:forEach begin="0" end="2" var="loop">
						<tr>
						<td><img src ="${sessionScope.lysts[loop].imagePath}" class="img-circle" height="70%" width="70%"></img></td>
							<td><c:out value="${sessionScope.lysts[loop].listName}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div
			class="col-xs-6 col-sm-6 col-md-4 col-lg-4 centerAlign marginTop3">
			<table class="table table-hover">
				<tbody>
					<c:forEach begin="3" end="5" var="loop">
						<tr>
						<td><img src ="${sessionScope.lysts[loop].imagePath}" class="img-circle" height="170" width="260"></img></td>
							<td><c:out value="${sessionScope.lysts[loop].listName}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>