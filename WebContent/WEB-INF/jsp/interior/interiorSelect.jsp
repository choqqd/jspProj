<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	width: 40%;
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
	height: 500px;
	float: left;
	padding: 30px;
	margin-left: 100px;
}

.dsImg {
	width: 100px;
	height: 100px;
	margin: 20px;
}

#fuckInput {
	width: 20%;
	margin: 0px;
	height: auto;
}

input {
	width: 10%;
	height: auto;
	background-color: #fff;
	color: #81a3bb;
	padding: 0px;
	font-size: 16px;
	border: none;
	overflow: hidden;
	background-color: #fff;
}
</style>
<body>
	<hr>
	<div class="wrap">
		<div class="Area">
			<img class="itemImage"
				src="${pageContext.request.contextPath }/bootstrap/img/${select.itemImage}">
			<div class="textArea">
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
					<tr class="trTag">
						<th>판매가격</th>
						<td>${select.price }</td>
					</tr>
				</table>
				<div>
					수량 : <input type=hidden name="sell_price" value="${select.price }">
					<input type="text" name="amount" value="1" onchange="change();">
					<input type="button" value=" + " onclick="add();"> <input
						type="button" value=" - " onclick="del();"> 금액 : <input
						type="text" class="form-control num_only num_comma num_sum"
						id="fn_type1_price" name="fn_type1_price" value="" placeholder="">원
				</div>

			</div>
		</div>
	</div>
	<hr>
</body>
콘솔에 히든 val 찍어보기 
</html>