<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

	 //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if (roadAddr !== '') {
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
	
	
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
				<td>
					<input type="text" id="sample4_postcode" name = "sample4_postcode" placeholder="우편번호">
   					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
    				<input type="text" id="sample4_roadAddress" name = "sample4_roadAddress" placeholder="도로명주소">
				    <input type="text" id="sample4_jibunAddress" name = "sample4_jibunAddress" placeholder="지번주소">
    				<span id="guide" style="color:#999;display:none"></span>
    				<input type="text" id="sample4_detailAddress" name = "sample4_detailAddress" placeholder="상세주소">
    				<input type="text" id="sample4_extraAddress" name = "sample4_extraAddress" placeholder="참고항목">
				</td>
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


