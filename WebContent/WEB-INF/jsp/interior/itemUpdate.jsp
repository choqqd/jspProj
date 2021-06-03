<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#updateItem {
	width: 80%;
	margin: 50px auto;
}

input, textarea {
	border: 1px solid black;
}
</style>
</head>
<body>
	<div id="updateItem">
		<form action="updateItem.do" method="post">
			<table class="table">
				<tr>
					<th width="200px">상품이름</th>
					<td><input type="text" name="itemName"></td>
					<th>가격</th>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<th>디자이너 이름</th>
					<td colspan="3"><input name="dsname"></td>
				</tr>
				<tr>
					<td>설명</td>
					<td colspan="3"><textarea id="itemdesc" name="itemdesc"
							rows="30" cols="90"></textarea></td>
				</tr>
				<tr>
					<td>업로드 파일</td>
					<td colspan="3"><textarea
							name="req" id="req"
							onFocus="this.value='';return true;"></textarea></td>
				</tr>
				<tr>
					<td colspan="4">
						<button class="btn btn-outline-dark"
							onclick="location.href='interiorList.do'">목록보기</button>
						<button class="btn btn-outline-dark" type="submit">저장</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>