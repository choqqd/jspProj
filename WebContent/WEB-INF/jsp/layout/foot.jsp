<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="footer-area">
	<div class="container">
		<div class="row footer-widgets">
			<div class="col-lg-4 col-md-6 col-md-7">
				<div class="widget about-widget">
					<div class="logo">
						<p style="text-align: center;" class="widget-title">찾아오시는 길</p>
						<div id="staticMap" style="width:80%;height:350px; margin: auto;"></div>    
						
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	4fd0b43d1d585578308976cb3da2aadc"></script>
						<script>    
						// 이미지 지도에 표시할 마커입니다
						// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
						var markers = [
						    {
						        position: new kakao.maps.LatLng(35.87058113255087, 128.5894468739827)
						    },
						    {
						        position: new kakao.maps.LatLng(35.87058113255087,128.5894468739827), 
						        text: '예담직업전문학교' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
						    }
						];
						
						var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
						    staticMapOption = { 
						        center: new kakao.maps.LatLng(35.87058113255087, 128.5894468739827), // 이미지 지도의 중심좌표
						        level: 3, // 이미지 지도의 확대 레벨
						        marker: markers // 이미지 지도에 표시할 마커 
						    };    
						
						// 이미지 지도를 생성합니다
						var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
						</script>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 offset-xl-1">
				<div class="widget nav-widget">
					<h4 class="widget-title">Pages</h4>
					<div class="footer-list">
						<ul>
							<li><a href="index.do"><i class="fal fa-angle-right"></i>
									Home</a></li>
							<li><a href="info.do"><i class="fal fa-angle-right"></i>
									Brand Story</a></li>
							<li><a href="designerPage.do"><i
									class="fal fa-angle-right"></i> Designer</a></li>
							<li><a href="interiorList.do"><i
									class="fal fa-angle-right"></i> Interior</a></li>
							<li><a href="cart.do"><i class="fal fa-angle-right"></i>
									Shoping Cart</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-md-6">
				<div class="widget contact-widget">
					<h4 class="widget-title">Working Hours</h4>
					<ul>
						<li>Monday - Friday: 9:00 - 18:00</li>
						<li>Saturday: 7:00 - 12:00</li>
						<li>Sunday and holidays: Close</li>
					</ul>
					<p>
						<span>For more then 30 years,</span> IT Service has been a
						reliable partner in the field of logistics and cargo forwarding.
					</p>
					<a href="#"><i class="fal fa-angle-right"></i>Discover More</a>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<p>
				Copyright By@ <a href="#">WebTend</a> - 2021
			</p>
		</div>
	</div>
</footer>