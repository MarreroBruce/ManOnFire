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
<script src="homescripts.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.47/jquery.form-validator.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="testCss.css">
<link href='https://fonts.googleapis.com/css?family=Black+Ops+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="vsStyle.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 nopadding">
				<nav class="navbar navbar-default" role="navigation">
				<div class="row">
					<div class="hidden-xs col-sm-3 col-md-3 col-lg-3">
						<img class="imageDoBoys2" src="imageservlet/Drawing(5).png"></img>
					</div>
					<div class="col-xs-3 hidden-sm hidden-md hidden-lg">
						<img class="imageDoBoys" src="imageservlet/Drawing(9).png"></img>
					</div>
					<div class="col-xs-6 hidden-sm hidden-md hidden-lg">
						<img class="imageDoBoys2 center-block"
							src="imageservlet/Drawing(10).png"></img>
					</div>
					<div class="hidden-xs col-sm-6 col-md-6 col-lg-6 parent">
						<input class="searchbar child" placeholder="Search..." />
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<img class="imageDoBoys pull-right"
							src="imageservlet/Drawing(7).png"></img>
					</div>
					<div class="col-xs-12 hidden-sm hidden-md hidden-lg">
						<input class="searchbar" placeholder="Search..." />
					</div>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<div class="container-fluid" id="main-body">
		<div class="row">
			<div class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<button type="button" class="btn btn-circle btn-xl center-block">
					<span class="glyphicon glyphicon-th"></span>
				</button>
			</div>
			<div class="hidden-xs hidden-sm col-md-2 col-lg-2"></div>
			<div class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<a type="button" id="randomButton"
					class="btn btn-circle btn-xl center-block"> <span
					class="glyphicon glyphicon-repeat"></span>
				</a>
			</div>
		</div>
		<div class="row row-buffer">
			<div class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<h4 class="centerAlign">Everything</h4>
			</div>
			<div class="hidden-xs hidden-sm col-md-2 col-lg-2"></div>
			<div class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<h4 class="centerAlign">Random</h4>
			</div>
		</div>
		<div class="row">
			<div 
				class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<div id="myCard" class="flip-container center-block">
					<div class="flipper">
						<div class="front">
							<img class="img-responsive center-block"
								src="imageservlet/question.png">
						</div>
						<div class="back" id="leftPic">
							<img class="img-responsive center-block"
								src="${sessionScope.leftItem.picPath}">
						</div>
					</div>
					<div id="clear" style="clear:both;"></div>
				</div>
				<div id="clear" style="clear:both;"></div>
			</div>
			<div class="hidden-xs hidden-sm col-md-2 col-lg-2 centerAlign">
				<div id="list" class="row">
					<h3>
						<c:out value="${sessionScope.leftItem.belongingList}"></c:out>
					</h3>
				</div>
				<div class="row">
					<button class="btn btn-lg btn-danger btn-red">
						<h1>VS</h1>
					</button>
				</div>
			</div>
			<div
				class="col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<div id="myCardRight" class="flip-container center-block">
					<div class="flipper">
						<div class="front">
							<img class="img-responsive center-block"
								src="imageservlet/question.png">
						</div>
						<div class="back" id="rightPic">
							<img class="img-responsive center-block"
								src="${sessionScope.rightItem.picPath}">
						</div>
						<div id="clear" style="clear:both;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="leftName"
				class="hidden-xs hidden-sm col-md-5 col-lg-5 centerAlign">
				<h3>
					<c:out value="${sessionScope.leftItem.name}"></c:out>
				</h3>
			</div>
			<div id="leftName2" class="col-xs-4 col-sm-4 hidden-md hidden-lg">
				<h3 class="pull-right verticalAlign">
					<c:out value="${sessionScope.leftItem.name}"></c:out>
				</h3>
			</div>
			<div class="col-xs-4 col-sm-4 hidden-md hidden-lg centerAlign">
				<button class="btn btn-lg btn-danger btn-red">
					<h1>VS</h1>
				</button>
			</div>
			<div class="hidden-xs hidden-sm col-md-2 col-lg-2"></div>
			<div id="rightName"
				class="hidden-xs hidden-sm col-md-5 col-lg-5 centerAlign">
				<h3>
					<c:out value="${sessionScope.rightItem.name}"></c:out>
				</h3>
			</div>
			<div id="rightName2" class="col-xs-4 col-sm-4 hidden-md hidden-lg">
				<h3 class="pull-left">
					<c:out value="${sessionScope.rightItem.name}"></c:out>
				</h3>
			</div>
		</div>
	</div>
</body>
</html>