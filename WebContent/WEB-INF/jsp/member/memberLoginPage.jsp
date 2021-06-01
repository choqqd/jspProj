<%@page import="com.jspProj.member.serviceImpl.MemberServiceImpl"%>
<%@page import="com.jspProj.member.vo.MemberVO"%>
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
		if (frm.memberId.value == "아이디") {
			alert("아이디를 입력해주세요!");
			frm.memberId.focus();
			return false;
		}
		if (frm.memberPwd.value == "비밀번호dddd") {
			alert("비밀번호를 입력해주세요!");
			frm.memberPwd.focus();
			return false;
		}
		frm.submit();
	}
</script>
<style>
body {
	font-size: 0.75em;
}

#wrap {
	border: 1px solid #dde7e9;
	margin: 100px auto 100px;
	width: 20%;
	height: auto;
}

a {
	color: black;
	text-decoration: none;
	cursor: auto;
}

a:link:active, a:visited:active {
	color: black;
	text-decoration: none;
}

a:link, a:visited {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#LoginTop {
	width: 100%;
	margin: 0px;
	display: inline-block;
}

#LoginTop>h4 {
	text-align: center;
	display: inline-block;
	margin: 15px 0px 0px 0px;
}

.join {
	font-size: 1.5em;
	width: 49%;
	padding: 20px 0;
	text-align: center;
	background: #f7f7f7;
	color: #6e6e6e;
	float: right;
	margin-right: 0px;
	width: 49%;
}

table {
	padding: 30px;
	width: 100%;
}

button {
	margin: 30px 15px;
	border: 1px solid black;
}

td {
	padding: 20px 0px;
}

input {
	border: 1px solid #d0d3db;
	border-radius: 15px;
	width: 80%;
	margin-left: 40px;
	color: #000;
}
</style>
</head>
<body>
	<hr>
	<div id="wrap">
		<div id="LoginTop" align="center">
			<h4>
				<span>로그인</span>
			</h4>
			<a href="memberJoinForm.do" class="join">회원가입</a>
		</div>
		<div align="center">
			<form id="frm" action="memberLoginForm.do" method="post">
				<table>
					<tr>
						<td><input type="text" name="id" id="memberId" value="아이디"
							onFocus="this.value='';return true;"></td>
					</tr>
					<tr>
						<td><input type="password" name="pwd" id="memberPwd"
							value="비밀번호dddd" onFocus="this.value='';return true;"></td>
					</tr>
				</table>

				<button type="button" class="btn btn-outline-dark" onclick="Check()">로그인</button>
				<button type="reset" class="btn btn-outline-dark">취소</button>
				<button type="button" class="btn btn-outline-dark"
					onclick="location.href='index.do'">첫 페이지</button>
			</form>

		</div>

	</div>
	<hr>
</body>
</html>