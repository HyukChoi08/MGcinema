

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
        <div class="promo-container">
            <div class="slider">
                <div><img src="/homepage_image/image_05.jpg" alt="Promotion 5" class="image-slide" /></div>
                <div><img src="/homepage_image/image_06.jpg" alt="Promotion 6" class="image-slide" /></div>
                <div><img src="/homepage_image/로비2.jpeg" alt="Promotion 7" class="image-slide" /></div>
                <div><img src="/homepage_image/image_08.jpg" alt="Promotion 8" class="image-slide" /></div>
         	</div>
        </div>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->

</body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script>
        $('.slider').slick({
            dots: false,
            infinite: true,
            speed: 1500,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 5000,
            arrows: false,
            fade: true, // 페이드 효과로 전환
            cssEase: 'linear' // 선형 전환
        });
    </script>
</html> 


  