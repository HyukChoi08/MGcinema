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
  	background-color:black;
  	margin-bottom: 335px;
  
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
.cart_step .step.step1,
.cart_step .step.step1::after {
    color: red; /* step0 텍스트와 화살표 색상 */
}

.cart-item {
    display: flex;
     align-items: center; /* 세로 중앙 정렬 */
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 10px;
    
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
  .header {
    display: grid;
    grid-template-columns: 100px 1fr 1fr 1fr 100px 100px 100px 100px;
    gap: 10px;
    font-weight: bold;
    margin-bottom: 10px;
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
.cartprice{
	text-decoration: line-through;
    color:grey; 

}
</style>
</head>
<body>
<div id="container">
 	<div class="cart_step">
       <div class="step step1 active"><span>STEP 01</span>&nbsp;<strong>장바구니</strong></div>
       <div class="step step2"><span>STEP 02</span>&nbsp;<strong>결제하기</strong></div>
       <div class="step step3"><span>STEP 03</span>&nbsp;<strong>결제완료</strong></div>
   </div>
    <div class="cart_details">
        <table class="cart-table">
            <thead>
                <tr class="header">
                    <th><input type="checkbox" id="allcheck"></th>
                    <th>상품이미지</th>
                    <th>상품이름</th>       
                    <th>판매금액</th>        
                    <th>수량</th>
                    <th>구매금액</th>
                    <th>선택</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${arCart}" var="cart">
                    <tr class="cart-item">
                        <td><input type="checkbox" class="item-checkbox"></td>
                        <td>
                            <input type="hidden" class="item_id" value="${cart.item_id}">
                            <input type="text" id="gg" value="${uid}">             
                            <img src="${cart.image_path}" id="imagepath" alt="${cart.item_id}">
                        </td>  
                        <td class="item-details">
                            <div class="item_name">
                                <span>${cart.item_name}</span><br>
                                <span>${cart.composition}</span>
                            </div>  
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
                            <input type="number"  min="1" class="qty-input" style="width:50px;" value="${cart.qty}">
                        </td>
                        <td class="total">${cart.total}</td>
                        <td class="choice">
                            <input type="button" id="btnpay" value="구매하기">
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
          <form id="payForm" action="/dostorepay" method="post">
            <input type="hidden" id="productData" name="productData">
            <button type="button" id="pay">결제하기</button>
        </form>

    </div> 
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function() {
    function formatNumber(number) {
        return number.toLocaleString(); // 숫자를 쉼표로 포맷
    }

    function calculateItemTotal(item) {
        let qtyInput = item.find('.qty-input');
        let qty = parseInt(qtyInput.val()) || 0;
        let discountPriceText = item.find('.discount_price').text().replace(/,/g, '').replace('원', '');
        let cartPriceText = item.find('.cartprice').text().replace(/,/g, '').replace('원', '');

        let discountPrice = parseInt(discountPriceText) || 0;
        let cartPrice = parseInt(cartPriceText) || 0;

        let totalItemPrice = discountPrice * qty;

        // Update total price for this item
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
                finalPrice = totalPrice - totalDiscount; // 이 부분을 재확인
            }
        });

        $('.totalprice').text(formatNumber(totalPrice) + '원');
        $('.totaldiscount').text(formatNumber(totalDiscount) + '원');
        $('.finalprice').text(formatNumber(finalPrice) + '원');

        return { totalPrice, totalDiscount, finalPrice };
    }

    function formatExistingTotal() {
        // 기존의 totalprice 값을 천 단위로 포맷
        $('.total').each(function() {
            let $this = $(this);
            let text = $this.text().replace(/,/g, '').replace('원', ''); // '원' 및 기존 쉼표 제거
            let number = parseInt(text, 10); // 숫자로 변환
            if (!isNaN(number)) {
                $this.text(formatNumber(number) + '원'); // 포맷 후 다시 텍스트로 설정
            }
        });
    }

    formatExistingTotal(); // 추가된 부분

    $(document).on('input change', '.qty-input, .item-checkbox', function() {
        // Update item total
        let item = $(this).closest('.cart-item');
        calculateItemTotal(item);
        
        // Update overall total
        calculateTotal();
    });

    $('#allcheck').on('click', function() {
        let checked = $(this).is(':checked');
        $('.item-checkbox').prop('checked', checked);
        calculateTotal();
    });

    $('#pay').on('click', function() {
        let selectedItems = [];
        let totals = calculateTotal(); // 총합 계산 및 반환

        console.log('Calculated totals:', totals); // 디버깅: 총합 객체 출력

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

        console.log('Product data:', $('#productData').val()); // 디버깅: 전송할 데이터 출력

        $('#payForm').submit(); // 폼 제출
    });

    // 결제 버튼 클릭 시
    $('#btnpay').on('click', function() {
        window.location.href = '/storepay';
    });

    // 삭제 버튼 클릭 시
    $(document).on('click', '.btndelete', function() {
        let row = $(this).closest('.cart-item'); // 버튼이 속한 .cart-item div 찾기
        let checked = row.find('.item-checkbox').is(':checked'); // 체크박스 상태 확인

        let item_id = row.find('.item_id').val(); // 숨겨진 입력 값 읽어오기
        let custom_id = $('#gg').val(); // 실험용

        if (!checked) { 
            alert('체크박스가 선택되지 않았습니다.'); 
        } else if (checked) {
            if (confirm("정말로 삭제하시겠습니까?")) {
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
                });
            }
        }
    });

    // 전체 삭제 버튼 클릭 시
    $('#alldelete').on('click', function() {
        let selectedItems = [];
        $('.item-checkbox:checked').each(function() {
            let itemId = $(this).closest('.cart-item').find('.item_id').val();
            selectedItems.push(itemId);
        });

        $.ajax({
            url: 'choicedelete',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ item_id: selectedItems }),
            success: function(data) {
                alert('삭제가 성공되었습니다.');
                window.location.reload();
            }
        });
    });
});











</script>
</html>