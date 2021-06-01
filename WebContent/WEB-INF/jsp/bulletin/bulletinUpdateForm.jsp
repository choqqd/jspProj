<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	$(
			function() {
				CKEDITOR
						.replace(
								'content',
								{
									filebrowserUploadUrl : '${pageContext.request.contextPath }/uploadImage',
									height : '600px',
									width : '1400px'
								});
			})
</script>
<style>
.tablebox {
	margin: auto;
	width: 80%;
	min-height: 400px;
}

input {
	width: 250px;
	height: 30px;
	background-color: #fff;
	color: #81a3bb;
	border: 1px solid pink;
	border-radius: 2px;
}
</style>
</head>
<body>
	<form>
	<input type="hidden" id="btcode" name="btcode" value="${btcode }">
		<table class="table">
			<tr>
				<th width="200px">작성자</th>
				<td>${name }</td>
			</tr>
			<tr>
				<th>디자이너 이름</th>
				<td><input id="dsname" name="dsname" value="${dsname }"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="content" name="content" rows="30"	cols="90">${content }</textarea></td>
			</tr>
			<tr>
				<td>
					<button class="btn btn-outline-dark" onclick="location.href='main.do'">목록보기</button>
					<button class="btn btn-outline-dark" onclick="location.href='bulletinUpdate.do'">수정</button>
				</td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>