<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function check_module(sum) {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp80072882'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(), //상품코드(카트번호)
			name : '주문명:결제테스트', //주문번호
			amount : sum, //금액
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

<style>
.table {
	vertical-align: middle;
}

#title>th {
	border-radius: 10px;
	padding: 20px auto;
}
</style>
<!-- F5번 막기 -->
<script>
	$(document).keydown(function(e) {
		key = (e) ? e.keyCode : event.keyCode;
		var t = document.activeElement;
		if (key == 8 || key == 116 || key == 17 || key == 82) {
			if (key == 8) {
				if (t.tagName != "INPUT") {
					if (e) {
						e.preventDefault();
					} else {
						event.keyCode = 0;
						event.returnValue = false;
					}
				}
			} else {
				if (e) {
					e.preventDefault();
				} else {
					event.keyCode = 0;
					event.returnValue = false;
				}
			}
		}
	});
</script>
</head>
<body>
	<hr>
	<div align="center" style="margin: 50px auto">
		<c:choose>
			<c:when test="${!empty id }">
				<h3 style="margin: 30px auto;">${name }님장바구니</h3>
			</c:when>
			<c:otherwise>
				<h3 style="margin: 30px auto;">장바구니</h3>
			</c:otherwise>
		</c:choose>
		<form action="deleteCart.do" method="POST">
			<div style="width: 80%">
				<table class="table" style="text-align: center;">

					<tr id="title">
						<th>상품명</th>
						<th>총수량</th>
						<th>판매가</th>
						<th>배송비</th>
						<th>소계</th>
						<th></th>
					</tr>
					<c:forEach items="${list }" var="vo">
						<input type="hidden" name="memberId" value="${vo.memberId }">
						<input type="hidden" name="memberId" value="${vo.dsName }">
						<tr>
							<td style="cursor: pointer;"
								onclick="location.href='interiorSelect.do?itemCode=${vo.itemCode}&dsName=${vo.dsName}'">${vo.itemName }</td>
							<td>${vo.amount }</td>
							<td><fmt:formatNumber type="currency" value="${vo.price }"></fmt:formatNumber></td>
							<td><fmt:formatNumber type="currency" value="2500"></fmt:formatNumber></td>
							<td><input type="hidden" id="sum"
								value="${vo.amount * vo.price + 2500}">
							<fmt:formatNumber type="currency"
									value="${vo.amount * vo.price + 2500}"></fmt:formatNumber></td>
							<td id="btnDD">
								<button id="buyIt" type="button" class="btn btn-outline-dark"
									onclick="check_module(${vo.amount * vo.price})" >구매</button>
								<button class="btn btn-outline-dark" type="button"
									onclick="location.href='deleteCart.do?itemCode=${vo.itemCode}&memberId=${vo.memberId }'">비우기
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href='interiorList.do'">다시 둘러보기</button>
					<button class="btn btn-outline-dark" type="submit"
						style="float: right;">전체비우기</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>