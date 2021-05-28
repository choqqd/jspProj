<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	tr {
		border: 1px solid black;
	}
</style>

<div id="wrap" align="center">
	<form action="memberJoin.do" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>요청사항
					<p style="color: gray;">(미리 적으시면 편해요~!~!~!)</p>
				</th>
				<td>
				<input type="text">
				</td>
			</tr>
		</table>
		
	</form>
</div>
<hr>
