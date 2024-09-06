<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style>
body{

 background-color:black;
}  
*{
color:white;

}
.contegory_contents_wrap a{

color:white;
}

         
ul, li {      
    list-style-type: none; 
    padding: 0; 
    margin: 0; 
    /* 점없애는곳*/
}
#container {
    display: flex;
    flex-wrap: wrap;      /* 이미지 정렬을 위해 사용 */
    justify-content: center;  
    width: 1000px; 
    margin: 0 auto;   
    background-color: black;
    margin-top: 150px; 
    margin-bottom: 335px;
    border: 2px solid #808080; /* 회색 테두리 */
    box-sizing: border-box; /* border와 padding을 포함한 너비 계산 */
}
#contents {
    flex: 1 1 200px; /* 유연한 크기 조정 */
    margin: 10px; 
    padding: 15px; 
    background-color: #f9f9f9; 
    width: calc(100% - 40px); /* padding 20px*2 */
    position: relative; /* 자식 요소 위치 조정 */
   	background-color:black;
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
    margin-top: 5px; /* 상단 여백 추가 */
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
    justify-content: center; /* 아이콘을 중앙에 배치 */
    align-items: center; /* 아이콘을 수직으로 중앙 정렬 */
    padding: 20px; /* 이미지의 가장자리에서 아이콘까지의 거리 설정 */
    box-sizing: border-box; /* padding을 요소의 전체 너비와 높이에 포함되도록 설정 */
    display: none; /* 기본적으로 숨김 */
    pointer-events: none; /* 아이콘의 클릭을 막고 이미지의 클릭을 가능하게 함 */
}

.icon-item img {
    width: 20px; /* 아이콘 크기 조정 */
    height: auto; /* 비율 유지 */
    cursor: pointer;
}
.icon-item:hover .hover-text {
    display: block; /* 마우스 오버 시에만 표시 */
}
.icon-item {
    position: relative; /* 텍스트를 아이콘에 맞게 배치하기 위해 */
    pointer-events: auto; /* 아이콘의 클릭을 가능하게 함 */
    margin: 0 40px; /* 아이콘 사이의 간격을 조정합니다 (좌우 여백) */
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
.li1{
  margin-top:10px;
  
  }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
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
                    <li><a href="/giftcard" class="no-underline">기프트카드</a></li>
                    <li><a href="/combo" class="no-underline">콤보</a></li>
                    <li><a href="/popcorn" class="no-underline">팝콘</a></li>
                    <li><a href="/drink" class="no-underline">음료</a></li>
                    <li><a href="/snack" class="no-underline">스낵</a></li>
                </ul>
                <ul class="cart_content"> <!-- ul로 변경 -->
                   	<li><a href="/cart" class="no-style-link">장바구니</a><span id="cart-count">0</span></li>
                </ul>   
            </div>
            <div class="separator1"></div> <!-- 선을 contegory_contents_wrap 아래에 위치 -->
            <div class="category_product_wrap">
                <ul class="product_list">
                    <li class="li1">
                        <strong class="category_title">음료<strong class="category_dep">커피,에이드,콜라,사이다</strong><br>                                       
                        </strong> 
                        <div class="separator2"></div>
                        <ul class="category_inner">
                 			<li class="product" id="24">
                                <a href="/details?id=24" class="btn_category_product">  
                                    <img src="/store_images/에이드.png" alt="패키지1"></a>
                                    <div class="icon-container">
										<div class="icon-item icon-left" id="cart-link">
   										<img src="/store_images/장바구니.png" alt="Left Icon">
							 			<span class="hover-text">장바구니</span>
										</div>                                                                                                                     
                                        <div class="icon-item icon-right">
                                            <img src="/store_images/구매하기.png" alt="Right Icon" class="buyButton">
                                            <span class="hover-text">구매하기</span>                          
                                        </div>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">에이드 택1</span><br>
                                        <span class="discounted-price">5,000원</span>
                                </div>
                            </li>   
                          	<li class="product" id="25">
                                <a href="/details?id=25" class="btn_category_product">  
                                    <img src="/store_images/아아.png" alt="패키지1"></a>
                                    <div class="icon-container">
										<div class="icon-item icon-left" id="cart-link">
   										<img src="/store_images/장바구니.png" alt="Left Icon">
							 			<span class="hover-text">장바구니</span>
										</div>                                                                                                                     
                                        <div class="icon-item icon-right">
                                            <img src="/store_images/구매하기.png" alt="Right Icon" class="buyButton">
                                            <span class="hover-text">구매하기</span>                          
                                        </div>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">아메리카노(ICE)</span><br>
                                        <span class="original-price">4,500원</span>
                                        <span class="discounted-price">4,500원</span>
                                </div>
                            </li>   
                           	<li class="product" id="26">
                                <a href="/details?id=26" class="btn_category_product">  
                                    <img src="/store_images/핫아메.png" alt="패키지1"></a>
                                    <div class="icon-container">
										<div class="icon-item icon-left" id="cart-link">
   										<img src="/store_images/장바구니.png" alt="Left Icon">
							 			<span class="hover-text">장바구니</span>
										</div>                                                                                                                     
                                        <div class="icon-item icon-right">
                                            <img src="/store_images/구매하기.png" alt="Right Icon" class="buyButton">
                                            <span class="hover-text">구매하기</span>                          
                                        </div>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">아메리카노(HOT)</span><br>
                                        <span class="discounted-price">4,500원</span>
                                </div>
                            </li>   
                         	<li class="product" id="27">
                                <a href="/details?id=27" class="btn_category_product">  
                                    <img src="/store_images/콜라L.png" alt="패키지1"></a>
                                    <div class="icon-container">
										<div class="icon-item icon-left" id="cart-link">
   										<img src="/store_images/장바구니.png" alt="Left Icon">
							 			<span class="hover-text">장바구니</span>
										</div>                                                                                                                     
                                        <div class="icon-item icon-right">
                                            <img src="/store_images/구매하기.png" alt="Right Icon" class="buyButton">
                                            <span class="hover-text">구매하기</span>                          
                                        </div>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">콜라L</span><br>
                                        <span class="discounted-price">4,000원</span>
                                </div>
                            </li> 
                            <li class="product" id="28">
                                <a href="/details?id=28" class="btn_category_product">  
                                    <img src="/store_images/사이다L.png" alt="패키지1"></a>
                                    <div class="icon-container">
										<div class="icon-item icon-left" id="cart-link">
   										<img src="/store_images/장바구니.png" alt="Left Icon">
							 			<span class="hover-text">장바구니</span>
										</div>                                                                                                                     
                                        <div class="icon-item icon-right">
                                            <img src="/store_images/구매하기.png" alt="Right Icon" class="buyButton">
                                            <span class="hover-text">구매하기</span>                          
                                        </div>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">사이다L</span><br>
                                        <span class="discounted-price">4,000원</span>
                                </div>
                            </li> 
                   
                  
                        
                        </ul>
                    </li>
                </ul>
            </div>    
        </div>        
    </div>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
    <form id="payForm" action="/dostorepay" method="post" style="display:none;">
    <input type="hidden" id="productData" name="productData">
	</form> 
</body>
<script src="https://code.jquery.com/jquery-latest.js">
</script>
<script>
$(document).ready(function() {
 	let customer_id= $('#userid').val();
 	console.log(customer_id);
 	
	 	function updateCartCount() {
	        $.ajax({
	            url: '/countcart',
	            type: 'post',
	            data: { customer_id: customer_id },
	            dataType: 'text',
	            cache: false, // 캐시 비활성화
	            success: function(data) {
	                $('#cart-count').text(data);
	            }         
	        })
	    }
	
	    updateCartCount();
	
	

	    //페이지가 로드될 때 강제로 새로고침
	$(window).on('pageshow', function(event) {
	    if (event.originalEvent.persisted) {
	        window.location.reload();
	    } else {
	        let customer_id = $('#gg').val();
	
	        function updateCartCount() {
	            $.ajax({
	                url: '/countcart',
	                type: 'post',
	                data: { customer_id: customer_id },
	                dataType: 'text',
	                cache: false, // 캐시 비활성화
	                success: function(data) {
	                    $('#cart-count').text(data);
	                }         
	            });
	        }
	
	        updateCartCount();
	    }
	})

	$(window).on('popstate', function(event) {
	    window.location.reload();
	    
	})
	// 페이지가 로드될 때 강제로 새로고침

 	 
 	 function checkItemInCart(item_id) {
         return $.ajax({
             url: '/checkitem', // 서버에서 장바구니에 아이템이 있는지 확인하는 엔드포인트
             type: 'post',
             data: {item_id: item_id },
             dataType: 'json'
         });
     }
 	 	 
     // 페이지 로드 시 카운트 업데이트
 
     
    	        $('.icon-left').on('click', function(event) {
    	            // 클릭 이벤트를 막고, 비동기 작업이 완료된 후 결과에 따라 결정합니다.
    	            event.preventDefault(); // 기본 동작을 막습니다.
    	            console.log('Icon left clicked');

    	            var $productItem = $(this).closest('li.product');
    	            
    	            // li.product의 ID를 가져옵니다
    	            var item_id = $productItem.attr('id');
    	            console.log('Item ID:', item_id);

    	            // 원래 가격과 할인된 가격을 추출합니다
    	            let originalPrice = $.trim($productItem.find('.original-price').text());
    	            let discountedPrice = $.trim($productItem.find('.discounted-price').text());
    	            let discount_price = parseInt(discountedPrice.replace(/[^\d]/g, ''), 10);

    	            // 가격을 확인합니다
    	            console.log('Original Price:', originalPrice);
    	            console.log('Discounted Price:', discount_price);
    	          
    	            
    	            
    	            $.ajax({
    	                url: '/checkitem',
    	                type: 'post',
    	                data: { item_id: item_id },
    	                dataType: 'json',
    	                success: function(data) {
    	                    console.log('Server response:', data);

    	                    // 데이터의 타입 및 구조를 확인
    	                    console.log('Data type:', typeof data);
    	                    console.log('Data keys:', Object.keys(data));

    	                    let distinctItemCount = 0;
    	                    let specificItemCount = 0;

    	                    // 데이터가 배열일 경우 처리
    	                    if (Array.isArray(data)) {
    	                        // 배열이 비어 있지 않다면 첫 번째 요소를 사용
    	                        if (data.length > 0) {
    	                            let item = data[0]; // 첫 번째 요소를 사용
    	                            distinctItemCount = item.item_count || 0;
    	                            specificItemCount = item.item_qty || 0;
    	                        }
    	                    } else if (data && typeof data === 'object') {
    	                        // 데이터가 객체일 경우 직접 접근
    	                        distinctItemCount = data.item_count || 0;
    	                        specificItemCount = data.item_qty || 0;
    	                    } else {
    	                        console.error('Unexpected data format:', data);
    	                    }

    	                    console.log('Distinct item count:', distinctItemCount);
    	                    console.log('Specific item count:', specificItemCount);

    	                    // 품목 종류가 10개 이상이고 특정 아이템이 장바구니에 없는 경우
    	                    if (distinctItemCount >= 10 && specificItemCount === 0) {
    	                        alert('장바구니의 품목 종류가 10개 이상이므로 새로운 품목을 추가할 수 없습니다.');
    	                    } 
    	                    // 특정 아이템의 총 수량이 10개 이상인 경우
    	                    else if (specificItemCount >= 10) {
    	                        alert('장바구니에 이미 10개 이상의 수량이 있습니다.');
    	                    } 
    	                    else { 	                        	                 
                    
		                   	$.ajax({
		               			url:'/insertcart',type:'post',data:{item_id:item_id,qty:1,total: discount_price},dataType:'text',
		               			success:function(data){
		               			if(data=='ok'){
		               			
		               				 window.location.href = '/cart'; // 클릭 시 페이지 이동
		               			}
  	                			}
  	                		
  	                		}) 
  	                    	
    	               	                        	                    	  	                    	
    	                    	                    
    	                    }
    	                },
    	                error: function(xhr, status, error) {
    	                    console.error('AJAX 요청 오류:', status, error);
    	                    alert('요청 중 오류가 발생했습니다.');
    	                }
    	            })
    	        })     
    
})
let selectedItems = []; // 전역 변수로 선언

$('.buyButton').on('click', function(e) {
    e.preventDefault(); // 링크의 기본 동작을 방지
    let item_id = $(this).closest('.product').attr('id');
    console.log('item_id:', item_id);

    $.ajax({
        url: '/selectitem',
        type: 'POST',
        data: { item_id: item_id },
        dataType: 'json',
        success: function(data) {
            console.log('Server Response:', data);

            // 데이터가 배열일 경우 첫 번째 항목을 사용
            if (Array.isArray(data) && data.length > 0) {
                let item = data[0]; // 첫 번째 항목 사용

                // 기본값을 설정하고 문자열을 정리
                let discount_price = (item.discount_price || '0').replace(/원/g, '').replace(/,/g, '').trim();
                let price = (item.price || '0').replace(/원/g, '').replace(/,/g, '').trim();

                // 문자열을 숫자로 변환
                let discountPriceNum = parseFloat(discount_price) || 0;
                let PriceNum = parseFloat(price) || 0;

                // 금액충전형 조건
                let isRechargeablePrice = (item.discount_price === '금액충전형') || (item.cart_price === '금액충전형');

                // itemData 객체 생성
                let itemData = {
                    item_id: item.id, // data 객체의 속성 이름이 정확해야 합니다.
                    name: item.name,
                    composition: item.composition,
                    image_path: item.image_path,
                    discount_price: isRechargeablePrice ? 10000 : discountPriceNum,
                    cart_price: (discountPriceNum === PriceNum) ? undefined : (isRechargeablePrice ? 10000 : PriceNum),
                    total: (discountPriceNum === PriceNum) ? (isRechargeablePrice ? 10000 : discountPriceNum) : (isRechargeablePrice ? 10000 : PriceNum),
                    qty: 1
                };

                selectedItems.push(itemData);

                // totalPrice를 설정할 때 cart_price가 0이면 discount_price를 사용
                let totalPrice = (itemData.cart_price === 0 || itemData.cart_price === undefined) ? itemData.discount_price : (itemData.cart_price || 0);
                let totalDiscount = (totalPrice === itemData.discount_price) ? 0 : (totalPrice - itemData.discount_price); // 할인 계산
                let finalPrice = totalPrice - totalDiscount; // 최종 가격 계산

                // 폼 데이터 설정
                $('#productData').val(JSON.stringify({
                    items: selectedItems,
                    totalPrice: totalPrice,
                    totalDiscount: totalDiscount,
                    finalPrice: finalPrice
                }));

                console.log('Product data:', $('#productData').val()); // 디버깅: 전송할 데이터 출력

                $('#payForm').submit(); // 폼 제출
            } else {
                console.error('No data received from server.');
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error:', status, error);
        }
    });
});
</script>

</html>
