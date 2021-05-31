<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#wrap {
	margin: 30px auto;
}

table {
	margin: 20px 0px;
}

td {
	padding: 10px 20px;
}

tr {
	padding: 10px 20px;
}

input {
	border: 1px solid black;
	width: 200px;
}
</style>

<div id="wrap" align="center">
	<h2>${name }님의회원정보</h2>
	<form id="frm" action="memberDel.do" method="post">
		<input type="hidden" name = "id" id="id" value="${info.memberId }" >
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>${info.memberId }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" id="pwd" value="********"
					onFocus="this.value='';return true;" value="${info.memberName }"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pwdCheck" id="pwdCheck"
					value="********" onFocus="this.value='';return true;"
					value="${info.memberName }"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"
					onFocus="this.value='';return true;" value="${info.memberName }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="mail"
					onFocus="this.value='';return true;" value="${info.memberMail }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel"
					onFocus="this.value='';return true;" value="${info.memberTel }"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr"
					onFocus="this.value='';return true;" value="${info.memberAddr }"></td>
			</tr>
			<tr>
				<th>요청사항</th>
				<td><input type="text" name="req"
					onFocus="this.value='';return true;" value="${info.memberReq }"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-outline-dark" >정보수정</button>
		<button type="button" class="btn btn-outline-dark" onclick="location.href='memberUpdate.do?id=${info.memberId}'">회원탈퇴</button>
		<button type="button" class="btn btn-outline-dark"
			onclick="location.href='index.do'">첫 페이지</button>
	</form>
</div>


