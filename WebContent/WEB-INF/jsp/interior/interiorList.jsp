<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
#bigWrap {
	width: 100%;
	height: auto;
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

ul {
	word-spacing: 0.1em;
	list-style: none;
	font-size: 24pt;
	line-height: 2.5cm;
}

#circle {
	width: 30px;
	height: 30px;
}

.desc {
	color: #a9a9a9;
}

#btn {
	margin-top: 120px;
	width: 50%;
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
					<li><img id="circle"
						src="${pageContext.request.contextPath }/bootstrap/img/circle.png">
						<span>${list.itemName }</span></li>
					<li class="desc">${list.itemDesc }</li>
					<li><fmt:formatNumber type="currency" value="${list.price }"></fmt:formatNumber></li>
				</ul>
				<button id="btn" class="btn btn-outline-dark"
					onclick="location.href='interiorSelect.do?itemCode=${list.itemCode}'">자세히 보기</button>
			</div>
		</div>
	</c:forEach>
</div>
<hr>