<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tablebox {
	margin: auto;
	width: 80%;
	min-height: 400px;
}
input{
	width: 250px;
	height: 30px;
	background-color: #fff;
	color: #81a3bb;
	border: 1px solid pink;
	border-radius: 2px;
}
</style>
</head>
<body>
	<div class="tablebox">
			<table class="table">
				<tr>
					<th width="200px">아이템이름 </th>
					<td><input type="text" name="itemName"></td>
					<th>가격 </th>
					<td><input type="text" name="price"></td> 
				</tr>
				<tr>
					<th >디자이너 이름 </th>
					<td colspan="3"><input name="dsname"></td>
				</tr>
				<tr>
					<td> 설명 </td>
					<td colspan="3"><textarea id="itemdesc" name="itemdesc" rows="30" cols="90"></textarea></td>
				</tr>
				<tr>
					<td>업로드 파일</td>
					<td colspan="3"><input type="file" name="filename" id="filename"></td>
				</tr>
				<tr>
					<td colspan="4">
						<button class="btn btn-outline-dark" onclick="location.href='main.do'">목록보기</button>
						<button class="btn btn-outline-dark" onclick="location.href=''">저장</button>
					</td>
				</tr>
			</table>
	</div>
</body>
</html>