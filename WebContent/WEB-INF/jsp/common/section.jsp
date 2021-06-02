<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.bo-na{
	clear:both;
	margin: 40px auto;
	width: 1500px;
	
}
.bo-na-se{
	display: inline-block;
	margin-left: 60px;
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
	width: 20%;
	height: 300px;
	background: #F7F7F7;
	font-size: 13px;	
}
.se-img
{
	width: 100px;
	height: 100px;
	margin-top: 50px;
	margin-bottom: 30px;
	 
}
</style>	


    <!--====== Banner Slider Start ======-->
    <section class="banner-slider banner-slider-two banner-slider-active">
        <div class="single-banner" style="background-image: url(${pageContext.request.contextPath }/bootstrap/img/main/main01.jpg)">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-9">
                        <div class="banner-text">
                            <div class="banner-content">
                                <span data-animation="fadeInUp" data-delay="0.3s" class="title-tag">
                                    That smile is a flower.
                                </span>
                                <h1 data-animation="fadeInLeft" data-delay="0.6s" class="title">
                                    We provide eco-friendly materials
                                </h1>
                                <a data-animation="fadeInUp" data-delay="1.1s" class="main-btn rounded-btn icon-right small-size" href="interiorList.do">
                                    Interior List <i class="fal fa-long-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single-banner" style="background-image: url(${pageContext.request.contextPath }/bootstrap/img/main/main02.jpg)">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-9">
                        <div class="banner-text">
                            <div class="banner-content">
                                <span data-animation="fadeInUp" data-delay="0.3s" class="title-tag">
                                    That smile is a flower.
                                </span>
                                <h1 data-animation="fadeInLeft" data-delay="0.6s" class="title">
                                    Best Designer And DIY Interior.
                                </h1>
                                <a data-animation="fadeInUp" data-delay="1.1s" class="main-btn rounded-btn icon-right small-size" href="interiorList.do">
                                    Interior List <i class="fal fa-long-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single-banner" style="background-image: url(${pageContext.request.contextPath }/bootstrap/img/main/main03.jpg)">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-9">
                        <div class="banner-text">
                            <div class="banner-content">
                                <span data-animation="fadeInUp" data-delay="0.3s" class="title-tag">
                                    That smile is a flower.
                                </span>
                                <h1 data-animation="fadeInLeft" data-delay="0.6s" class="title">
                                    Best IT Soluations Provider Agency
                                </h1>
                                <a data-animation="fadeInUp" data-delay="1.1s" class="main-btn rounded-btn icon-right small-size" href="interiorList.do">
                                    Interior List <i class="fal fa-long-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--====== Banner Slider End ======-->
    
    <div class="bo-na">
        	<div class = "bo-na-se">
        		<a class="nav-link" href="info.do">
        			<div><img class="se-img" src="${pageContext.request.contextPath }/bootstrap/img/icon/icon_story.png" /></div>
        			<h3>Brand Story</h3>
        			<span>브랜드 스토리</span>
        		</a>
        	</div>
        	<div class = "bo-na-se">
        		<a class="nav-link" href="designerPage.do">
        		<div><img class="se-img" src="${pageContext.request.contextPath }/bootstrap/img/icon/icon_styling.png" /></div>
        		<h3>Designer</h3>
        		<span>후기 및 디자이너 소개</span>
        		</a>
        	</div>
        	<div class = "bo-na-se">
        		<a class="nav-link" href="interiorList.do">
	        		<div><img class="se-img" src="${pageContext.request.contextPath }/bootstrap/img/icon/icon_shop.png" /></div>
    	    		<h3>Interior</h3>
        			<span>인테리어 상품 보러가기</span>
        		</a>
        	</div>
        	<div class = "bo-na-se">
        		<a class="nav-link" href="cart.do">
        			<div><img class="se-img" src="${pageContext.request.contextPath }/bootstrap/img/icon/icon_mypage.png" /></div>
        			<h3>Shoping Cart</h3>
        			<span>나의 장바구니</span>
        		</a>
        	</div>
        </div>

    <!--====== Back to top start ======-->
    <div class="back-to-top">
        <a href="#"> <i class="fas fa-arrow-up"></i> </a>
    </div>
    <!--====== Back to top start ======-->
