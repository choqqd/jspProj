<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
$(function(){
	CKEDITOR.replace('content',{
		filebrowserUploadUrl: '${pageContext.request.contextPath }/uploadImage',
		height: '600px',
		width: '1400px'
	});
})
</script>
<style>
	.tablebox{
		margin: auto;
		width: 80%;
		min-height: 400px;
	}
</style>
</head>
<body>
<div class="tablebox">
	<table class ="table">
		<tr>
			<th>작성자</th><td>${name }</td>
		</tr>
		<tr>
			<th>내용</th><td></td>
		</tr>
		<tr>
			<td colspan="2"><textarea id="content" name="content" rows="30" cols="90"></textarea></td>
		</tr>
</table>
</div>
</body>
</html>