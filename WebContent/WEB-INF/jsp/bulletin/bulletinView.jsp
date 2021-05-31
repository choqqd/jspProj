<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.s-title{
	display: inline-block;
    line-height: 20px;
    background: #e2eaf6;
    color: #3a8afd;
    padding: 0 10px;
    border-radius: 3px;
}
h2{
	display: block;
    font-size: 2em;
    margin: 5px 0 0;
    word-break: break-all;
}
.bt-he{
	width: 80%;
	margin: 10px auto;
}
.bt-se{
	text-align: center;
	min-height: 200px;
    height: auto;
}
</style>
</head>
<body>
	<div class="bt-he">
		<span class="s-title">${bvo.dsName }</span>
		<h2>Designing No.${bvo.btCode }</h2>
		<span>${bvo.writer } </span>
	</div>
	<div class="bt-se">
		<img src="${pageContext.request.contextPath }/bootstrap/img/${bvo.btFileName }">
		<p>${bvo.btContent }</p>
	</div>
	<button type="button" onclick="location.href='designerPage.do'"> 목록보기</button>
</body>
</html>