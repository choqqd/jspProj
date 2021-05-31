<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#bigWrap {
	width: 100%;
	height: 2000px;
	border: 1px solid black;
	margin: 30px auto;
	border: 1px solid black;
}

#smallWrap {
	width: 60%;
	height: 500px;
	margin: 50px auto;
	border: 1px solid black;
	margin: 50px auto;
}
</style>

<!-- interiorList.do 요청 후 결과 값 -->
<hr>
<div id="bigWrap">
	큰 DIV
	<div id="smallWrap">작은 DIV</div>
	<div id="smallWrap">작은 DIV</div>
	<div id="smallWrap">작은 DIV</div>
	<div id="smallWrap">작은 DIV</div>
</div>
<hr>