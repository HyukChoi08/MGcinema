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







/* 기존 스타일 유지 */
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
}
.cart_step {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.cart_step div {
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
.cart_step .step.active strong, .cart_step .step.step2 {
    color: red; /* 활성 단계의 색상 */
}
.cart_step .step:not(:last-child)::after {
    content: '>';
    display: inline-block;
    margin: 0 10px; /* 화살표의 좌우 간격 */
    font-size: 20px;
    color: #666;
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
.cart-item img {
    max-width: 100px;
    margin-right: 20px;
}
.item-details {
    display: flex;
    flex: 1;
    justify-content: space-between;
}
.item-details div {
    margin-right: 20px;
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
.separator {
    width: 100%;
    height: 2px;
    background-color: black;
    margin-bottom: 20px;
}
.foottable {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
}
.foottable thead {
    display: block;
}
.foottable tbody {
    display: block;
    overflow-x: auto;
}
.foottable thead th {
    background-color: #f4f4f4;
}
.foottable tbody tr {
    display: flex;
    justify-content: space-between;
}
.foottable tbody td {
    width: 33%;
}
.foottable th, .foottable td {
    text-align: center;
    padding: 10px;
    box-sizing: border-box;
}
.foottable thead {
    width: 100%;
}
.width-40 {
    width: 10%;
}
.width-20 {
    width: 20%;
}
.foottable tbody td {
    box-sizing: border-box;
}
.cartprice {
    text-decoration: line-through;
    color: grey;
}
.cart-table {
    width: 100%;
    border-collapse: collapse;
}
.cart-table td {
    text-align: left;
    margin-right: 50px;
}
.cart_price {
    text-decoration: line-through; /* 취소선 추가 */
    color:grey;
}
</style>
</head>
<body>
<div id="container">
    <div class="cart_step">
        <div class="step step1"><span>STEP 01</span>&nbsp;<strong>장바구니</strong></div>
        <div class="step step2 active"><span>STEP 02</span>&nbsp;<strong>결제하기</strong></div>
        <div class="step step3"><span>STEP 03</span>&nbsp;<strong>결제완료</strong></div>
    </div>
    <div class="cart_details">
        <table class="cart-table">
            <thead>
                <tr class="header">
                    <th>상품이미지</th>
                    <th>상품이름</th>
                    <th>판매금액</th>
                    <th>수량</th>
                    <th>구매금액</th>
                    <th>선택</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${items}" var="item">
                    <tr class="cart-item">
                        <td>
                            <input type="hidden" class="item_id" value="${item.item_id}">
                            <img src="${item.image_path}" id="imagepath" alt="${item.item_id}">
                        </td>
                        <td class="item-details">
                            <div class="item_name">
                                <span>${item.name}</span><br>
                                <span>${item.composition}</span>
                            </div>
                        </td>
                        <td>
                            <div class="discount">
                                <span class="discount_price">${item.discount_price}원</span>
                                <span class="cart_price">${item.cart_price}</span>
                            </div>
                        </td>
                        <td class="qty">${item.qty}개</td>
                        <td class="total">${item.total}원</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="separator"></div>
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
                    <td class="totalprice">${totalPrice}원</td>
                    <td class="minus">-</td>
                    <td class="totaldiscount">${totalDiscount}원</td>
                    <td class="equal">=</td>
                    <td class="finalprice">${finalPrice}원</td>
                </tr>
            </tbody>
            <tfoot>
                <tr class="separator"></tr>
            </tfoot>
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function() {
    function formatNumber(number) {
        return number.toLocaleString();
    }

    function removeCommas(value) {
        return value.replace(/,/g, '');
    }

    // Format the numbers for display
    $('.discount_price, .cart_price, .total, .totalprice, .totaldiscount, .finalprice').each(function() {
        let $this = $(this);
        let text = $this.text().replace('원', '').replace(/,/g, '');
        let price = parseInt(text, 10);

        if (!isNaN(price)) {
            $this.text(formatNumber(price) + '원');
        }
    });

    // Compare discount_price and cart_price and hide cart_price if they are the same
    $('.cart-item').each(function() {
        var $discountPrice = $(this).find('.discount_price');
        var $cartPrice = $(this).find('.cart_price');

        // Get the text values and remove '원' and commas
        var discountPriceText = removeCommas($discountPrice.text().replace('원', ''));
        var cartPriceText = removeCommas($cartPrice.text().replace('원', ''));

        // Compare the prices
        if (discountPriceText === cartPriceText) {
            $cartPrice.hide(); // Hide cart price if they are the same
        }
    });
});
</script>
</body>
</html>