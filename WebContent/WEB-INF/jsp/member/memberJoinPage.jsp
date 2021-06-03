<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>


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
		// 속성 탐색 선택자
		// 입력이 변경되었을때 체크값을 unChecked로 변경

		$('#checkPwd').click(function() {
			if ($('#memberPwd').val() == $('#pwdCheck').val()) {
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

		$('#memberId').change(function() {
			$('#idCheck').val('unChecked');
		});

		$('#idCheck').click(function() {
			if ($('#memberId').val() == "") {
				alert('아이디를 입력해주세요.');
				$('#memberId').focus();
				return;
			}
			$.ajax({
				url : 'idCheck',
				data : {
					id : $('#memberId').val()
				},
				type : 'post',
				success : function(data) {
					console.log(data);
					if (data > 0) {
						alert('아이디가 존재합니다. 다른 아이디를 입력하세요.');
						$('#memberId').val("");
						$('#memberId').focus();
					} else {
						alert('사용가능한 아이디입니다.');
						$('#idCheck').val('checked');
						$('#memberPwd').focus();
					}

				},
				error : function(err) {
					console.log(err);
				}
			});
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
<style>
.table {
	width: 50%;
	margin: 20px 0px;
	vertical-align: middle;
}

td {
	padding: 10px 0px;
}

input {
	width: 30%;
	height: 50px;
	background-color: #fff;
	color: #81a3bb;
	padding: 0px;
	font-size: 16px;
	border-top: 1px solid pink;
	border-bottom: 1px solid pink;
	margin: 10px 0px;
}

#idCheck, #checkPwd {
	margin-left: 30px;
}

#back {
	margin: 30px auto;
}
</style>
<hr>
<div id="wrap" align="center">
	<form id="frm" action="memberJoin.do" method="post">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="memberId">
					<button type="button" id="idCheck" value="unChecked"
						class="btn btn-outline-dark">중복체크</button></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" id="memberPwd"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pwdCheck" id="pwdCheck"
					value="" onFocus="this.value='';return true;"
					value="${info.memberName }">
					<button value="unChecked" type="button" id="checkPwd"
						class="btn btn-outline-dark">비밀번호 확인</button></td>
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
		<button type="button" id="back" class="btn btn-outline-dark"
			onclick="check()">회원가입</button>
		<button type="button" id="back" class="btn btn-outline-dark"
			onclick="location.href = 'memberLogin.do'">돌아가기</button>
	</form>
</div>


