<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>

<style>
table {
	margin: 20px 0px;
}

td {
	padding: 10px 0px;
}

input {
	border: 1px solid black;
	width: 500px;
}
</style>

<div id="wrap" align="center">
	<form action="memberJoin.do" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="idd" id="memberId">
					<button type="button" id="idCheck" value="unChecked"
						class="btn btn-outline-dark">중복체크</button></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" id="memberPwd"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="memberName"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="mail" id="memberMail"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" id="memberTel"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" id="memberAddr"></td>
			</tr>
			<tr>
				<th>요청사항
					<p style="color: gray;">(집구조, 평수)</p>
				</th>
				<td><textarea id="req" name="req"></textarea></td>
			</tr>
		</table>
		<button type="button" class="btn btn-outline-dark" onclick="check()">회원가입</button>
		<button type="button" class="btn btn-outline-dark"
			onclick="location.href = 'memberLogin.do'">돌아가기</button>
	</form>
</div>
<hr>


<script>
	$(function() {
		CKEDITOR
				.replace(
						'req',
						{
							filebrowserUploadUrl : '${pageContext.request.contextPath }/uploadImage',
							height : '600px',
							width : '800px'
						});
	})

	function check() {
		if (frm.memberId.value == "") {
			alert("아이디를 입력하세요.")
			frm.memberId.focus();
			return false;
		}
		if (frm.idCheck.value == 'unChecked') {
			alert("중복체크를 하세요.");
			return false;
		}
		if (frm.memberPwd.value == "") {
			alert("비밀번호를 입력하세요.")
			frm.memberPwd.focus();
			return false;
		}
		frm.submit();
	}
</script>
