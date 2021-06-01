<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function deleteCheck(btcode){
	if(confirm("정말 삭제하시겠습니까 ?") == true){
        frm.btcode.value = btcode
        frm.submit();
    }
    else{
        return ;
    }
}
function update(){
	upfrm.submit();
}
</script>
<style>
.s-title {
	display: inline-block;
	line-height: 20px;
	background: #e2eaf6;
	color: #3a8afd;
	padding: 0 10px;
	border-radius: 3px;
}

h2 {
	display: block;
	font-size: 2em;
	margin: 5px 0 0;
	word-break: break-all;
}

.bt-he {
	width: 80%;
	margin: 10px auto;
}

.bt-se {
	text-align: center;
	min-height: 200px;
	height: auto;
}
</style>
</head>
<body>
	<form id="frm" action="bulletinDelete.do" method="post">
		<input type="hidden" id="btcode" name="btcode">
	</form>
	<form id="upfrm" action="bulletinUpdateForm.do" method="post">
		<input type="hidden" id ="dsname" name="dsname" value="${bvo.dsName }">
		<input type="hidden" id="content" name="content" value="${bvo.btContent }">
		<input type="hidden" id="btcode" name="btcode" value="${bvo.btCode }">
	</form>
		<div class="bt-he">
			<span class="s-title">${bvo.dsName }</span>
			<h2>Designing No.${bvo.btCode }</h2>
			<span>${bvo.writer } </span>
		</div>
		<div class="bt-se">
			<p>${bvo.btContent }</p>
		</div>
		<c:if test="${name eq bvo.writer}">
			<button type="button" onclick = "deleteCheck(${bvo.btCode })">삭제하기</button>
			<button type="button" onclick = "update()">수정하기</button>
		</c:if>
	<button type="button" onclick="location.href='designerPage.do'"> 목록보기</button>

</body>
</html>