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
<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="style.css">
<link href='https://fonts.googleapis.com/css?family=Black+Ops+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="vsStyle.css">
<link rel="stylesheet" type="text/css" href="resultsStyle.css">
<script src="resultScripts.js"></script>

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
		<div id="contextButtons" class="row">
			<div id="topLeftButton"
				class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<button id="newShowdownButton" type="button"
					class="btn btn-circle btn-xl center-block">
					<span class="glyphicon glyphicon-eye-close"></span>
				</button>
			</div>
			<div class="hidden-xs hidden-sm col-md-2 col-lg-2"></div>
			<div id="topRightButton"
				class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<a type="button" id="fullList" 
				href="bro/<c:out value="${sessionScope.leftItem.getListUrl()}"/>"
					class="btn btn-circle btn-xl center-block">
					<span class="glyphicon glyphicon-list-alt aTag"></span>
				</a>
			</div>
		</div>
		<div id="labels" class="row row-buffer">
			<div class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<span><h4 class="centerAlign">New Showdown</h4></span><input
					type="hidden" id="CurrentCategory" value="Something"> <input
					type="hidden" id="isCategoryList" value="false">

			</div>
			<div class="hidden-xs hidden-sm col-md-2 col-lg-2"></div>
			<div class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<h4 class="centerAlign">Full List</h4>
			</div>
		</div>
		<div class="row">
			<div class=" col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<div class="positionRelativeContainer nopadding">
					<c:if test="${sessionScope.winningSide eq 'left'}">
						<span class="label label-success bannerOverlay">Winner</span>
					</c:if>
					<div class="numberCircle">
						<p id="ratingNumber">
							<c:out value="${sessionScope.leftItem.overallRating}"/>
						</p>
					</div>
					<div id="leftPic">
						<a href="bro/<c:out value="${sessionScope.leftItem.getListUrl()}"/>/<c:out value="${sessionScope.leftItem.getNameUrl()}"/>"> <img id="thesauce"
							class="img-responsive img-circle center-block resultImage"
							src="imageservlet/<c:out value="${sessionScope.leftItem.picPath}"/>"></a>
					</div>
				</div>
			</div>
			<div id="centerContent"
				class="hidden-xs hidden-sm col-md-2 col-lg-2 centerAlign">
				<div id="attributePhrases">
					<div class="row row-buffer">
						<h3 id="attributeTitle" class="centerAlign">
							<c:if test="${sessionScope.winningSide eq 'left'}">
								<c:out value="${sessionScope.leftItem.name}"></c:out> wins!
							</c:if>
							<c:if test="${sessionScope.winningSide eq 'right'}">
								<c:out value="${sessionScope.rightItem.name}"></c:out> wins!
							</c:if>
							<c:if test="${sessionScope.winningSide eq 'tie'}">
								Its a tie!
							</c:if>
						</h3>
					</div>
					<div class="row row-buffer">
						<button type="button" class="btn btn-primary">Scoring</button>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-5 col-lg-5 nopadding">
				<div class="positionRelativeContainer nopadding">
					<c:if test="${sessionScope.winningSide eq 'right'}">
						<span class="label label-success bannerOverlay">Winner</span>
					</c:if>
					<div class="numberCircle bannerOverlay">
						<p id="ratingNumber">
							<c:out value="${sessionScope.rightItem.overallRating}"></c:out>
						</p>
					</div>
					<div id="rightPic">
					<a href="bro/<c:out value="${sessionScope.rightItem.getListUrl()}"/>/<c:out value="${sessionScope.rightItem.getNameUrl()}"/>">
						<img id="thesauce"
							class="img-responsive img-circle center-block resultImage"
							src="imageservlet/<c:out value="${sessionScope.rightItem.picPath}"/>"></a>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="bottomRow">
			<div id="leftName"
				class="hidden-xs hidden-sm col-md-5 col-lg-5 centerAlign">
				<h3>
					<c:out value="${sessionScope.leftItem.name}"></c:out>
				</h3>
			</div>
			<div id="leftName2"
				class="col-xs-6 col-sm-6 hidden-md hidden-lg centerAlign">
				<h3 class="verticalAlign">
					<c:out value="${sessionScope.leftItem.name}"></c:out>
				</h3>
			</div>
			<div class="hidden-xs hidden-sm col-md-2 col-lg-2"></div>
			<div id="rightName"
				class="hidden-xs hidden-sm col-md-5 col-lg-5 centerAlign">
				<h3>
					<c:out value="${sessionScope.rightItem.name}"></c:out>
				</h3>
			</div>
			<div id="rightName2"
				class="col-xs-6 col-sm-6 hidden-md hidden-lg centerAlign">
				<h3>
					<c:out value="${sessionScope.rightItem.name}"></c:out>
				</h3>
			</div>
		</div>

		<div class="container-fluid">
			<c:forEach var="i" items="${sessionScope.attributes}">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="tile red center-block">
								<div class="row nopadding centerAlign">
									<h3 class="nopadding">
										<c:out value="${i.name}" />
									</h3>
								</div>
								<div class="row nopadding">
									<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
										<p class="itemName">
											<c:out value="${sessionScope.leftItem.name}"></c:out>
										</p>
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
										<p class="itemName">
											<c:out value="${sessionScope.rightItem.name}"></c:out>
										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
										<h3 class="title">
											<c:out value="${i.leftItemWorldScore}" />
										</h3>
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
										<h3 class="title">
											<c:out value="${i.rightItemWorldScore}" />
										</h3>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 nopadding"></div>
									<c:choose>
										<c:when test="${!i.leftWorldWins}">
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 nopadding">
												<div class="progress-bar blue stripes">
													World <span class="floatRight" style="width: 0%"></span>
												</div>
											</div>
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 nopadding">
												<div class="progress-bar blue stripes">
													<span class="floatLeft"
														style="width: <c:out value="${i.worldBarPercent}" />%"></span>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 nopadding">
												<div class="progress-bar blue stripes">
													<span class="floatRight"
														style="width: <c:out value="${i.worldBarPercent}" />%"></span>
												</div>
											</div>
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 nopadding">
												<div class="progress-bar blue stripes">
													World <span class="floatLeft" style="width: 0%"></span>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="row">
									<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 nopadding"></div>
									<c:choose>
										<c:when test="${!i.leftUserWins}">
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 nopadding">
												<div class="progress-bar pink stripes">
													You <span class="floatRight" style="width: 0%"></span>
												</div>
											</div>
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 nopadding">
												<div class="progress-bar pink stripes">
													<span class="floatLeft"
														style="width: <c:out value="${i.userBarPercent}" />%"></span>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 nopadding">
												<div class="progress-bar pink stripes">
													<span class="floatRight"
														style="width: <c:out value="${i.userBarPercent}" />%"></span>
												</div>
											</div>
											<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 nopadding">
												<div class="progress-bar pink stripes">
													You <span class="floatLeft" style="width: 0%"></span>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
