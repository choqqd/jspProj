<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList</title>
<script>
	$(document).ready(function() {
		$('#delBtn').click(function() {
			var result = confirm('정말 삭제하시겠습니까?');
			if (result) { //yes
				return true;
			} else { //no
				return false;
			}
		});
	});
	function goPage(page) {
		location.href = "MemberListPage.do?page=" + page;
	}
	
</script>
<style>
.table {
	vertical-align: middle;
}

#title>th {
	border-radius: 10px;
	padding: 10px auto;
}

#memberlList>td {
	border-right: 1px solid #dee2e6;
	vertical-align: middle;
}

span {
	display: inline;
}
</style>
</head>
<body>
	<hr>
	<div align="center" style="margin: 50px auto">
		<h3 style="margin: 30px auto;">회원리스트</h3>
		<div style="width: 100%">
			<table class="table" style="text-align: center;">

				<tr id="title">
					<th>ID</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>요청사항</th>
				</tr>
				<c:forEach items="${memberList }" var="vo">
					<tr id="memberlList">
						<td>${vo.memberId }</td>
						<td>${vo.memberName }</td>
						<td>${vo.memberMail }</td>
						<td>${vo.memberTel }</td>
						<td>${vo.memberAddr }</td>
						<td>${vo.memberReq }</td>
						<td>
							<button id="delBtn" class="btn btn-outline-dark" type="button"
								onclick="location.href='memberUpdate.do?id=${vo.memberId}'">회원삭제
							</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!-- 페이징 호출 -->
		<jsp:include page="../common/paging.jsp" flush="true">
			<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
			<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
			<jsp:param name="startPageNo" value="${paging.startPageNo}" />
			<jsp:param name="pageNo" value="${paging.pageNo}" />
			<jsp:param name="endPageNo" value="${paging.endPageNo}" />
			<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
			<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		</jsp:include>
		<!-- 페이징 호출 종료 -->
	</div>

</body>
</html>