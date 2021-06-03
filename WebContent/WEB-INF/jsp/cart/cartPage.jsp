<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
.table {
	vertical-align: middle;
}

#title>th {
	border-radius: 10px;
	padding: 20px auto;
}
</style>
<!-- F5번 막기 -->
<script>
	$(document).keydown(function(e) {
		key = (e) ? e.keyCode : event.keyCode;
		var t = document.activeElement;
		if (key == 8 || key == 116 || key == 17 || key == 82) {
			if (key == 8) {
				if (t.tagName != "INPUT") {
					if (e) {
						e.preventDefault();
					} else {
						event.keyCode = 0;
						event.returnValue = false;
					}
				}
			} else {
				if (e) {
					e.preventDefault();
				} else {
					event.keyCode = 0;
					event.returnValue = false;
				}
			}
		}
	});
</script>
</head>
<body>
	<hr>
	<div align="center" style="margin: 50px auto">
		<c:choose>
			<c:when test="${!empty id }">
				<h3 style="margin: 30px auto;">${name }님장바구니</h3>
			</c:when>
			<c:otherwise>
				<h3 style="margin: 30px auto;">장바구니</h3>
			</c:otherwise>
		</c:choose>
		<form action="deleteCart.do" method="POST">
			<div style="width: 80%">
				<table class="table" style="text-align: center;">

					<tr id="title">
						<th>상품명</th>
						<th>총수량</th>
						<th>판매가</th>
						<th>배송비</th>
						<th>소계</th>
						<th><button class="btn btn-outline-dark" type="submit">전체삭제</button></th>
					</tr>
					<c:forEach items="${list }" var="vo">
						<input type="hidden" name="memberId" value="${vo.memberId }">
						<tr>
							<td>${vo.itemName }</td>
							<td>${vo.amount }</td>
							<td><fmt:formatNumber type="currency" value="${vo.price }"></fmt:formatNumber></td>
							<td><fmt:formatNumber type="currency" value="2500"></fmt:formatNumber></td>
							<td><fmt:formatNumber type="currency"
									value="${vo.amount * vo.price + 2500}"></fmt:formatNumber></td>
							<td><button class="btn btn-outline-dark" type="button"
									onclick="location.href='deleteCart.do?itemCode=${vo.itemCode}&memberId=${vo.memberId }'">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href='interiorList.do'">다시 둘러보기</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>