<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<link href="${pageContext.request.contextPath }/bootstrap/css/style.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/styles.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="${pageContext.request.contextPath }/bootstrap/js/main.js"></script>
<style>
</style>
</head>
<body>
	<tiles:insertAttribute name="menu"></tiles:insertAttribute>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<tiles:insertAttribute name="foot"></tiles:insertAttribute>
</body>
</html>