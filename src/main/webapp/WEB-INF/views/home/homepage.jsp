

<!-- 푸터까지 포함 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈페이지</title>
    <!-- 절대 경로로 CSS 파일 링크 -->
    <link rel="stylesheet" href="/homepage_css/homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    <div class="home-page">
       <!--  <nav class="navbar">
            <ul class="nav-links">
                <li><a href="/Movie">영화</a></li>
                <li><a href="/cinema">극장</a></li>
                <li><a href="/ticket">예매</a></li>
                <li><a href="/store">스토어</a></li>
            </ul>
        </nav> -->

        <div class="promo-container">
            <div class="slider">
                <div><img src="/homepage_image/image_02.jpg" alt="Promotion 2" class="image-slide" /></div>
                <div><img src="/homepage_image/image_03.jpg" alt="Promotion 3" class="image-slide" /></div>
                <div><img src="/homepage_image/image_04.jpg" alt="Promotion 4" class="image-slide" /></div>
            </div>
        </div>

<!--         <nav class="navbar">
            <ul class="nav-links">
                <li><a href="/Movie">무비차트</a></li>
                <li><a href="/cinema">상영예정작</a></li>
                <li><a href="/all-movies">전체보기</a></li>
            </ul>
        </nav> -->
    </div>

    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->

</body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.slider').slick({
                dots: false,
                infinite: true,
                speed: 1500,
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 5000,
                arrows: false
            });
        });
    </script>
</html> 


  