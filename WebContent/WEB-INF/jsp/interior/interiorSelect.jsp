<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<style>
.wrap {
	height: auto;
	width: 100%;
	margin: 20px auto;
}

.Area {
	width: 80%;;
	margin: 20px auto;
}

.textArea {
	width: 50%;
	display: inline-block;
	text-align: center;
	margin: 15px auto;
	line-height: 1.5cm;
	display: inline-block;
}

.ulTag {
	word-spacing: 0.1em;
	list-style: none;
	font-size: 16pt;
}

.desc {
	color: #a9a9a9;
}

.itemTable {
	width: 100%;
	margin: 30px auto;
}

.trTag {
	border-top: 1px solid #e2e2e2;
	text-align: left;
	margin: 0px 0px 0px 45px;
}

.itemImage {
	width: 500px;
	height: 600px;
	float: left;
	padding: 30px;
	margin-left: 100px;
}

.dsImg {
	width: 100px;
	height: 100px;
	margin: 20px 50px;
}

#fuckInput {
	width: 20%;
	margin: 0px;
	height: auto;
}

input {
	width: 80px;
	height: auto;
	background-color: #fff;
	color: #81a3bb;
	padding: 0px;
	font-size: 16px;
	background-color: #fff;
	text-align: center;
	margin: 10px 0px;
}

#frm {
	float: left;
	text-align: left;
	margin: 0px auto;
}

#inputBtn {
	margin-left: 5px;
}

#buyIt {
	float: left;
	margin-left: 5px;
}

#adminBtn, #delBtn {
	margin-top: 20px;
	width: 100%;
}

#updateDelete {
	float: right;
	width: 30%;
	display: block;
}
</style>
<body onload="init();">
	<hr>
	<div class="wrap">

		<div class="Area">
			<img class="itemImage"
				src="${pageContext.request.contextPath }/upload/${select.itemImage}">
			<div class="textArea">
				<div id="updateDelete">
					<c:if test="${id eq 'admin' }">
						<button id="adminBtn" type="button" class="btn btn-outline-dark"
							onclick="location.href='updatePage.do?itemCode=${select.itemCode}'">(관리자)수정하기</button>
						<button id="delBtn" type="button" class="btn btn-outline-dark"
							onclick="location.href='deleteItem.do?itemCode=${select.itemCode}'">(관리자)삭제하기</button>
					</c:if>
				</div>
				<ul class="ulTag">
					<li style="font-weight: bold;">${select.itemName }</li>
					<li class="desc">${select.itemDesc }</li>
				</ul>
				<table class="itemTable">
					<tr class="trTag">
						<th>판매가격</th>
						<td><fmt:formatNumber type="currency"
								value="${select.price }"></fmt:formatNumber></td>
					</tr>
					<tr class="trTag">
						<th>담당디자이너</th>
						<td>${select.dsName }디자이너<img class="dsImg"
							src="${pageContext.request.contextPath }/bootstrap/img/${select.dsImage}">
						</td>
					</tr>
				</table>
				<div>
					<!--
					<form action="get" id="frm">
						<input id="sell_price" type="hidden" value="${select.price }"> 
						수량 : <input type="text" class="i1"> 주문금액 : <span></span>
					</form>
					  -->
					<!-- 장바구니로 넘겨주기 -->
					<form id="frm" action="addCart1.do" name="form" method="post">
						<h5>
							<input type=hidden id="id" name="id" value="${id }"> <input
								type=hidden id="itemCode" name="itemCode1"
								value="${select.itemCode }"> 수량 : <input type=hidden
								name="sell_price" value="${select.price }"> <input
								id="amount" type="text" name="amount" value="1" size="3"
								onchange="change();">개 <input
								class="btn btn-outline-dark" id="inputBtn" type="button"
								value=" + " onclick="add();"> <input id="inputBtn"
								class="btn btn-outline-dark" type="button" value=" - "
								onclick="del();"> <br> 금액 : <input type="text"
								id="sum" name="sum" size="11" readonly>원
						</h5>
						<br>
						<button id="buyIt" type="button" class="btn btn-outline-dark"
							onclick="check_module()">구매하기</button>
						<button id="buyIt" type="submit" class="btn btn-outline-dark">장바구니</button>
					</form>
					<!-- 관리자 아이디 일때 수정, 삭제버튼 추가 -->
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div>
		<h1 style="text-align: center">~~상세내용들~~</h1>
	</div>
</body>
<script>
	/*$(document).ready(function() {
		$('.i1').on('keyup', function(e) {
			var amount = ($('#sell_price').val() * $('.i1').val());
			$('span').append(amount + '원');
		});
	})*/
	$(function() {
		console.log($('#itemCode').val());
		$('#delBtn').click(function() {
			var result = confirm('정말 삭제하시겠습니까?');
			if (result) { //yes
				return true;
			} else { //no
				return false;
			}
		})
	});
		var sell_price;
		var amount;

		function init() {
			sell_price = document.form.sell_price.value;
			amount = document.form.amount.value;
			document.form.sum.value = sell_price;
			change();
		}

		function add() {
			hm = document.form.amount;
			sum = document.form.sum;
			hm.value++;

			sum.value = parseInt(hm.value) * sell_price;
		}

		function del() {
			hm = document.form.amount;
			sum = document.form.sum;
			if (hm.value > 1) {
				hm.value--;
				sum.value = parseInt(hm.value) * sell_price;
			}
		}

		function change() {
			hm = document.form.amount;
			sum = document.form.sum;

			if (hm.value < 0) {
				hm.value = 0;
			}
			sum.value = parseInt(hm.value) * sell_price;
		}
</script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function check_module() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp80072882'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(), //상품코드(카트번호)
			name : '주문명:결제테스트', //주문번호
			amount : $('#sum').val(), //금액
			buyer_email : 'iamport@siot.do', //이메일
			buyer_name : '구매자이름', //구매자이름
			buyer_tel : '010-1234-5678', //구매자 전화번호
			buyer_addr : '서울특별시 강남구 삼성동', //구매자 주소
			buyer_postcode : '123-456', //우편번호
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'

		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	};
</script>
</html>