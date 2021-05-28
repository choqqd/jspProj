<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <header class="header-one sticky-header">
        <div class="header-topbar d-none d-sm-block">
            <div class="container-fluid container-1470">
                <div class="row align-items-center justify-content-between">
                    <div class="col-sm-auto col-12">
                    </div>
                    <div class="col-sm-auto col-12">
                        <div class="social-icon text-center">
                            <ul>
                                <li><a href="#">로그인</a></li>
                                <li><a href="#">회원가입</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-navigation">
            <div class="container-fluid container-1470 d-flex align-items-center justify-content-between">
                <div class="header-left">
                    <div class="site-logo">
                        <a href="index.html"><img src="${pageContext.request.contextPath }/bootstrap/img/logo.png" alt="Omnivus"></a>
                    </div>
                </div>
                <div class="header-right d-flex align-items-center justify-content-end">
                    <div class="site-nav-menu">
                        <ul class="primary-menu">
                            <li class="current">
                                <a href="index.html">Home</a>

                            </li>
                            <li>
                                <a class="nav-link" href="about.html">About</a>
                            </li>
                            <li>
                                <a href="#">Pages</a>
                            </li>
                            <li>
                                <a href="#">Blog</a>
                            </li>
                            <li>
                                <a href="contact.html">Contact</a>
                            </li>
                        </ul>
                        <a href="#" class="nav-close"><i class="fal fa-times"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </header>