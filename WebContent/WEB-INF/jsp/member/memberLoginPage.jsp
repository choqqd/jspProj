<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 로그인 체크 및 submit -->
<script>
	function Check() {
		if (frm.memberId.value == "") {
			alert("아이디를 입력해주세요!");
			frm.memberId.focus();
			return false;
		}
		if (frm.memberPwd.value == "") {
			alert("비밀번호를 입력해주세요!");
			frm.memberPwd.focus();
			return false;
		}
		frm.submit();
	}
</script>
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
	border: 1px solid black;
}

td {
	padding: 10px 0px;
}

input {
	border: 1px solid black;
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

		<form id="frm" action="memberLoginForm.do" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" id="memberId"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" id="memberPwd"></td>
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