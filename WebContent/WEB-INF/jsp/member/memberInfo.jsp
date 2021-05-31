<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#wrap {
	margin: 30px auto;
}

table {
	width: 80%;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

td {
	padding: 10px 20px;
}

tr {
	padding: 10px 20px;
}

input {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	width: 100%;
	margin: 10px 0px;
}
#bottomBtn {
	margin: 30px 20px;
}
#checkBtn {
	margin: 30px 0px;
}
</style>

<div id="wrap" align="center">
	<h2>${info.memberName }님의회원정보</h2>
	<form id="frm" action="memberUpdate.do" method="post">
		<input type="hidden" name="id" id="id" value="${info.memberId }">
		<table id="update">
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
					value="${info.memberName }">
					<button value="unChecked" type="button" id="checkPwd"
						class="btn btn-outline-dark">비밀번호 확인</button></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name"
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
				<th colspan="2" style="text-align: center">요청사항</th>
			</tr>
			<tr>
				<td colspan="2"><textarea
						style="border: 1px solid black; text-align: center" name="req"
						onFocus="this.value='';return true;">${info.memberReq }</textarea></td>
			</tr>
		</table>
		<button type="button" class="btn btn-outline-dark" id="bottomBtn"
			onclick="updateCheck()">정보수정</button>
		<button type="button" class="btn btn-outline-dark" id="bottomBtn"
			onclick="location.href='memberUpdate.do?id=${info.memberId}'">회원탈퇴</button>
		<button type="button" class="btn btn-outline-dark" id="bottomBtn"
			onclick="location.href='index.do'">첫 페이지</button>
	</form>
</div>

<script>
	$(document).ready(function() {
		$('#checkPwd').click(function() {
			if ($('#pwd').val() == $('#pwdCheck').val()) {
				alert('일치합니다.');
				$('#name').focus();
				$('#checkPwd').val('checked');
			} else {
				alert('비밀번호가 일치하지 않습니다.');
				$('#pwd').val('');
				$('#checkPwd').val('');
				$('#pwd').focus();
			}
		});
	});

	function updateCheck() {
		if (frm.checkPwd.value == 'unChecked') {
			alert("중복체크를 하세요.");
			return false;
		}
		if (frm.pwd.value == "") {
			alert("비밀번호를 입력하세요.")
			frm.pwd.focus();
			return false;
		}
		frm.submit();
	}
</script>
