<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title><c:out value="${requestScope.currentItem.name}"></c:out></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="JS/home.js"></script>
<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/Stylesheets/navbar.css">
<link href='https://fonts.googleapis.com/css?family=Black+Ops+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/Stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="/Stylesheets/listitem.css">
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-83915306-1', 'auto');
  ga('send', 'pageview');

</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row rowPadding well well-sm">
			<div class="col-xs-3 col-sm-2 col-md-2 col-lg-2">
				<a href="/bro/lists" data-toggle="tooltip" data-placement="bottom" title="View Lists"><img
					class="img-responsive topButton"
					src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-119295481920/Images/Icons/listLogo.png"></a>
			</div>
			<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2"></div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<img class="theLogo center-block"
					src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-119295481920/Images/Icons/logo.png">
			</div>
			<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2"></div>
			<div class="col-xs-3 col-sm-2 col-md-2 col-lg-2 pull-right">
				<a href="/" type="button" id="rateMenuButton" data-toggle="tooltip"
					data-placement="bottom" title="Rate!"><img
					class="img-responsive topButton pull-right"
					src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-119295481920/Images/Icons/vsLogo.png">
				</a>
			</div>

		</div>
	</div>
	<div class="container-fluid extraRowPadding" id="main-body">
		<div class="row">
			<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
				<h3 class="centerAlign">
					<c:out value="${requestScope.currentItem.name}"></c:out>
				</h3>
				<p class="centerAlign listText">
					<c:out value="${requestScope.currentItem.belongingList}"></c:out>
				</p>
			</div>
			<div class="hidden-xs hidden-sm col-md-4 col-lg-4">
				<img class="img-circle center-block detailImage"
					src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-119295481920/Images/<c:out value="${requestScope.currentItem.picPath}"/>">
			</div>
			<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
				<a href="/bro/<c:out value="${requestScope.currentItem.getListUrl()}"/>" id="newShowdownButton" type="button" id="fullList"
					class="btn btn-circle btn-xl center-block">
					<span class="glyphicon glyphicon-list-alt aTag"></span>
				</a>
				<h4 class="centerAlign">View List</h4>
			</div>
		</div>
		<div class="row">
			<div class="hidden-lg hidden-md col-sm-12 col-xs-12">
				<img class="img-circle center-block detailImage"
					src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-119295481920/Images/<c:out value="${requestScope.currentItem.picPath}"/>">
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"></div>
			<div class="hidden-xs col-sm-1 col-md-1 col-lg-1">
				<p class="centerAlign attributeText">Rating</p>
			</div>
			<div class="hidden-xs col-sm-1 col-md-1 col-lg-1">
				<p class="centerAlign attributeText">Ranking</p>
			</div>
		</div>
		<c:forEach var="i" items="${requestScope.itemAttributes}">
			<div class="row rowPadding">
				<div class="hidden-xs col-sm-2 col-md-2 col-lg-2"></div>
				<div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
					<p class="centerAlign attributeText">
						<c:out value="${i.name}" />
					</p>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 nopadding">
					<div class="progress-bar green stripes">
						<span class="floatLeft"
							style="width: <c:out value="${i.rating}"/>%"></span>
					</div>
				</div>
				<div class="col-xs-2 col-sm-1 col-md-1 col-lg-1">
					<p class="centerAlign ratingNumber">
						<c:out value="${i.rating}" />
					</p>
				</div>
				<div class="col-xs-2 col-sm-1 col-md-1 col-lg-1">
					<p class="centerAlign ratingNumber">
						<c:out value="${i.getRankingString()}" />
					</p>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
