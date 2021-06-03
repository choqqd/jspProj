
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
h2 {
	text-align: center;
}

.ds-ul {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 30px 0 50px;
	text-align: center;
	list-style: none;
	margin-top: 30px;
}

.de-allbox {
	max-width: 1400px;
	margin: 0 auto;
}

.de-box {
	display: flex;
	padding: 20px 100px;
	box-sizing: border-box;
	border-radius: 8px;
	background-color: #fff;
	color: #8c8c8c;
}

.de-box1 {
	width: 90%;
	padding: 55px 76px;
	border: 1px solid #e1e1e1;
	background-color: #fff;
	box-sizing: border-box;
	border-radius: 8px;
	color: #8c8c8c;
	word-break: break-all;
	word-wrap: break-word;
	margin: 30px auto;
}

.de-infobox {
	display: inline-block;
	border: 1px solid #e1e1e1;
	margin-right: 50px;
	margin-top: 20px;
}

span {
	display: block;
}

.img {
	width: 220px;
	height: 200px;
}

#inpu {
	display: block;
}

body {
	
}

#insertBtn {
	float: right;
	margin: 0px 20px;
}

#eventBtn {
	margin: 10px auto;
}
#wwwrap {
	background-color: #f6f6f6;
}
.de-box11 {
	border-left: 2px solid #e1e1e1;
	display: flex;
	padding: 20px 100px;
	box-sizing: border-box;
	border-radius: 8px;
	background-color: #fff;
}
</style>
</head>
<body>
	<hr>
	<div id="wwwrap">
		<span>
			<h2>Desiner List Info</h2> <c:if test="${id eq 'admin' }">
				<button type="button" id="insertBtn" class="btn btn-outline-dark"
					onclick="location.href='designerInsertForm.do'">디자이너 등록</button>
			</c:if>
		</span>

		<form id="frm" action="designerinfoPage.do" method="post">
			<input type="hidden" id="DesinerName" name="DesinerName">
		</form>
		<form id="bfrm" action="bulletinView.do" method="post">
			<input type="hidden" id="btCode" name="btCode">
		</form>
		<div style="width: 80%; margin: 0 auto;">
			<ul class="ds-ul">
				<c:forEach items="${list }" var="vo">
					<li onclick="desite('${vo.dsName }')"><img class="img"
						src="${pageContext.request.contextPath }/designer/${vo.dsImage }" />
						<p style="font-weight: bold; margin-top: 20px;">${vo.dsName }</p></li>
				</c:forEach>
			</ul>
		</div>


		<div class="de-allbox">
			<c:choose>
				<c:when test="${!empty rvo }">
					<div id="showdox" class="de-box1">
						<div class="de-box">
							<div class="de-box">
								<img
									src="${pageContext.request.contextPath }/designer/${rvo.dsImage }">
							</div>
							<div class="de-box11">${rvo.dsInfo }</div>
						</div>
					</div>
					<c:if test="${id eq 'admin' }">
						<div align="center">
							<button type="button" id="eventBtn" class="btn btn-outline-dark"
								onclick="location.href='designerUpdateForm.do?dsCode=${rvo.dsCode}&dsName=${rvo.dsName }'">디자이너
								수정</button>
							<button type="button" id="eventBtn" class="btn btn-outline-dark"
								onclick="location.href='designerDelete.do?dsCode=${rvo.dsCode}'">디자이너
								삭제</button>
						</div>
					</c:if>
					<div class="de-box1">
						<h2>후기 게시판</h2>
						<c:if test="${!empty id }">
							<button id="inpu" type="button" class="btn btn-outline-dark"
								onclick="location.href='bulletinInsertForm.do'">후기 작성</button>
						</c:if>
						<c:forEach items="${blist }" var="bvo">
							<div class="de-infobox" onclick="bulletinView(${bvo.btCode})">
								<div class="info">
									<img
										src="${pageContext.request.contextPath }/bootstrap/img/cont.PNG">
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
					<div class="de-box1">
					<h2>전체 게시판</h2>
						<c:forEach items="${main }" var="tlqkf">
							<div class="de-infobox" onclick="bulletinView(${tlqkf.btCode})">
								<div class="info">
									<img
										src="${pageContext.request.contextPath }/bootstrap/img/cont.PNG">
								</div>
								<div class="info">
									<span>Designer: ${tlqkf.dsName} </span> <span>Designing
										NO. ${tlqkf.btCode }</span> <span>작성자: ${tlqkf.writer }</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>
</html>