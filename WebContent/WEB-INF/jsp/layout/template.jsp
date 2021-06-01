<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<link href="${pageContext.request.contextPath }/bootstrap/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/styles.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/main.js"></script>
	<!-- slider 링크 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
</style>
</head>
<body>
	<!--====== Preloader Start ======-->
	<div id="preloader">
		<div class="loader-cubes">
			<div class="loader-cube1 loader-cube"></div>
			<div class="loader-cube2 loader-cube"></div>
			<div class="loader-cube4 loader-cube"></div>
			<div class="loader-cube3 loader-cube"></div>
		</div>
	</div>
	<tiles:insertAttribute name="menu"></tiles:insertAttribute>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<tiles:insertAttribute name="foot"></tiles:insertAttribute>
</body>
</html>