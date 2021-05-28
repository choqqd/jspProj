<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#LoginTop>h2 {
	display: inline-block;
	margin: 20px;
}

table {
	margin: 20px 0px;
}

button {
	margin: 20px 0px;
}
</style>
</head>
<body>
<hr>
	<div align="center">

		<div id="LoginTop">
			<h2>로그인</h2>
			<h2>
				<a href="memberJoinForm.do">회원가입</a>
			</h2>
		</div>

		<form action="memberLoginForm.do" method="post">
			<table border="1">
				<tr>
					<td><input type="text" name="id" value="아이디를 입력하세요"></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" value="********"></td>
				</tr>
			</table>
			<button type="button" class="btn btn-outline-dark" onclick="Check()">로그인</button>
			<button type="reset" class="btn btn-outline-dark">취소</button>
			<button type="button" class="btn btn-outline-dark"
				onclick="location.href='index.do'">첫 페이지</button>
		</form>

	</div>
<hr>
</body>
</html>