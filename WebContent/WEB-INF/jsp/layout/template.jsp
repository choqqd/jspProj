<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
	
<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/styles11.css">
  <!--====== Favicon Icon ======-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/bootstrap/img/favicon.ico" type="img/png" />
    <!--====== Bootstrap css ======-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css" />
    <!--====== Slick Slider ======-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/slick.css" />
    <!--====== Magnific ======-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/magnific-popup.css" />
    <!--====== Animate CSS ======-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/animate.min.css" />
    <!--====== Font Awesome ======-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/font-awesome.min.css" />
    <!--====== Main Css ======-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/style.css" />
    
    
    
    <!--====== Jquery ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery-1.12.4.min.js"></script>
    <!--====== Bootstrap ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!--====== Slick slider ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/slick.min.js"></script>
    <!--====== Magnific ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery.magnific-popup.min.js"></script>
    <!--====== Isotope ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/isotope.pkgd.min.js"></script>
    <!--====== Imagesloaded ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/imagesloaded.pkgd.min.js"></script>
    <!--====== Inview ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery.inview.min.js"></script>
    <!--====== Easy Pie Chart ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery.easypiechart.min.js"></script>
    <!--====== Syotimer ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/jquery.syotimer.min.js"></script>
    <!--====== Wow ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/wow.min.js"></script>
    <!--====== Main JS ======-->
    <script src="${pageContext.request.contextPath }/bootstrap/js/main.js"></script>
    
</head>
<body>


	<tiles:insertAttribute name="menu"></tiles:insertAttribute>
	<!--====== Preloader Start ======-->
    <div id="preloader">
        <div class="loader-cubes">
            <div class="loader-cube1 loader-cube"></div>
            <div class="loader-cube2 loader-cube"></div>
            <div class="loader-cube4 loader-cube"></div>
            <div class="loader-cube3 loader-cube"></div>
        </div>
    </div>
    <!--====== Preloader End ======-->
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<tiles:insertAttribute name="foot"></tiles:insertAttribute>
	
</body>
</html>