<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header-one sticky-header">
	<div class="header-topbar d-none d-sm-block">
		<div class="container-fluid container-1470">
			<div class="row align-items-center justify-content-between">
				<div class="col-sm-auto col-12"></div>
				<div class="col-sm-auto col-12">
					<div class="social-icon text-center">
						<ul>
							<c:choose>
								<c:when test="${!empty id }">
									<li>${name }님환영합니다.</li>
									<li><a href="memberLogOut.do">로그아웃</a></li>
									<li><a href="memberInfo.do?id=${id }">마이페이지</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="memberLogin.do">로그인</a></li>
									<li><a href="memberJoinForm.do">회원가입</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-navigation">
		<div
			class="container-fluid container-1470 d-flex align-items-center justify-content-between">
			<div class="header-left">
				<div class="site-logo">
					<a href="index.do"><img
						src="${pageContext.request.contextPath }/bootstrap/img/logo.png"
						alt="Omnivus"></a>
				</div>
			</div>
			<div
				class="header-right d-flex align-items-center justify-content-end">
				<div class="site-nav-menu">
					<ul class="primary-menu">
						<li><a class="nav-link" href="index.do">Home</a></li>
						<li><a class="nav-link" href="info.do">Brand Story</a></li>
						<li><a class="nav-link" href="designerPage.do">Designer</a></li>
						<li><a class="nav-link" href="interiorList.do">interior</a></li>
						<c:choose>
							<c:when test="${id eq 'admin'}">
								<li><a class="nav-link" href="MemberListPage.do">MemberList</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="nav-link" href="cartPage.do">ShopingCart</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<a href="#" class="nav-close"><i class="fal fa-times"></i></a>
				</div>
			</div>
		</div>
	</div>
</header>
