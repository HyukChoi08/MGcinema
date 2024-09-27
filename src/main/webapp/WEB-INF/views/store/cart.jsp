<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
.category_content li {
    cursor: pointer; /* 클릭 커서로 변경 */
}
 .no-underline {
   	text-decoration: none; /* 링크의 밑줄을 제거합니다 */
     color: white;    
}

.no-underline:hover {
    text-decoration: none; /* 마우스 오버 시에도 밑줄이 보이지 않도록 합니다 */
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
.no-style-link {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 링크 색상 유지 */
	}

.no-style-link:visited {
   color: inherit; /* 방문 후 색상 유지 */
}
.separator, .separator1 {
    width: 100%; /* 부모 요소의 전체 너비를 차지하도록 설정 */
    height: 2px;
    margin: 0;
}
.separator1 {
    position: relative; /* 상위 요소에 상대적으로 위치 */
    margin-top: -10px; /* 간격 추가: .contegory_contents_wrap과의 간격 */
    margin-bottom:30px;
    background-color: grey;
    height:3px;   
}

#container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 20px;
    width: 1000px;
    margin: 0 auto;
    background-color:black;
    margin-top: 150px; 
    margin-bottom: 335px;
    border: 3px solid #808080; /* 회색 테두리 */
    border-radius: 15px; /* 테두리 둥글게 만들기 */
}


.cart_step {
    list-style-type: none;
    padding: 0px; /* 컨테이너의 패딩 */
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: center; /* 항목들을 가운데 정렬 */
    margin-bottom: 30px;
   
}
.cart_step li {
    display: flex;
    align-items: center;
    position: relative;
}
.cart_step div{
   	margin-left: 90px; /* 좌측 여백 */
    margin-right: 90px; /* 우측 여백 */
    display: block;
    font-size: 16px;
    color: #666;
    margin-bottom: 5px;
   
}

.cart_step li strong {
    display: block;
    font-size: 16px;
    font-weight: bold;
}

  .cart_step .step.active strong {
            color: red; /* 활성 단계의 색상 */
        }

/* 화살표 스타일 */
.cart_step .step:not(:last-child)::after {
        content: '>';
        display: inline-block;
        margin: 0 10px; /* 화살표의 좌우 간격 */
        font-size: 20px;
        color: #666;
}

/* 마지막 항목의 화살표를 숨김 */
.cart_step .step.step1,
.cart_step .step.step1::after {
    color: red; /* step0 텍스트와 화살표 색상 */
}
.cart_step .step.step1.active span,
.cart_step .step.step1.active strong {
    color: red; /* STEP 02의 텍스트 색상 */
}

.cart-item {
    display: flex;
     align-items: center; /* 세로 중앙 정렬 */
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 10px; 
    background-color:black;
    
}

.item-image {
    max-width: 100px;
    margin-right: 20px;
}
 .cart-item {
      display: flex;
      align-items: center; /* 수직 정렬 */
      padding: 10px; /* 선택적: 여백 */
      margin-bottom: 10px; /* 선택적: 항목 간 간격 */
  }
  .cart-item img {
      max-width: 100px; /* 이미지 크기 조정, 필요에 따라 수정 */
      margin-right: 15px; /* 이미지와 텍스트 간의 간격 */
  }
  .item-details {
      display: flex;
      flex: 1;
      justify-content: space-between;
  }
  
  .item-details div {
      margin-right: 10px;
  }
  
  .item-name, .discount, .price, .qty, .total {
      width: 100px; /* Adjust as needed */
  }
.header1 {
  display: grid;
  grid-template-columns: 100px 1fr 1fr 1fr 100px 100px 100px 100px;
  gap: 10px;
  font-weight: bold;
  margin-bottom: 20px;
}
.crossed-price {
    text-decoration: line-through; /* 취소선 추가 */
    color: #888; /* 선택 사항: 취소선 색상 */
}
.separator {
 width: 100%; 
 height: 2px;
 margin: 0;
}
.separator {
   
    background-color: black; 
    margin-bottom:20px;
}
.foottable {
    width: 100%; /* 테이블이 부모 요소의 너비를 100% 차지 */
    border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
    margin: 0 auto; /* 테이블을 중앙에 정렬 */
   
}

.foottable thead {
    display: block;
}

.foottable tbody {
    display: block;
    overflow-x: auto; /* 가로 스크롤을 허용 */
}

.foottable thead th {
    background-color: #f4f4f4; /* 헤더 배경색 */
}

.foottable tbody tr {
    display: flex;
    justify-content: space-between;
}

.foottable tbody td {
    width: 33%; /* 각 셀의 너비 설정 */
    color:white;
}
.foottable th, .foottable td {
    text-align: center;
    padding: 10px;
  
    box-sizing: border-box; /* padding과 border를 너비에 포함 */
}

/* thead의 th 스타일 */
.foottable thead {
    width: 100%; /* 전체 테이블 너비에 맞게 설정 */
}

/* 각 열의 너비 비율 설정 */
.width-40 {
    width: 10%; /* 모든 .width-40 요소에 동일한 너비 설정 */
    color:black;
}

.width-20 {
    width: 20%;
    color:black;
}
/* tbody의 td 스타일 (기본적으로 thead와 동일하게 유지) */
.foottable tbody td {
    box-sizing: border-box; /* padding과 border를 너비에 포함 */
}
.cartprice{
	text-decoration: line-through;
    color:grey; 

}

#alldelete{
	position: relative;
    left:-440px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
	margin-bottom:30px;
	width:100px;
	height:40px;
  	border-radius: 5px;
  	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
  	border: 2px solid #666; /* 테두리 색상 및 두께 설정 */
  	color:whhite;
  	background-color: #444; /* 배경색을 검정색으로 설정 */
  	
}
#alldelete:hover{
	background-color: red; /* 호버 시 배경색 변경 */
}
.cart-table {
    width: 100%;
    border-collapse: collapse;
}
th {
    text-align: left; /* 셀 내용을 왼쪽 정렬 */ 
}
#head0 {
    position: relative;
    left:18px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
}
#head1 {
	position: relative;
    left:-35px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
}

#head3{
	position: relative;
    left:85px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */


}
#head4{
	position: relative;
    left:65px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */

}
#head5{
position: relative;
    left:65px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */


}
#head6{
	position: relative;
    left:105px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
	

}

.tb td {
    padding: 10px; /* 원하는 패딩 값으로 조정 */
}
.item-details {
    text-align: left; /* 텍스트를 왼쪽 정렬로 설정 */
}
.cart_step{
margin-bottom:30px;

}
.qty{
	position: relative;
    left:-35px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
  
}

.qty-container {
    display: flex;
    align-items: center;
}

.qty-buttons {
    display: flex;
    flex-direction: column;
}

.qty-buttons button {
    background-color: #444;
    border: none;
    color: white;
    font-size: 18px; /* 폰트 크기 조정 */
    padding: 0; /* 패딩 제거 */
    width: 20px; /* 버튼 너비 설정 */
    height: 20px; /* 버튼 높이 설정 */
    display: flex; /* 플렉스 박스를 사용하여 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: center; /* 수평 중앙 정렬 */
    cursor: pointer;
}

.qty-buttons button:hover {
    background-color: red;
}

.qty-input {
    width: 30px;
    height: 35px;
    text-align: center;
    font-size: 18px;
    color:black;
}
.choice {
    display: flex; /* 플렉스 박스를 사용하여 배치 */
    flex-direction: column; /* 세로 방향으로 배치 */
    align-items: center; /* 수평 중앙 정렬 (선택사항) */
}


.choice input[type="button"] {
 
    width: 100px; /* 버튼 너비 설정 (필요에 따라 조정) */
    height: 30px; /* 버튼 높이 설정 (필요에 따라 조정) */
    position: relative;
    left:90px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
    
}
.btnchange {
    background-color: #444; /* 배경색을 검정색으로 설정 */
    color: white; /* 텍스트 색상을 하얀색으로 설정 */
    border: 2px solid #666; /* 테두리 색상 및 두께 설정 */
    font-size: 13px; /* 폰트 크기 설정 */
    padding: 0; /* 패딩을 0으로 설정 (높이에 맞게 조정) */
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */ 
    width: 38px; /* 버튼 너비 자동 조정 */
    transition: background-color 0.3s, border-color 0.3s; /* 배경색과 테두리 색상의 전환 효과 */
    height: 40px; /* 버튼 높이 설정 */
    line-height: 20px; /* 텍스트를 수직 중앙에 배치 */
    box-sizing: border-box; /* 패딩과 테두리를 포함하여 높이와 너비를 계산 */
}

.btnchange:hover {
    background-color: red; /* 호버 시 배경색 변경 */
    border-color: #444; /* 호버 시 테두리 색상 변경 */
}
.discount{
	position: relative;
    left:-30px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
}
.total{
	position: relative;
    left:-30px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
}
.choice{
	position: relative;
    left:-110px; /* 원하는 위치로 이동 (음수 값으로 왼쪽으로 이동) */
  
  
}
.choice input[type="button"] {
    margin: 10px 0; /* 위아래 간격 설정 (10px) */
    width: 100px; /* 버튼 너비 설정 (필요에 따라 조정) */
    height: 40px; /* 버튼 높이 설정 (필요에 따라 조정) */
    background-color: #444; /* 배경색 설정 */
  	color: white !important; /* 텍스트 색상 강제로 설정 */
    border: 2px solid #666; /* 테두리 색상 및 두께 설정 */
    font-size: 13px; /* 폰트 크기 설정 */
    padding: 0; /* 패딩 제거 */
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
    text-align: center; /* 텍스트 중앙 정렬 */
    border-radius: 4px; /* 모서리 둥글게 설정 (선택 사항) */
    transition: background-color 0.3s, border-color 0.3s; /* 배경색과 테두리 색상의 전환 효과 */
   
}
#pay{
  padding: 10px 20px; /* 버튼의 여백 조정 */
  font-size: 16px;    /* 글자 크기 조정 */
  border: 2px solid #666; /* 테두리 색상 및 두께 설정 */
  background-color: #444; /* 배경색 설정 */
  color:white;
  cursor: pointer;    /* 커서가 버튼 위에 있을 때 손 모양으로 변경 */
  margin: 0 5px;      /* 버튼 간격 조정 */
  position: relative; /* 버튼의 위치를 조정할 수 있게 함 */
  left:160px;
  border-radius: 5px; /* 테두리를 둥글게 설정 */
     
}
#pay:hover {
   background-color: red; /* 호버 시 배경색 변경 */
}

#btnback {  
   border-color: #0056b3;
   font-size:20px;
   position: relative; /* 버튼의 위치를 조정할 수 있게 함 */
   left:-180px;
   
}
.tol{
 border: 2px solid white;
 margin-bottom:30px;

}
.category_wrap {
    width: 80%; /* 원하는 너비로 설정 */
    margin: auto; /* 위쪽 마진 20px 추가, 좌우 자동 마진으로 중앙 정렬, 아래 여백 10px 유지 */
    padding-top: 5px; /* 위쪽 안쪽 여백 추가 */
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
.cart-item .btnpay:hover,
.cart-item .btndelete:hover {
  background-color: red; /* 호버 시 배경색 변경 */
}
#info {
    left: 1080px; /* 간격 조정 */
    position: relative; /* 상대 위치 설정 */
    top: -320px; /* 위쪽으로 이동 */
    text-align: left; /* 왼쪽 정렬 */
    padding-left: 0; /* 여백 없앰 */
}
#storehead {
    position: relative;
    top: 60px; /* 원하는 만큼 아래로 이동 */
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<h1 id="storehead">스토어</h1>
<div id="container">
  	<div class="contegory_contents_wrap">
    	   <div class="category_wrap">                
             <div class="separator"></div> <!-- 선을 스토어 아래에 위치 -->                
            </div>
        <ul class="category_content"> <!-- ul로 변경 -->
        	<li><a href="/store" class="no-underline">베스트상품</a></li>            	
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
 	<div class="cart_step">
       <div class="step step1 active"><span>STEP 01</span>&nbsp;<strong>장바구니</strong></div>
       <div class="step step2"><span>STEP 02</span>&nbsp;<strong>결제하기</strong></div>     
   </div>
    <div class="cart_details">
        <table class="cart-table">
            <thead>
                <tr class="header1">
                    <th id="head0"><input type="checkbox" id="allcheck"></th>
                    <th id="head1">상품이미지</th>
                    <th id="head2">상품이름</th>       
                    <th id="head3">판매금액</th>        
                    <th id="head4">수량</th>
                    <th id="head5">구매금액</th>
                    <th id="head6">선택</th>
                </tr>
            </thead>
            <tbody class="tb">
                <c:forEach items="${arCart}" var="cart">
                    <tr class="cart-item">                  	          
                        <td><input type="checkbox" class="item-checkbox"></td>
                        <td>
                            <input type="hidden" class="item_id" value="${cart.item_id}">
                            <input type="hidden" id="gg" value="${uid}">             
                            <img src="${cart.image_path}" id="imagepath" alt="${cart.item_id}">
                        </td>  
                        <td class="item-details">
                            <div class="item_name">
                                <span>${cart.item_name}</span><br>
                                <span>${cart.composition}</span>
                            </div>
                        </td>  
                        <td>    
                            <div class="discount">
                                <span class="discount_price">${cart.discount_price}원</span>
                                <c:choose>
                                    <c:when test="${cart.price ne cart.discount_price}">
                                        <span class="cartprice">${cart.price}원</span>
                                    </c:when>
                                </c:choose>
                            </div>
                        </td>
                        <td class="qty">
						    <div class="qty-container">
						        <input type="text" min="1" max="10" readonly class="qty-input"  value="${cart.qty}">
						        <div class="qty-buttons">
						            <button class="increase-btn">+</button>
						            <button class="decrease-btn">-</button>
						        </div>
						         <div class="changes"> 
					            	<button class="btnchange">변경하기</button>
					        	</div>
						    </div>
						</td>
                        <td class="total">${cart.total}</td>
                        <td class="choice">
                            <input type="button" class="btnpay" value="구매하기">
                            <input type="button" class="btndelete" value="삭제하기">
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="separator"></div>
        <input type="button" id='alldelete' value="선택상품삭제">
        <table class="foottable"> 
      	<thead class="footthead">
        		<tr>
			        <th class="width-40">총 상품 금액</th>
	                <th class="width-20">할인금액</th>
	                <th class="width-40">총 결제 예정금액</th>
        		</tr>
	    	</thead>
        	 <tbody class="tol">
		        <tr>
		     		<td class="totalprice"></td>
		     		<td class="minus">-</td>
		            <td class="totaldiscount"></td>
		         	<td class="equal">=</td>
		            <td class="finalprice"></td>		            
		        </tr>
	    	</tbody>	    	
        </table>
        <form id="payForm" action="/dostorepay?source=cart" method="post">
		    <input type="hidden" id="productData" name="productData">
		    <a href="javascript:history.back()" id="btnback">뒤로가기</a>
		    <button type="button" id="pay">결제하기</button>
		</form>
    </div> 
</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
function updateCartCount() {
    $.ajax({
        url: '/countcart',
        type: 'post',
        data: { customer_id: $('#gg').val() },
        dataType: 'text',
        success: function(data) {
            $('#cart-count').text(data);
        }
    });
}

$(document).ready(function() {


    let length = $('.item-checkbox').length;

    // item-checkbox가 하나도 없을 때 #allcheck 체크박스 해제
    if (length === 0) {
        $('#allcheck').prop('checked', false);
    } else {
        // item-checkbox가 있을 경우, #allcheck 체크박스와 item-checkbox를 모두 체크 상태로 설정
        $('#allcheck').prop('checked', true);
        $('.item-checkbox').prop('checked', true);
    }
	 
	 
	 $('.item-checkbox').on('change', function() {
	        let allChecked = $('.item-checkbox').length === $('.item-checkbox:checked').length;
	        $('#allcheck').prop('checked', allChecked);
	    });
	 	
	let customer_id = $('#gg').val();   
    
    updateCartCount(customer_id);

	//페이지가 로드될 때 강제로 새로고침

        $(window).on('pageshow', function(event) {
            if (event.originalEvent.persisted) {
                window.location.reload();
                updateCartCount(customer_id);
            }
        });

        // 브라우저 히스토리 상태가 변경될 때 새로 고침 처리
        $(window).on('popstate', function(event) {
            // 이 부분은 필요에 따라 조정
            // 페이지가 새로 고쳐질 필요가 없는 경우 주석 처리
            window.location.reload();
            updateCartCount(customer_id);
        });
	 
 	 function checkItemInCart(item_id) {
         return $.ajax({
             url: '/checkitem', // 서버에서 장바구니에 아이템이 있는지 확인하는 엔드포인트
             type: 'post',
             data: {item_id: item_id },
             dataType: 'json'
         });
     }
	 	 
     // 페이지 로드 시 카운트 업데이트
     //updateCartCount();

  

    function formatNumber(number) {
        return number.toLocaleString();
    }

    function calculateItemTotal(item) {
        let qtyInput = item.find('.qty-input');
        let qty = parseInt(qtyInput.val()) || 0;
        let discountPriceText = item.find('.discount_price').text().replace(/,/g, '').replace('원', '');
        let discountPrice = parseInt(discountPriceText) || 0;

        let totalItemPrice = discountPrice * qty;

        item.find('.total').text(formatNumber(totalItemPrice) + '원');
    }

    function calculateTotal() {
        let totalPrice = 0;
        let totalDiscount = 0;
        let finalPrice = 0;

        $('.cart-item').each(function() {
            let item = $(this);
            let checkbox = item.find('.item-checkbox');

            if (checkbox.is(':checked')) {
                let discountPriceText = item.find('.discount_price').text().replace(/,/g, '').replace('원', '');
                let cartPriceText = item.find('.cartprice').text().replace(/,/g, '').replace('원', '');
                let qtyInput = item.find('.qty-input');
                let qty = parseInt(qtyInput.val()) || 0;

                let discountPrice = parseInt(discountPriceText) || 0;
                let cartPrice = parseInt(cartPriceText) || 0;

                let totalItemPrice = discountPrice * qty;
                let totalItemDiscount = cartPrice > discountPrice ? (cartPrice - discountPrice) * qty : 0;

                totalPrice += totalItemPrice;
                totalDiscount += totalItemDiscount;
                finalPrice = totalPrice - totalDiscount;
            }
        });

        $('.totalprice').text(formatNumber(totalPrice) + '원');
        $('.totaldiscount').text(formatNumber(totalDiscount) + '원');
        $('.finalprice').text(formatNumber(finalPrice) + '원');

        return { totalPrice, totalDiscount, finalPrice };
    }

    function updateCartItems() {
        $('.cart-item').each(function() {
            let item = $(this);
            calculateItemTotal(item);
        });
    }

    // 페이지 로드 시 초기화
    updateCartItems();
    calculateTotal();

    function adjustQuantity(button, increment) {
        let qtyContainer = button.closest('.qty-container');
        let qtyInput = qtyContainer.find('.qty-input');
        let currentQty = parseInt(qtyInput.val(), 10) || 0;
        let newQty = currentQty + increment;
        let minQty = parseInt(qtyInput.attr('min')) || 1;
        let maxQty = parseInt(qtyInput.attr('max')) || 10;

        if (newQty < minQty) {
            // 수량이 최소값보다 작을 경우 alert 띄움
            alert("최소 1개 수량부터 구매 가능합니다.");
            return; // 더 이상 진행하지 않음
        }

        // 최대 수량 초과 시 alert
        if (newQty > maxQty) {
            alert("최대 10개 수량까지 구매 가능합니다."); // 최대 수량 초과 시 알림
            return; // 더 이상 진행하지 않음
        }
        qtyInput.val(newQty);
        calculateItemTotal(button.closest('.cart-item'));
        calculateTotal(); // 전체 총합 재계산
    }

    // Increase quantity
    $(document).on('click', '.increase-btn', function() {
        adjustQuantity($(this), 1);
    });

    // Decrease quantity
    $(document).on('click', '.decrease-btn', function() {
        adjustQuantity($(this), -1);
    });

    // 수량 입력 값이 변경될 때마다 총합 재계산
    $(document).on('input change', '.qty-input', function() {
        let item = $(this).closest('.cart-item');
        calculateItemTotal(item);
        calculateTotal();
    });

    // 체크박스 상태가 변경될 때마다 전체 총합 재계산
    $(document).on('change', '.item-checkbox', function() {
        calculateTotal();
    });

    // 전체 선택 체크박스 클릭 시 모든 체크박스 상태 변경
    $('#allcheck').on('click', function() {
        let checked = $(this).is(':checked');
        $('.item-checkbox').prop('checked', checked);
        calculateTotal();
    });
       
    // 결제 버튼 클릭 시
    $('#pay').on('click', function() {
        let selectedItems = [];
        let totals = calculateTotal(); // 총합 계산 및 반환

        console.log('Calculated totals:', totals);

     $('.cart-item').each(function() {
         let item = $(this);
         let checkbox = item.find('.item-checkbox');

         if (checkbox.is(':checked')) {
             let itemData = {
                 item_id: parseInt(item.find('.item_id').val(), 10),
                 name: item.find('.item_name span').first().text().trim(),
                 composition: item.find('.item_name span').last().text().trim(),
                 image_path: item.find('img').attr('src').trim(),
                 discount_price: item.find('.discount_price').text().replace(/원/g, '').replace(/,/g, '').trim(),
                 cart_price: item.find('.cartprice').text().replace(/원/g, '').replace(/,/g, '').trim(),
                 total: item.find('.total').text().replace(/원/g, '').replace(/,/g, '').trim(),
                 qty: parseInt(item.find('.qty-input').val(), 10)
             };

             selectedItems.push(itemData);
         }
     });

     $('#productData').val(JSON.stringify({
         items: selectedItems,
         totalPrice: totals.totalPrice,
         totalDiscount: totals.totalDiscount,
         finalPrice: totals.finalPrice
     }));

     console.log('Product data:', $('#productData').val());

     $('#payForm').submit();
    });
   

  
    $('.btnpay').on('click', function() {

    	 let selectedItems = []; // 전역 변수로 선언

    	 let row = $(this).closest('tr');
  	 
 	   	 let item_id = row.find('.item_id').val();
 	   	 let qty = parseFloat(row.find('.qty-input').val()) 
   	
         console.log("Selected Item ID:", item_id);
         console.log("qty"+qty);
            
             // 체크박스가 체크된 경우
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
        	                    total: discountPriceNum*qty,
        	                    qty: qty
        	                };

        	                selectedItems.push(itemData);
        	                console.log(itemData.discount_price);  //66000
        	                console.log(itemData.cart_price);      //62000
        	                
        	                let userconfirm = confirm("정말로 구매하시겠습니까?");
        	                if (!userconfirm) {
        	                    return; // 사용자가 취소하면 이후 처리를 중단
        	                }
        	                
        	                
        	                // totalPrice를 설정할 때 cart_price가 0이면 discount_price를 사용
        	                let totalPrice = (itemData.cart_price === 0 || itemData.cart_price === undefined) ? itemData.discount_price : (itemData.cart_price || 0);
        	                let totalDiscount = (totalPrice === itemData.discount_price) ? 0 : (totalPrice - itemData.discount_price); // 할인 계산
        	                let finalPrice = totalPrice - totalDiscount; // 최종 가격 계산
							
        	                console.log("11"+totalPrice);
        	                console.log("22"+totalDiscount);
        	                console.log("33"+finalPrice);
        	                // 폼 데이터 설정
        	                $('#productData').val(JSON.stringify({
        	                    items: selectedItems,
        	                    totalPrice: totalPrice*qty,
        	                    totalDiscount: totalDiscount*qty,
        	                    finalPrice:(totalPrice * qty) - (totalDiscount * qty) 
        	                }));

        	                console.log('Product data:', $('#productData').val()); // 디버깅: 전송할 데이터 출력
        	                
        	                let formActionUrl = '/dostorepay?source=cart'; // 실제 소스 값으로 변경
        	                $('#payForm').attr('action', formActionUrl);

        	                console.log("Form action URL:", formActionUrl); // 디버깅: URL 확인
        	                

        	                $('#payForm').submit(); // 폼 제출
        	            } 
        	        }   	       
        	    });

    });

    // 삭제 버튼 클릭 시
    $(document).on('click', '.btndelete', function() {

        let row = $(this).closest('.cart-item');
        let checked = row.find('.item-checkbox').is(':checked');

        let item_id = row.find('.item_id').val();

        if (!checked) {
            alert('체크박스가 선택되지 않았습니다.');
        } else if (checked) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                $.ajax({
                    url: '/deletecart',
                    type: 'POST',
                    data: { item_id: item_id, customer_id: customer_id },
                    dataType: 'text',
                    success: function(data) {
                        if (data === 'ok') {
                            window.location.reload();
                        }
                    }
                });
            }
        }
    });

    // 전체 삭제 버튼 클릭 시
   $('#alldelete').on('click', function() {
    // 선택된 체크박스가 있는지 확인
    let checkedItems = $('.item-checkbox:checked');
    if (checkedItems.length === 0) {
        alert("삭제할 상품을 선택해주세요");
        return;
    }

    // 선택된 아이템의 ID를 수집
    let selectedItems = [];
    checkedItems.each(function() {
        let itemId = $(this).closest('.cart-item').find('.item_id').val();
        selectedItems.push(itemId);
    });

    // AJAX 요청
	    $.ajax({
	        url: '/choicedelete', // 서버 URL
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ item_id: selectedItems }),
	        success: function(response) {
	            let userconfirm=confirm("정말로 삭제하시겠습니까?");
	            
	            if(userconfirm){
					            
	            	window.location.reload(); // 페이지 새로고침
	            	
	            }else {				
	                
	            }
	                                    
	        }    
	    });
   })
})
.on('click','.btnchange',function(){
   let row = $(this).closest('tr');	
   let item_id = row.find('.item_id').val();
   let qty =row.find('.qty-input').val();
   let customer_id=$('#gg').val();

	
   	$.ajax({
		url:'/updatecart',
		type:'post',
		data:{customer_id:customer_id,item_id:item_id,qty:qty},
		dataType:'text',
		success:function(data){
			if(data=='ok'){
			console.log(data);
			alert("수량 저장 되었습니다.");
			 window.location.reload();
			}								
		}
   	 	
   	})    	
})	






</script>
</html>