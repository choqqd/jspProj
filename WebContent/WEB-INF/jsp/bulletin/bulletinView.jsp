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
	width: 80%;
	text-align: center;
	min-height: 200px;
	height: auto;
	border-top: 2px solid #e1e1e1;
	border-bottom: 2px solid #e1e1e1;
	margin: 30px auto;
	padding: 20px;
}

.btnArea {
	width: 80%;
	margin: 20px auto;
}
</style>
</head>
<body>
	<form id="frm" action="bulletinDelete.do" method="post">
		<input type="hidden" id="btcode" name="btcode">
	</form>
	<form id="upfrm" action="bulletinUpdateForm.do" method="post">
		<input type="hidden" id="dsname" name="dsname" value="${bvo.dsName }">
		<input type="hidden" id="content" name="content"
			value="${bvo.btContent }"> <input type="hidden" id="btcode"
			name="btcode" value="${bvo.btCode }"> <input type="hidden"
			id="writer" name="writer" value="${bvo.writer }">
	</form>
	<div class="bt-he">
		<span class="s-title">${bvo.dsName } 디자이너</span>
		<h2>Designing No.${bvo.btCode }</h2>
		<span>${bvo.writer } </span>
	</div>
	<div class="bt-se">
		<p>${bvo.btContent }</p>
	</div>
	<div class="btnArea">
		<c:if test="${name eq bvo.writer}">
			<button type="button" class="btn btn-outline-dark"
				onclick="deleteCheck(${bvo.btCode })">삭제하기</button>
			<button type="button" class="btn btn-outline-dark" onclick="update()">수정하기</button>
		</c:if>
		<button type="button" class="btn btn-outline-dark"
			onclick="location.href='designerPage.do'">돌아가기</button>
	</div>
	<hr>



</body>
</html>