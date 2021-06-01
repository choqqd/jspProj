<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#bigWrap {
	width: 100%;
	height: 3000px;
	margin: auto;
	background-color: #f6f6f6;
}

#smallWrap {
	width: 1100px;
	height: 500px;
	border-radius: 30px;
	margin: 20px auto;
	background-color: white;
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
	<c:forEach items="${interior }" var="list">
		<div id="smallWrap">
			<div id="itemArea">
				<img
					src="${pageContext.request.contextPath }/bootstrap/img/${list.itemImage}"
					id="itemImg">
			</div>
			<div id="itemTextArea">
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
	</c:forEach>
</div>
<hr>