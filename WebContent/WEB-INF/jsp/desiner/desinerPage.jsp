<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	function desite(Name){
		frm.DesinerName.value=Name;
		frm.submit();
	}
	
	function bulletinView(code){
		bfrm.btCode.value=code;
		bfrm.submit();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2{
		display: block;
		text-align: center;
	}
	.ds-ul{
		display: flex;
    	align-items: center;
    	justify-content: space-between;
    	padding: 30px 0 50px;
    	text-align: center;
    	list-style: none;
	}
	.de-allbox{
		max-width: 1400px;
   		margin: 0 auto;
	}
	.de-box{
		display: flex;
    	padding: 20px 100px;
    	box-sizing: border-box;
    	border-radius: 8px;
    	background-color: #fff;
    	color: #8c8c8c;
	}
	.de-box1{
		width: 90%;
    	padding: 55px 76px;
    	border: 1px solid #e1e1e1;
    	background-color: #fff;
    	box-sizing: border-box;
    	border-radius: 8px;
    	color: #8c8c8c;
    	word-break:break-all;
    	word-wrap:break-word;
    	margin-top: 30px;
	}

	.de-infobox{
		display: inline-block;
		border: 1px solid #e1e1e1;
		margin-right:50px;
		margin-top: 20px;
		
	}
	.info{
	}
	span{
	display: block;
	}
	img{
	width: 220px;
	}
	.inpu{
	display: block;
	}
</style>
</head>
<body>
	<h2>Desiner List Info</h2>
	<form id = "frm" action="designerinfoPage.do" method="post">
		<input type="hidden" id ="DesinerName" name = "DesinerName" >
	</form>
	<form id="bfrm" action="bulletinView.do" method="post">
		<input type="hidden" id="btCode" name="btCode">
	</form>
	<div style="width: 80%; margin: 0 auto;">
		<ul class = "ds-ul">
		<c:forEach items="${list }" var="vo">
			<li onclick = "desite('${vo.dsName }')">
				<img src="${pageContext.request.contextPath }/bootstrap/img/${vo.dsImage }" />
				<p>${vo.dsName }</p>
			</li>
		</c:forEach>
		</ul>
	</div>
	
	
	<div class="de-allbox">
		<c:choose>
			<c:when test="${!empty rvo }">
				<div id="showdox" class="de-box1">
					<div class="de-box">
						<div class="de-box">
							<img src="${pageContext.request.contextPath }/bootstrap/img/${rvo.dsImage }">
						</div>
						<div class="de-box">${rvo.dsInfo }</div>
					</div>
				</div>


				<div class="de-box1">
					<h2> 후기 게시판</h2>
					<c:if test="${!empty id }">
						<button class="inpu" type = "button" onclick="location.href='bulletinInsertForm.do'">후기 작성</button>
					</c:if>
					<c:forEach items="${blist }" var="bvo">
						<div class="de-infobox" onclick="bulletinView(${bvo.btCode})">
							<div class="info">
								<img src="${pageContext.request.contextPath }/bootstrap/img/cont.PNG">
							</div>
							<div class="info">
								<span>Designer: ${bvo.dsName} </span> <span>Designing
									NO. ${bvo.btCode }</span> <span>작성자: ${bvo.writer }</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<div class="de-box">
					디자이너를 클릭해주세요!
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>