<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container {
    display: flex;
  	flex-direction: column; /* 자식 요소들을 수직으로 배치 */ 
    justify-content: center; 
    padding: 20px;
    width: 1000px; 
    margin: 0 auto;   
}
.cart_step {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
   
}
.cart_step li {
    display: flex;
    align-items: center;
    position: relative;
}
.cart_step div{
    display: block;
    font-size: 16px;
    color: #666;
    margin-bottom: 5px;
    margin-right: 10px; /* STEP과 화살표 사이의 마진 */
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
.cart_step .step.step0,
.cart_step .step.step0::after {
    color: red; /* step0 텍스트와 화살표 색상 */
}

.cart-item {
    display: flex;
    align-items: center;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 10px;
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
    

  .header {
    display: grid;
    grid-template-columns: 100px 1fr 1fr 1fr 100px 100px 100px 100px;
    gap: 10px;
    font-weight: bold;
    margin-bottom: 10px;
}
.cartprice {
    text-decoration: line-through; /* 취소선 추가 */
    color: #888; /* 선택 사항: 취소선 색상 */     
	font-size: 12px;
    color: #888;
    
   
text-decoration: line-through;
    
   
margin-top: 4px;
    
}
.separator {
  
 
border-top: 2px solid #000; /* Adjust color and thickness as needed */
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
}

.width-20 {
    width: 20%;
}
/* tbody의 td 스타일 (기본적으로 thead와 동일하게 유지) */
.foottable tbody td {
    box-sizing: border-box; /* padding과 border를 너비에 포함 */
}
.totalprice {
    position: relative;
    left: 25px; /* 왼쪽으로 이동 */
      /* 위쪽으로 이동 */

}
.finalprice{
	position: relative;
    left: -20px;
     
}
.checkbox{
	position: relative;
    left: 10px; 
  
}
.itemimage{
	position: relative;
    left: -32px; 
    
}

.item-checkbox,.item-images,.item-details
 {
    margin-right: 30px; 
}
.itemtotal{
position: relative;
    left:-15px; 
      
}
.itemselect{
	position: relative;
    left:55px; 
      
}
.itemprice{
	position: relative;
    left:25px;     
}
.itemname{
position: relative;
    left:-50px;     
	width: 100px;

}

.header {
    align-items: center; /* 수직 가운데 정렬 */
    padding: 10px 0; /* 헤더 상하에 여백 추가 */
}
#alldelete{
margin-bottom:40px;
margin-top:40px;

}
.compo{
font-size:11px;
color:grey;
}



</style>
</head>
<body>
<div id="container">
    <div class="cart_step">
       <div class="step step0 active"><span>STEP 01</span>&nbsp;<strong>장바구니</strong></div>
       <div class="step step2"><span>STEP 02</span>&nbsp;<strong>결제하기</strong></div>
       <div class="step step3"><span>STEP 03</span>&nbsp;<strong>결제완료</strong></div>
   </div>
    <div class="cart_details">
        <div class="header">
            <div class="checkbox"><input type="checkbox" id="allcheck"></div>
		    <div class="itemimage">상품이미지</div>
		    <div class="itemname">상품이름</div>
		    <div class="itemprice">판매금액</div>
		    <div class="itemqty">수량</div>
		    <div class="itemtotal">구매금액</div>
		    <div class="itemselect">선택</div>
        </div>
        <c:forEach items="${arCart}" var="cart">
            <div class="cart-item">
            	<div><input type="checkbox" class="item-checkbox"></div>
            	<div class='item-images'>
            	<input type="hidden" class="item_id" value="${cart.item_id}">
       			<input type="hidden" id="gg">             
                <img src="${cart.image_path}" id="imagepath" alt="${cart.item_id}">
                </div>  
                <div class="item-details">
                    <div class="item_name">
	                    <span>${cart.item_name}</span><br>
	                    <span class='compo'>${cart.composition}</span>
                    </div>  
                    <div class="discount">
               			<span class="discount_price">${cart.discount_price}원</span>
			                <c:choose>
			                    <c:when test="${cart.price ne cart.discount_price}">
			                        <span class="cartprice">${cart.price}원</span>
			                    </c:when>
			                </c:choose>
           			</div>
	                <div class="qty">
	            		<input type="number" class="qty-input" style="width:28px;" value="${cart.qty}">
	       			</div>
                    <div class="total">${cart.total}원</div>
                    <div class="choice">
                    <span><input type="button" id="btnpay" value="구매하기"></span>
                    <span><input type="button" class="btndelete" value="삭제하기"></span>
                    </div>
                </div>
            </div>
        </c:forEach>
       <input type="button" id='alldelete' value="선택상품삭제">
   		<table class="foottable"> 
    		<thead class="footthead">
        		<tr>
			        <th class="width-40">총 상품 금액</th>
	                <th class="width-20">할인금액</th>
	                <th class="width-40">총 결제 예정금액</th>
        		</tr>
	    	</thead>
	   		<tbody>
		        <tr>
		     		<td class="totalprice"></td>
		     		<td class="minus">-</td>
		            <td class="totaldiscount"></td>
		         	<td class="equal">=</td>
		            <td class="finalprice"></td>		            
		        </tr>
		      
	    	</tbody>
	    	 <tfoot>
			    <tr class="separator"></tr>
			  
			 </tfoot>
		</table>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function() {
	

	

    function formatNumber(number) {
        return number.toLocaleString();   // 숫자를 쉼표로 포맷
    }

    // 각 줄의 총합을 포맷하고 업데이트합니다.
    function updateRowTotal(item) {
        let discountPriceText = item.find('.discount_price').text().replace(/,/g, '').replace('원', '');
        let qtyInput = item.find('.qty-input'); // 수량 입력 필드 선택
        let qty = parseInt(qtyInput.val()) || 0; // 입력 필드에서 수량 값을 가져오기

        // 숫자로 변환합니다.
        let discountPrice = parseInt(discountPriceText) || 0; // 값이 없으면 0으로 설정

        // 총 금액 계산
        let totalItemPrice = discountPrice * qty;

        // 각 줄의 총합을 포맷하여 업데이트합니다.
        item.find('.total').text(formatNumber(totalItemPrice) + '원');
    }

    function calculateTotal() {
        let totalPrice = 0;
        let totalDiscount = 0;
        let totalPay = 0;

        $('.cart-item').each(function() {
            let item = $(this);

            // 각 줄의 총합을 업데이트
            updateRowTotal(item);

            // 가격과 수량을 가져옵니다.
            let discountPriceText = item.find('.discount_price').text().replace(/,/g, '').replace('원', '');
            let cartPriceText = item.find('.cartprice').text().replace(/,/g, '').replace('원', '');
            let qtyInput = item.find('.qty-input'); // 수량 입력 필드 선택
            let qty = parseInt(qtyInput.val()) || 0; // 입력 필드에서 수량 값을 가져오기

            // 숫자로 변환합니다.
            let discountPrice = parseInt(discountPriceText) || 0; // 값이 없으면 0으로 설정
            let cartPrice = parseInt(cartPriceText) || 0; // 값이 없으면 0으로 설정

            // 총 금액과 할인 금액 계산
            let totalItemPrice = discountPrice * qty;
            let totalItemDiscount = cartPrice > discountPrice ? (cartPrice - discountPrice) * qty : 0;

            totalPrice += totalItemPrice;
            totalDiscount += totalItemDiscount;
            totalPay += totalItemPrice;
        });

        // 테이블의 총합 업데이트
        $('.totalprice').text(formatNumber(totalPrice) + '원');
        $('.totaldiscount').text(formatNumber(totalDiscount) + '원');
        $('.finalprice').text(formatNumber(totalPay) + '원'); // 총 결제 예정 금액
    }

    // 초기 계산
    calculateTotal();

    // 수량 입력 필드의 값이 변경될 때마다 총합 재계산
    $(document).on('input', '.qty-input', function() {
        calculateTotal();
    })

})

.on('click','#allcheck',function(){
	 let checked = $(this).is(':checked');     
     // 모든 '.item-checkbox' 체크박스의 체크 상태를 '#allcheck' 체크박스의 상태와 동일하게 설정
     $('.item-checkbox').prop('checked', checked);
		
})
.on('click','#btnpay',function(){
	
 	
	window.location.href='/storepay';
})
.on('click','.btndelete',function(){
	  	let row = $(this).closest('.cart-item'); // 버튼이 속한 .cart-item div 찾기
        let checked = row.find('.item-checkbox').is(':checked'); // 체크박스 상태 확인
		
        let item_id = row.find('.item_id').val(); // 숨겨진 입력 값 읽어오기
        console.log("item_id"+item_id);
        
        let customer_id=$('#gg').val();   ////////// ====>>>실험용
        
        
        
        console.log(customer_id);
       
        
        if (!checked) { 
            alert('체크박스가 선택되지 않았습니다.'); 
        }else if(checked){
        
     	
        if (confirm("정말로 삭제하시겠습니다?")) { // Corrected alert to confirm
            $.ajax({
                url: '/deletecart',
                type: 'POST',
                data: { item_id: item_id, customer_id: customer_id }, // Fixed typo
                dataType: 'text',
                success: function(data) {
                    if (data === 'ok') {
                    	window.location.reload();
                    } 
                }
           
            })
        }
      }   
        	
})
.on('click', '#alldelete', function() {
    let selectedItems = [];
    $('.item-checkbox:checked').each(function() {
        let itemId = $(this).closest('.cart-item').find('.item_id').val();
        selectedItems.push(itemId);
    });
    console.log('Selected item IDs:', selectedItems);
    console.log('Selected item IDs:', selectedItems[1]);

    
    

});


</script>
</html>