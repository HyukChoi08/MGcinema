<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스토어전체상품</title>
    <style>
body{

	background-color:black;
}  
*{
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
    box-sizing: border-box; /* border와 padding을 포함한 너비 계산 */
    border: 3px solid #808080; /* 회색 테두리 */
    border-radius: 15px; /* 테두리 둥글게 만들기 */
   
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

.separator {
    position: relative; /* 상위 요소에 상대적으로 위치 */
    bottom: 0; /* 부모 요소의 하단에 위치 */
    background-color: #000; 
}
.separator1 {
    position: relative; /* 상위 요소에 상대적으로 위치 */
    margin-top: 20px; /* 간격 추가: .contegory_contents_wrap과의 간격 */
    background-color: grey;
    height:2px;
}
.separator2{
    height: 1px; /* 선의 두께 설정 */
    width: 100%; /* 부모 요소의 전체 너비를 차지하도록 설정 */
    background-color:   grey; /* 선 색상 변경 */
    margin-top: 5px; /* 상단 여백 추가 */
    margin-bottom: 20px;
    position: relative; /* 상위 요소에 상대적으로 위치 */

}
.circle-button {
    display: inline-flex;
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: center; /* 수평 중앙 정렬 */
    width: 17px;
    height:17px;
    line-height: 20px;
    text-align: center;
    border-radius: 50%;
    background-color: grey;
    color: white;
    font-size: 14px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s;
    
    position: absolute; /* 버튼을 절대 위치로 설정 */
    right: 20px; /* 오른쪽 끝에서 10px 떨어지도록 설정 */
    
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
.contegory_contents_wrap a{

	color:white;
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

.category_inner {
    display: flex; /* Flexbox 레이아웃을 사용 */
    flex-wrap: wrap; /* 필요 시 줄 바꿈 */
    gap: 20px; /* 항목 사이의 간격 추가 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
}
.category_inner .product {
    flex: 1 1 calc(33.333% - 20px); /* 각 항목의 너비를 3개의 열로 나누기 */
    box-sizing: border-box; /* 패딩과 테두리가 너비에 포함되도록 설정 */
    text-align: center; /* 텍스트 중앙 정렬 */
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
.original-price {
	text-decoration: line-through; /* 가격에 취소선 추가 */
	color: #999; /* 취소선 색상 설정 */
	font-size: 14px; /* 취소선 가격 크기 조정 */
}

.discounted-price {
    font-size: 16px; /* 할인된 가격 크기 조정 */
    font-weight: bold; /* 할인된 가격 굵게 표시 */
}
.giftcardtext,.tiket-price{
    font-size: 14;
    font-weight: bold;
}
.info_wrap {
    width: 1000px; /* 너비를 1000px로 설정 */
    margin: 0 auto; /* 중앙 정렬 */
    padding: 20px; /* 내부 여백 추가 */
    box-sizing: border-box; /* 패딩과 테두리를 너비에 포함 */
    display: flex; /* Flexbox 레이아웃을 사용 */
    align-items: center; /* 자식 요소를 수직으로 중앙 정렬 */
    gap: 20px; /* 자식 요소 간의 간격 추가 */
}
.popup-text {
   font-size: 24px; /* 제목 글씨 크기 조정 */
   margin-bottom: 10px; /* 제목과 본문 사이 여백 */
}
.popup-image {
    max-width: 100%; /* 이미지가 부모 요소의 너비를 초과하지 않도록 설정 */
    height: auto; /* 이미지 비율 유지 */
    margin-bottom: 10px; /* 이미지와 본문 사이 여백 */
    margin-top: -100px;
}
img {
    max-width: 100%;
    height: auto;
}
.popup-description {
    font-size: 16px; /* 본문 글씨 크기 조정 */
    color: #555; /* 본문 글씨 색상 조정 */
    margin-top: 10px; /* 본문과 제목 사이 여백 */
}
.phone-icon {
    width: 30px; /* 원하는 너비로 조정 */
    height: auto; /* 이미지 비율 유지 */
    vertical-align: middle; /* 텍스트와 이미지의 수직 정렬 조정 */
}

.category_content li {
    cursor: pointer; /* 클릭 커서로 변경 */
}
.service_center{
    width: 1000px;        /* 너비를 1000px로 설정 */
    margin: 0 auto;       /* 중앙 정렬 */
}
.product {
	position: relative; /* 이 부분을 추가하여 아이콘 위치 조정 */
	overflow: hidden; /* 아이콘과 텍스트가 이미지 영역을 넘지 않도록 설정 */
}
.hidden-icon {
    display: none; /* 기본적으로 숨김 */
    position: absolute;
    bottom: 10px; /* 이미지 하단에 위치 조정 */
    right: 10px; /* 이미지 오른쪽에 위치 조정 */
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    color: white;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    text-align: center;
    line-height: 30px;
    font-size: 16px;
    font-weight: bold;
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
    line-height: 60px;
    font-size: 30px;
    font-weight: bold;
}
.hover-text {
    display: none; /* 기본적으로 숨김 */
    position: absolute; /* 아이콘에 대해 절대 위치 */
   
    left: 50%; /* 아이콘의 중앙 정렬 */
    transform: translateX(-50%); /* 수평 중앙 정렬 */
    background-color: rgba(0, 0, 0, 0.8); /* 반투명 배경 */
    color: white; /* 글자 색상 */
    padding: 5px; /* 텍스트 주변 여백 */
    border-radius: 5px; /* 둥근 모서리 */
    font-size: 20px; /* 텍스트 크기 조정 */
    white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
    z-index: 20; /* 텍스트가 다른 요소 위에 위치하도록 설정 */
    line-height: 24px; /* 텍스트 수직 정렬을 위한 높이 조정 */
}
.product:hover .icon-container {
    display: flex; /* 호버 시 아이콘 표시 */
}

.icon-left,.icon-right {
    background-color: rgba(255, 255, 255, 0.8); /* 밝은 배경색으로 변경 */
    color: black; /* 아이콘 색상 */
    border-radius: 50%;
    width: 50px; /* 아이콘 크기 */
    height: 50px; /* 아이콘 크기 */
    text-align: center; /* 아이콘 텍스트 중앙 정렬 */
    line-height: 50px; /* 아이콘 텍스트 수직 중앙 정렬 */
    font-size: 24px; /* 아이콘 텍스트 크기 */
    font-weight: bold; /* 아이콘 텍스트 굵게 */
}
.icon-container {
    position: absolute; /* 이미지 내부에 절대 위치로 배치 */
    width: 100%; /* 이미지의 전체 너비를 차지하도록 설정 */
    height: 100%; /* 이미지의 전체 높이를 차지하도록 설정 */
    top: -30px; /* 이미지 상단에 맞춤 */
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
    margin: 0 20px; /* 아이콘 사이의 간격을 조정합니다 (좌우 여백) */
    
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
.icon-link {
	text-decoration: none; /* 링크의 밑줄 제거 */
	color: inherit; /* 부모 요소의 텍스트 색상 상속 */
	display: inline-block; /* 아이콘을 인라인 블록으로 설정 */
}

.icon-link img {
   display: block; /* 이미지 아래 여백 제거 */
}
.no-style-link {
   text-decoration: none; /* 밑줄 제거 */
   color: inherit; /* 링크 색상 유지 */
}

.no-style-link:visited {
   color: inherit; /* 방문 후 색상 유지 */
}
#cart-icon {
   cursor: default; /* 손가락 모양 커서를 기본 커서로 변경 */
   text-decoration: none; /* 링크의 기본 밑줄 제거 */
}
.li1{
	margin-top:10px;

}
#store-link {
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: inherit; /* 부모 요소의 색상 상속 */
}
#store-link:hover {
    text-decoration: underline; /* 마우스 오버 시 밑줄 추가 */
} 
.product-composition{
	font-size:12px;

}
.category_content a:hover {
    text-decoration: underline; /* 마우스 오버 시 밑줄 추가 */
}
.cart_content a {
    text-decoration: none; /* 기본 상태에서 밑줄 제거 */
    color: inherit; /* 부모 색상 상속 */
}

.cart_content a:hover {
    text-decoration: underline; /* 마우스 오버 시 밑줄 추가 */
}

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    <div id="container">
        <div id="contents">
            <div class="category_wrap">
            <a href="/store" id="store-link">베스트상품</a>            
            <input type="hidden" id="userid" value="${uid}">     <!-- uid 값을 히든 필드에 저장해서 사용. -->
            <input type="hidden" id="age">     <!-- age 값을 히든 필드에 저장해서 사용(맥주나 샴페인과 같은 조건을 위해서). -->
                <div class="separator"></div> <!-- 선을 스토어 아래에 위치 -->
            </div>
            <div class="contegory_contents_wrap">
                <ul class="category_content"> <!-- ul로 변경 -->
                	<li><a href="/storeall" class="no-underline">전체상품</a></li>
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
                        <strong class="category_title">베스트상품<br>                       
                        </strong> 
                        <div class="separator2"></div>
                        <ul class="category_inner">                      	
                        	<c:forEach items="${arStore}" var="Store">
	                            <li class="product" id="${Store.id}">
	                                <a href="/details?id=${Store.id}" class="btn_category_product">  
	                                    <img src="${Store.image_path}" alt="${Store.item_name}"></a>
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
									    <span class="product-name">${Store.item_name}</span><br>
									     <span class="product-composition">${Store.composition}</span><br>
										<c:choose> 
										    <c:when test="${Store.price == Store.discount_price}"> 
										        <!-- 가격이 할인 가격과 같을 경우 할인 가격만 표시 -->
										        <span class="discounted-price">
										            <c:choose>  
										                <c:when test="${Store.discount_price == '금액충전형'}">
										                    ${Store.discount_price}
										                </c:when>
										                <c:otherwise> 
										                    ${Store.discount_price}원
										                </c:otherwise>
										            </c:choose>
										        </span>
										    </c:when>
										    <c:otherwise>
										        <!-- 가격이 할인 가격과 다른 경우 둘 다 표시 -->
										        <span class="discounted-price">
										            <c:choose> 
										                <c:when test="${Store.discount_price == '금액충전형'}">
										                    ${Store.discount_price}
										                </c:when>
										                <c:otherwise>
										                    ${Store.discount_price}원
										                </c:otherwise>
										            </c:choose>
										        </span>
										        <span class="original-price">
										            <c:choose>
										                <c:when test="${Store.price == '금액충전형'}"> 
										                    ${Store.price}
										                </c:when>
										                <c:otherwise> <!-- 모든 조건이 거짓일 때 실행됨. -->
										                    ${Store.price}원
										                </c:otherwise>
										            </c:choose>
										        </span>
										    </c:otherwise>
										</c:choose>
									</div>
	                            </li>
	                         </c:forEach>      	                         	                                             
                        </ul>
                    </li>
                </ul>
            </div>    
        </div>        
    </div>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
    <form id="payForm" action="/dostorepay" method="post" style="display:none;">   <!-- 폼태그를 실행하기 위해서 hidden필드에 만들었음. -->
    <input type="hidden" id="productData" name="productData">
	</form> 
</body>
<script src="https://code.jquery.com/jquery-latest.js">
</script>
<script>

function updateCartCount() {
    $.ajax({
        url: '/countcart',
        type: 'post',
        data: {},
        dataType: 'text',
        cache: false,
        success: function(data) {
            $('#cart-count').text(data);
        }
    });
}
//장바구니에 품목의 수 체크하는 함수.로그인 안할때는 0만 들어가게 했음.

$(document).ready(function() {
	
	
	$.ajax({
	    url: '/storeage',
	    type: 'POST',
	    dataType: 'json', // 응답 데이터 형식을 JSON으로 지정
	    success: function(data) {
	        console.log(data);        
	        // 데이터가 객체로 전달됨
	        let birthday = data.birthday; // 필드명이 실제 JSON 데이터와 일치하는지 확인
            console.log('Birthday:', birthday);
	        	        
            let birthYear = new Date(birthday).getFullYear(); //생일에서 년도만 추출
            console.log('Birth Year:', birthYear);
            
            // 현재 연도 추출
            let currentYear = new Date().getFullYear();  
            console.log('Current Year:', currentYear);
            
            let age = currentYear - birthYear; //나이 계산
            console.log(age);
            $('#age').val(age);
	                
	    }
	});
	
    $('.product').each(function() {
        // 현재 .product 요소 내의 .discounted-price 값을 가져옴
        var discountedPrice = $(this).find('.discounted-price').text().trim();

        // '금액충전형'인 경우 .icon-item.icon-left 요소 숨김
        if (discountedPrice === '금액충전형') {
            $(this).find('#cart-link').hide();    //장바구니 아이콘 숨긴다.
        }
    });
    
 	let customer_id= $('#userid').val();
 	console.log(customer_id);
 		
    updateCartCount();    //장바구니에 담은 품목 함수 실행.
	
     $(window).on('pageshow', function(event) {
         if (event.originalEvent.persisted) {
             window.location.reload();
             updateCartCount();
         }
     });

    //페이지가 로드될 때 강제로 새로고침	
      
     $(window).on('popstate', function(event) {
         // 이 부분은 필요에 따라 조정
         // 페이지가 새로 고쳐질 필요가 없는 경우 주석 처리
         window.location.reload();
         updateCartCount();
     });
     // 브라우저 히스토리 상태가 변경될 때 새로 고침 처리
     
     $('.icon-left').on('click', function(e) {
 	    e.preventDefault(); // 기본 동작을 막습니다.
 	    

 	    if (customer_id === '') {
 	        
 	        let  userConfirmed = confirm("로그인 페이지로 이동하시겠습니까?");
 	                
 	         if ( userConfirmed) {
 	          
 	             window.location.href = '/login';
 	             
 	             return false;
 	         }else{
 	        	    return false;
 	         } 
 	        	
 	     }
 	       		    	     	     	    
 	    let productName = $(this).closest('.product').find('.product-composition').text().trim();  
 	    console.log('Clicked product compos:', productName);
	
 	    let age = $('#age').val();
 	    if (productName.includes('맥주') || productName.includes('샴페인')) {   //해당 단어를 포함하는거에 조건을 걸었음.
 	      if (age < 20) {
 	        
 	        alert('20살 이상만 구매할 수 있습니다.');
 	        return false;
 	      }
 	    }
 	 	// 나이가 20세 이상일 때 구매를 허용
 	       	    
 	    let $productItem = $(this).closest('li.product');    
 	    let item_id = $productItem.attr('id');         //가장 가까운 li.product의 id값을 가져옴
 	    console.log('Item ID:', item_id);

 	    let discountedPrice = $.trim($productItem.find('.discounted-price').text());   //앞뒤 공백제거
 	    let discount_price = parseInt(discountedPrice.replace(/[^\d]/g, ''), 10);     // 예: "1,200" => 1200 (문자열에서 숫자로 변환)
 	    console.log('Discounted Price:', discount_price);

   	    $.ajax({
   	        url: '/checkitem',
   	        type: 'post',
   	        data: { customer_id: customer_id, item_id: item_id },
   	        dataType: 'json',
   	        success: function(data) {
   	            console.log('Server response:', data);

   	            // 응답 데이터가 배열이므로 첫 번째 요소에 접근합니다.
   	            let itemData = data[0] || {}; // 첫 번째 요소를 가져옵니다.

   	            // item_qty와 item_count를 추출합니다.
   	            let itemQty = itemData.item_qty || 0; // 특정 품목의 수량
   	            let itemCount = itemData.item_count || 0; // 품목 종류 수

   	            console.log('Item Qty:', itemQty);
   	            console.log('Item Count:', itemCount);

   	            if (itemCount >= 10) {
   	                alert('장바구니의 품목 종류가 10개 이상이므로 새로운 품목을 추가할 수 없습니다.');
   	            } else if (itemQty >= 10) {
   	                alert('장바구니에 이미 10개 이상의 수량이 있습니다.');
   	            } else {
   	                if (itemQty > 0) {
   	                    $.ajax({
   	                        url: '/updatecart',
   	                        type: 'post',
   	                        data: {
   	                            customer_id: customer_id,
   	                            item_id: item_id,
   	                            qty: itemQty + 1, // 기존 수량에 1 추가
   	                            total: discount_price
   	                        },
   	                        dataType: 'text',
   	                        success: function(response) {
   	                            if (response === 'ok') {
   	                                window.location.href = '/cart'; // 클릭 시 페이지 이동
   	                            } 
   	                        }
   	                        //해당 item_id가 이미 장바구니에 있으면 수량 업데이트.
   	                     
   	                    });
   	                } else {
   	                    $.ajax({
   	                        url: '/insertcart',
   	                        type: 'post',
   	                        data: {
   	                            customer_id: customer_id,
   	                            item_id: item_id,
   	                            qty: 1, // 새 품목은 수량 1
   	                            total: discount_price
   	                        },
   	                        dataType: 'text',
   	                        success: function(response) {
   	                            if (response === 'ok') {
   	                                window.location.href = '/cart'; // 클릭 시 페이지 이동
   	                            }
   	                        }
   	                      
   	                    });
   	                  //해당 item_id가 장바구니에 없다면 인서트.
   	                }
   	            }
   	        }	      
   	    });
    })
})    	
    	
let selectedItems = []; // 전역 변수로 선언

$('.buyButton').on('click', function(e) {
    e.preventDefault(); // 링크의 기본 동작을 방지
    
    let customer_id=$('#userid').val();
    
    if (customer_id === '') {
      
       let  userConfirmed = confirm("로그인 페이지로 이동하시겠습니까?");
               
        if ( userConfirmed) {
           
            window.location.href = '/login';
            
            return false;
        }else{
       	    return false;
        } 
       	
    }
       
    let productName = $(this).closest('.product').find('.product-composition').text().trim();
    console.log('Clicked product compos:', productName);

    let age = $('#age').val();
    if (productName.includes('맥주') || productName.includes('샴페인')) {
      if (age < 20) {
        // 나이가 20세 이상일 때 구매를 허용
        alert('20살 이상만 구매할 수 있습니다.');
        return false;
      }
    }
               
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
                    discount_price: isRechargeablePrice ? 10000 : discountPriceNum,     //금액충전형이라면 10000
                    cart_price: (discountPriceNum === PriceNum) ? undefined : (isRechargeablePrice ? 10000 : PriceNum),  //(둘의 값이 같으면)? 할인가격은 없는경우:(금액충전형이라면 ? 10000 :아니라면 price값가져옴) 
                    total: (discountPriceNum === PriceNum) ? (isRechargeablePrice ? 10000 : discountPriceNum) : (isRechargeablePrice ? 10000 : discountPriceNum),
                    qty: 1
                };

                selectedItems.push(itemData);  //itemData객체를 selectedItems 배열에 넣는다.

                // totalPrice를 설정할 때 cart_price가 0이면 discount_price를 사용
                let totalPrice = (itemData.cart_price === 0 || itemData.cart_price === undefined) ? itemData.discount_price : (itemData.cart_price || 0);  //총 상품금액
                let totalDiscount = (totalPrice === itemData.discount_price) ? 0 : (totalPrice - itemData.discount_price); // 할인 금액
                let finalPrice = totalPrice - totalDiscount; // 최종 결제 금액

                // 폼 데이터 설정
                $('#productData').val(JSON.stringify({
                    items: selectedItems,
                    totalPrice: totalPrice,
                    totalDiscount: totalDiscount,
                    finalPrice: finalPrice
                }));
                //selectedItems, totalPrice, totalDiscount, finalPrice를 포함한 객체를 JSON 문자열로 변환하여 #productData라는 폼 필드에 설정

                console.log('Product data:', $('#productData').val()); // 디버깅: 전송할 데이터 출력

                $('#payForm').submit(); // 폼 제출
                            
            } 
        }
        
    });
});



</script>

</html>
