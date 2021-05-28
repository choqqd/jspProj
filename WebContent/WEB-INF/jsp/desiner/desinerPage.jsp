<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2{
		display: block;
		text-align: center;
	}
	.ds-ul{
		display: flex;
    	align-items: center;
    	justify-content: space-between;
    	padding: 30px 0 50px;
    	text-align: center;
    	list-style: none;
	}
	.de-allbox{
		max-width: 1400px;
   		margin: 0 auto;
	}
	.de-box{
		display: flex;
    	padding: 55px 76px;
    	border: 1px solid #e1e1e1;
    	box-sizing: border-box;
    	border-radius: 8px;
    	background-color: #fff;
    	color: #8c8c8c;
	}

</style>
</head>
<body>
	<h2>Desiner List Info</h2>
	<div style="width: 80%; margin: 0 auto;">
		<ul class = "ds-ul">
		<c:forEach items="${list }" var="vo">
			<li>
				<img src="${pageContext.request.contextPath }/bootstrap/img/${vo.dsImage }" />
				<p>${vo.dsName }</p>
			</li>
		</c:forEach>
		</ul>
	</div>
	<div class="de-allbox">
		<div class="de-box">
			asdfasdfasdfasdf
		</div>
	</div>
</body>
</html>