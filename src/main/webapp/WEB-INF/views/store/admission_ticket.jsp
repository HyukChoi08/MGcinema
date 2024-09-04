<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
ul, li {      
    list-style-type: none; 
    padding: 0; 
    margin: 0; 
    /* 점없애는곳*/
}
#container {
    display: flex;
    flex-wrap: wrap;      /* 이미지 정렬을 위해 사용*/
    justify-content: center; 
    padding: 20px;
    width: 1000px; 
    margin: 0 auto;   
    /* 전체적인 컨테이너*/
}
#contents {
    flex: 1 1 200px; /* 유연한 크기 조정 */
    margin: 10px; 
    padding: 15px; 
    background-color: #f9f9f9; 
    width: calc(100% - 40px); /* padding 20px*2 */
    position: relative; /* 자식 요소 위치 조정 */
  
}
.category_wrap {
    margin-bottom: 20px; /* 스토어와 선 사이의 간격을 추가 */
}
.separator, .separator1 {
    width: 100%; /* 부모 요소의 전체 너비를 차지하도록 설정 */
    height: 2px;
    margin: 0;
}
/* 밑줄*/
.separator {
    position: relative; /* 상위 요소에 상대적으로 위치 */
    bottom: 0; /* 부모 요소의 하단에 위치 */
    background-color: #000; 
}
.separator1 {
    position: relative; /* 상위 요소에 상대적으로 위치 */
    margin-top: 20px; /* 간격 추가: .contegory_contents_wrap과의 간격 */
    background-color: grey;
}
.separator2{
    height: 1px; /* 선의 두께 설정 */
    width: 100%; /* 부모 요소의 전체 너비를 차지하도록 설정 */
    background-color:   grey; /* 선 색상 변경 */
    margin-top: 3px; /* 상단 여백 추가 */
    margin-bottom: 20px;
    position: relative; /* 상위 요소에 상대적으로 위치 */

}

.circle-button:hover {
    background-color: #0056b3;
}
.contegory_contents_wrap {
    display: flex; /* flex 레이아웃을 사용 */
    flex-direction: row; /* 자식 요소를 수평으로 나열 */
    justify-content: space-between; /* 자식 요소들 사이에 공간을 균등하게 배분 */
    align-items: center; /* 자식 요소들을 수직으로 가운데 정렬 */
    flex-wrap: wrap; /* 자식 요소가 필요에 따라 줄 바꿈 */
    margin-bottom: 20px; /* 자식 요소와 선 사이의 간격을 추가 */
}
.category_content {
    display: flex; /* flex 레이아웃을 사용 */
    flex-direction: row; /* 자식 요소를 수평으로 나열 */
    gap: 20px; /* 리스트 아이템 사이에 간격 추가 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    flex-wrap: wrap; /* 리스트가 넘치지 않도록 줄 바꿈 */
    justify-content: space-around; /* 리스트 항목 사이에 여백 추가 */
}
.cart_content {
    display: flex; /* flex 레이아웃을 사용 */
    flex-direction: row; /* 자식 요소를 수평으로 나열 */
    gap: 25px; /* 리스트 아이템 사이에 간격 추가 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    flex-wrap: wrap; /* 리스트가 넘치지 않도록 줄 바꿈 */
    justify-content: space-between; /* 리스트 항목 사이에 여백 추가 */
}
#cart-count, #giftcon {
    display: inline-block; /* 텍스트와 함께 한 줄에 표시 */
margin-left: 5px; /* 텍스트와 숫자 사이의 간격 추가 */
padding: 0 4px; /* 숫자를 감싸는 여백 추가 */
background-color: #ff0000; /* 배경색 */
color: white; /* 글자색 */
border-radius: 50%; /* 원형 배경 */
font-size: 12px; /* 글자 크기 */
line-height: 20px; /* 텍스트 수직 중앙 정렬 */
height: 20px; /* 원형을 유지하기 위한 높이 */
width: 20px; /* 원형을 유지하기 위한 너비 */
text-align: center; /* 텍스트 중앙 정렬 */
vertical-align: middle; /* 수직 중앙 정렬 */
}
.category_title {
    display: flex;
    align-items: center; /* 수직 정렬 */
    gap: 20px; /* 텍스트와 버튼 사이의 간격 조정 */
    font-size: 20px;
}
.category_dep{
    font-size: 15px;
}

.category_inner {
    display: flex; /* Flexbox 레이아웃을 사용 */
    flex-wrap: wrap; /* 자식 요소가 필요 시 줄 바꿈 */
    gap: 20px; /* 항목 사이의 간격 추가 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
}
.category_inner .product {
    flex: 1 1 calc(33.333% - 20px); /* 한 줄에 3개의 항목 표시, 20px는 간격을 고려한 조정 */
    box-sizing: border-box; /* 패딩과 테두리가 너비에 포함되도록 설정 */
    text-align: center; /* 텍스트 중앙 정렬 */
    margin-bottom: 20px; /* 항목 아래 여백 추가 */
    position: relative; /* 자식 요소의 위치를 기준으로 설정 */
    max-width: calc(33.333% - 20px); /* 최대 너비를 33.333%로 설정 */
}
.product img {
    max-width: 100%; /* 이미지가 부모 요소의 너비를 초과하지 않도록 설정 */
    height: auto; /* 이미지 비율 유지 */
}
.product-info {
    margin-top: 10px; /* 이미지와 텍스트 사이의 간격 추가 */
}
.product-name {
    font-size: 14px; /* 텍스트 크기 조정 */
    color: #333; /* 텍스트 색상 설정 */
}
img {
    max-width: 100%;
    height: auto;
}

.category_content li {
    cursor: pointer; /* 클릭 커서로 변경 */
}

.product {
position: relative; /* 이 부분을 추가하여 아이콘 위치 조정 */
overflow: hidden; /* 아이콘과 텍스트가 이미지 영역을 넘지 않도록 설정 */
        }

.product:hover .icon-overlay {
    display: none; /* 기본적으로 숨김 */
}
.icon-overlay {
    position: absolute;
    top: 50%; /* 이미지 상단에서 중앙 위치 */
    left: 50%; /* 이미지 왼쪽에서 중앙 위치 */
    transform: translate(-50%, -50%); /* 중앙 정렬을 위한 변환 */
    display: none; /* 기본적으로 숨김 */
    background-color: rgba(255, 255, 255, 0.8); 
    color: white;
    border-radius: 50%;
    width: 60px;
    height: 60px;
    text-align: center;
    line-height: 40px;
    font-size: 24px;
    font-weight: bold;
}
        .hover-text {
    display: none; /* 기본적으로 숨김 */
    position: absolute; /* 아이콘에 대해 절대 위치 */
    bottom: -50px; /* 아이콘 위에 위치하도록 조정 */
    left: 50%; /* 아이콘의 중앙 정렬 */
    transform: translateX(-50%); /* 수평 중앙 정렬 */
    background-color: rgba(0, 0, 0, 0.8); /* 반투명 배경 */
    color: white; /* 글자 색상 */
    padding: 5px; /* 텍스트 주변 여백 */
    border-radius: 5px; /* 둥근 모서리 */
    font-size: 14px; /* 텍스트 크기 조정 */
    white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
    z-index: 20; /* 텍스트가 다른 요소 위에 위치하도록 설정 */
}
.product:hover .icon-container {
    display: flex; /* 호버 시 아이콘 표시 */
}

.icon-left, .icon-center, .icon-right {
    background-color: rgba(255, 255, 255, 0.8); /* 밝은 배경색으로 변경 */
    color: black; /* 아이콘 색상 */
    border-radius: 50%;
    width: 30px; /* 아이콘 크기 */
    height: 30px; /* 아이콘 크기 */
    text-align: center; /* 아이콘 텍스트 중앙 정렬 */
    line-height: 30px; /* 아이콘 텍스트 수직 중앙 정렬 */
    font-size: 16px; /* 아이콘 텍스트 크기 */
    font-weight: bold; /* 아이콘 텍스트 굵게 */
}
.icon-container {
    position: absolute; /* 이미지 내부에 절대 위치로 배치 */
    width: 100%; /* 이미지의 전체 너비를 차지하도록 설정 */
    height: 100%; /* 이미지의 전체 높이를 차지하도록 설정 */
    top: 0; /* 이미지 상단에 맞춤 */
    left: 0; /* 이미지 왼쪽에 맞춤 */
    display: flex; /* flexbox 레이아웃을 사용하여 아이콘 정렬 */
    justify-content: space-between; /* 아이콘을 왼쪽, 중앙, 오른쪽에 배치 */
    align-items: center; /* 아이콘을 수직으로 중앙 정렬 */
    padding: 20px; /* 이미지의 가장자리에서 아이콘까지의 거리 설정 */
    box-sizing: border-box; /* padding을 요소의 전체 너비와 높이에 포함되도록 설정 */
    display: none; /* 기본적으로 숨김 */
    pointer-events: none; /* 아이콘의 클릭을 막고 이미지의 클릭을 가능하게 함 */

}

.icon-item img {
    width: 20px; /* 아이콘 크기 조정 */
    height: auto; /* 비율 유지 */
   
}
.icon-item:hover .hover-text {
    display: block; /* 마우스 오버 시에만 표시 */
}
.icon-item {
    position: relative; /* 텍스트를 아이콘에 맞게 배치하기 위해 */
    pointer-events: auto; /* 아이콘의 클릭을 가능하게 함 */
}
.category_title strong {
    padding-right: 50px; /* 버튼 너비만큼 여백을 추가하여 텍스트가 버튼에 겹치지 않게 함 */
}
.no-underline {
      text-decoration: none; /* 링크의 밑줄을 제거합니다 */
       color: black;    
}
.no-underline:hover {
text-decoration: none; /* 마우스 오버 시에도 밑줄이 보이지 않도록 합니다 */
}
.no-style-link {
   text-decoration: none; /* 밑줄 제거 */
   color: inherit; /* 링크 색상 유지 */
}

.no-style-link:visited {
   color: inherit; /* 방문 후 색상 유지 */
}

    </style>
</head>
<body>
    <div id="container">
        <div id="contents">
            <div class="category_wrap">
                스토어
             <input type="hidden" id="userid" value="${uid}">        
                <div class="separator"></div> <!-- 선을 스토어 아래에 위치 -->
            </div>
            <div class="contegory_contents_wrap">
                <ul class="category_content"> <!-- ul로 변경 -->
                   <li><a href="/package" class="no-underline">패키지</a></li>
                    <li><a href="/admissionticket" class="no-underline">영화관람관</a></li>
                    <li><a href="/giftcard" class="no-underline">기프트카드</a></li>
                    <li><a href="/combo" class="no-underline">콤보</a></li>
                    <li><a href="/popcorn" class="no-underline">팝콘</a></li>
                    <li><a href="/drink" class="no-underline">음료</a></li>
                    <li><a href="/snack" class="no-underline">스낵</a></li>
                </ul>
                <ul class="cart_content"> <!-- ul로 변경 -->
                    <li>내 기프트콘<span id="giftcon">0</span></li> 
                    <li><a href="/cart" class="no-style-link">장바구니</a><span id="cart-count">0</span></li>
                </ul>   
            </div>
            <div class="separator1"></div> <!-- 선을 contegory_contents_wrap 아래에 위치 -->
            <div class="category_product_wrap">
                <ul class="product_list">
                    <li>
                        <strong class="category_title">영화관람권<strong class="category_dep">영화를 더 생생하고 특별하게</strong><br>
                            
              
                        </strong> 
                        <div class="separator2"></div>
                        <ul class="category_inner">
                            <li class="product">
                                <a href="/details?id=4" class="btn_category_product">  
                                    <img src="/store_images/영화관람권1.png" alt="영화관람권1"></a>
                              		<div class="icon-container">
										<a href="/cart" class="icon-item icon-left">
    									<img src="/store_images/장바구니.png" alt="Left Icon">
    									<span class="hover-text">장바구니</span>
										</a>
                                        <a href="/gift" class="icon-item icon-center">
                                            <img src="/store_images/선물하기.png" alt="Center Icon">
                                             <span class="hover-text">선물하기</span>  
                                        </a>                                                                                  
                                        <a href="/storepay" class="icon-item icon-right">
                                            <img src="/store_images/구매하기.png" alt="Right Icon">
                                            <span class="hover-text">구매하기</span>                          
                                        </a>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">영화관람권1</span><br>
                                        <span class="original-price">13,000원</span>
                                   
                                </div>
                            </li>   
                            <li class="product">
                                <a href="/details?id=5" class="btn_category_product">  
                                    <img src="/store_images/영화관람권2.png" alt="영화관람권2"></a>
                                     <div class="icon-container">
										<a href="/cart" class="icon-item icon-left">
    									<img src="/store_images/장바구니.png" alt="Left Icon">
    									<span class="hover-text">장바구니</span>
										</a>
                                        <a href="/gift" class="icon-item icon-center">
                                            <img src="/store_images/선물하기.png" alt="Center Icon">
                                             <span class="hover-text">선물하기</span>  
                                        </a>                                                                                  
                                        <a href="/storepay" class="icon-item icon-right">
                                            <img src="/store_images/구매하기.png" alt="Right Icon">
                                            <span class="hover-text">구매하기</span>                          
                                        </a>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">영화관람권2</span><br>
                                    <span class="original-price">17,000원</span>
                                
                                </div>          
                            </li>
                            <li class="product">
                                <a href="/details?id=6" class="btn_category_product">  
                                    <img src="/store_images/영화관람권3.png" alt="영화관람권3"></a>
                                     <div class="icon-container">
										<a href="/cart" class="icon-item icon-left">
    									<img src="/store_images/장바구니.png" alt="Left Icon">
    									<span class="hover-text">장바구니</span>
										</a>
                                        <a href="/gift" class="icon-item icon-center">
                                            <img src="/store_images/선물하기.png" alt="Center Icon">
                                             <span class="hover-text">선물하기</span>  
                                        </a>                                                                                  
                                        <a href="/storepay" class="icon-item icon-right">
                                            <img src="/store_images/구매하기.png" alt="Right Icon">
                                            <span class="hover-text">구매하기</span>                          
                                        </a>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">영화관람권3</span><br>
                                    <span class="original-price">18,000원</span>
                                </div>          
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>    
        </div>        
    </div>


</body>
<script src="https://code.jquery.com/jquery-latest.js">
</script>
<script>
$(document)
.ready(function() {
 	let customer_id= $('#userid').val();
 	console.log(customer_id);
 	
 	$.ajax({
 		url:'/countcart',type:'post',data:{customer_id:customer_id},dataType:'text',
 		success:function(data){
 			 $('#cart-count').text(data);
 			
 			}
 })
})

.on('click','.category_content li',function(){
    let href = $(this).data('href'); 
        if (href) {
            window.location.href = href; 
        }
})
//해상 사이트 이동하는거

</script>

</html>
