<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, 
a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, 
small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label,
 legend, table, caption, tbody, tfoot, thead, tr, th, td {
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
    text-align:center;
    
}
.container {
            display: flex;
            flex-direction: column; /* 수직으로 쌓기 */
            align-items: flex-start; /* 왼쪽으로 붙이기 */
            gap: 0px; /* 요소 간 간격 */
            padding: 0px; /* 패딩 */
            border: 1px solid black; /* 테두리 */
           
        }
.container a{
	 text-decoration: none;
	 display: block;
	 width: 100%;
     height: 100%;
}
a:visited {
            color: white; /* 방문한 링크 색상 */
        }
.background-image {
            position: absolute; /* 절대 위치로 배치 */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1; /* 다른 요소들보다 뒤로 위치 */
            object-fit: cover; /* 이미지 비율 유지 및 컨테이너 크기에 맞게 조정 */
            
        }
.item {		
			line-height: 50px;
			color: white;
            width: 100px;
            height: 50px;
            background-color: black;
           
            transition: background-color 0.3s ease, transform 0.3s ease;
             position: relative; /* 기본 위치 설정 */
            z-index: 2; /* 배경 이미지보다 위로 위치 */
          
            
        }
 .item:hover {
            background-color: black; /* 호버 시 배경색 변경 */
            transform: scale(1.1); /* 호버 시 크기 확대 */
        }    
#contents {
	clear: both;
    padding-bottom: 50px;
    position: relative;
    width: 980px;
    margin: 0 auto;
    border:1px solid black;
}
.info {
	background-color:black;
	width:980px;
	height:200px;
	color:white;
	/* position: absolute; */
}
.infoleft .title {
	position: relative;
    float: left;
    font-size: 15px;
    padding: 10px 0 0 20px;
    width: 400px;
    color: white;
    text-overflow: initial;
    white-space: initial;
    text-align:left;
}
.inforight {
    position: relative;
    float: right;
    width: 280px;
    height: 98px;
    padding: 10px 0 0 20px;
    border-left: 1px solid rgba(255, 255, 255, 0.2);
    overflow: hidden;
    }
.inforight h5 {
	text-align:left;
	}
.link-more {
    display: inline-block;
    width: 20px;
    height: 19px;
    background: url(https://img.cgv.co.kr/R2014/images/sprite/sprite_btn.png) -50px -62px no-repeat;
    vertical-align: middle;
    font: 0 / 0 a;
    zoom: 1;
}
.sect-schedule .slider {
    overflow: visible;
    position: relative;
    height: 48px;
    padding: 12px 0;
}
.slider {
    z-index: 1;
    width: 100%;
}
.showtimes-wrap .sect-schedule {
    width: 100%;
    height: 111px;
    border-top: 3px solid #241d1e;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
</head>
<body>
<div id="contents">
	혹시나 다른거 들어갈 자리
	<div><h3><img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif"></h3></div>
	<div class="container" style="border: 1px solid black;position: relative; width:980px; height:500px;margin:auto;">
		<img src="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/main_chungdam.jpg" class="background-image" id="backgroundImage" alt="zzzz">
	 	<div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/main_chungdam.jpg"><a href="#">8F 일반</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f10_02.jpg"><a href="#">7F 스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f12_01.jpg"><a href="#">스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f12_02.jpg"><a href="#">스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f12_03.jpg"><a href="#">스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f09_01.jpg"><a href="#">스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f09_02.jpg"><a href="#">스위트</a></div>        
	</div>
	<div class="info">
		<div class="infoleft">
			<strong class="title">주소를 적어주세여</strong>
		</div>
		<div class="inforight">
			<h5>위치/주차안내</h5><a class="link-more" href="/park" target="_blank" title="새창 열림"></a>
		</div>
	</div>
<div class="sect-schedule"></div>

</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','.container .item', function() {
        // 클릭된 div의 data-image 속성에서 이미지 URL을 가져옴
        var img = $(this).data('image');
        console.log(img);
        // 이미지 요소의 src 속성을 새 URL로 업데이트
        $('#backgroundImage').attr('src', img);
    });
</script>
</html>