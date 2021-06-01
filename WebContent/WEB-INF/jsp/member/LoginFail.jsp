<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#fail {
	width: 80%;
	height: auto;
	margin: 30px auto;
}

#return {
	margin: 10px 30px;
}
</style>
</head>
<body>
	<hr>
	<div id="fail" align="center">
		<h2 style="">등록되지 않은 회원입니다.</h2>
		<button type="button" class="btn btn-outline-dark" id="return"
			onclick="location.href='memberLogin.do'">다시시도</button>
		<button type="button" class="btn btn-outline-dark" id="return"
			onclick="location.href='index.do'">첫 페이지</button>
	</div>
	<hr>
</body>
</html>
