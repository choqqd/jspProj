<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
		//슬라이더 스크립트 부분
		$(document).ready(function () {
			$('.slider').bxSlider();

		})
</script>
<style>
.im{
	width: 100%;
	height: 500px;
}
</style>
    <div class="slider">
			<div><img class="im" src="${pageContext.request.contextPath }/bootstrap/img/main.jpg" alt=""></div>
			<div><img class="im" src="${pageContext.request.contextPath }/bootstrap/img/main2.jpg" alt=""></div>
			<div><img class="im" src="${pageContext.request.contextPath }/bootstrap/img/main3.jpg" alt=""></div>
	</div>
