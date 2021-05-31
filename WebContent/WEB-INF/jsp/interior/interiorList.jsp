<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#bigWrap {
	width: 1920px;
	height: auto;
	margin: 30px auto;
	background-color: #f6f6f6;
}

#smallWrap {
	width: 1100px;
	height: 500px;
	margin: 50px auto;
	border-radius: 30px; margin : 50px auto;
	background-color: white;
	margin: 50px auto;
}

#itemImg {
	width: 500px;
	height: 500px;
	float: left;
	padding: 15px;
}

#itemTextArea {
	text-align: center;
	font-weight: bold;
	padding-top: 20px;
}
</style>

<!-- interiorList.do 요청 후 결과 값 -->
<hr>
<div id="bigWrap">
	큰 DIV
	<div id="smallWrap">
		<div>
			<img
				src="${pageContext.request.contextPath }/bootstrap/img/kitchen.jpg"
				id="itemImg">
		</div>
		<div id="itemTextArea">
			dasfdasgagaregfadfadsgagdagfdfsgfsdgsdgsgr
		</div>
	</div>
	<div id="smallWrap">작은 DIV</div>
	<div id="smallWrap">작은 DIV</div>
	<div id="smallWrap">작은 DIV</div>
</div>
<hr>