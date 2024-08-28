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
.cart_step ㅑㅇㅍ {
    display: block;
    font-size: 14px;
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


</style>
</head>
<body>
<div id="container">
	  <div class="cart_step">
        <div class="step step0 active"><span>STEP 01</span>&nbsp;<strong>장바구니</strong></div>
        <div class="step step2"><span>STEP 03</span>&nbsp;<strong>결제하기</strong></div>
        <div class="step step3"><span>STEP 04</span>&nbsp;<strong>결제완료</strong></div>
      </div>
      <div class="cart_details">
          
           
      </div>
      <div>
      
      </div>

</div>


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	
	
	
	
	
	
	
	
})



</script>
</html>