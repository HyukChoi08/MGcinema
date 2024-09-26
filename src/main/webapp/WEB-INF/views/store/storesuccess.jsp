<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어결제 완료</title>
</head>
 <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 600px;
            width: 100%;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
            font-size: 2em;
        }
        .success-icon {
            text-align: center;
            font-size: 50px;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .info {
            margin-bottom: 10px;
            font-size: 1.1em;
        }
        .info span {
            font-weight: bold;
            color: #333;
        }
        .btnclose {
            display: block;
            text-align: center;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor:pointer;
        }
        .btnclose:hover {
            background-color: #45a049;
        }
    </style>
<body>
    <div class="container">
        <div class="success-icon">✔️</div>
        <h2>결제 성공!</h2>
<%--         <div class="info"><span>주문 ID:</span> ${param.orderId}</div> --%>
        <div class="info"><span>UID:</span> ${param.uid}</div>
        <div class="info"><span>상품 이름:</span> ${param.itemname}</div>   
        <div class="info"><span>결제 금액:</span> ${param.totalprice} 원</div>
       
        <div class="btnclose">화면 닫기</div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function() {
    // Ensure storeData is called only once
    if (!window.dataSaved) {
        storeData();
        
        window.dataSaved = true;
    }
    
    function storeData() {
        // Extract URL parameters
        let urlParams = new URLSearchParams(window.location.search);
        let source = urlParams.get('source');
        let orderId = urlParams.get('orderId');
        let uid = urlParams.get('uid');
        let item_name = urlParams.get('itemname');
        let totalprice = urlParams.get('totalprice');
        let select = urlParams.get('select');

        console.log("totalprice: " + totalprice);
        console.log("source: " + source);
        console.log("uid: " + uid);
        console.log("select: " + select);

        // Send store data
        $.ajax({
            url: '/storeData',
            type: 'GET', // Use GET method
            data: {
                random_id: orderId,
                customer_id: uid,
                item_name: item_name,
                totalprice: totalprice,
            },
            dataType: 'text',
            success: function(data) {
                if (data === 'ok') {
                    console.log('storeData 성공');
                    
                    
                   } 
            	} 
                    
            }) 
                    // Clear cart if source is 'cart'
             if (source === 'cart') {
                 $.ajax({
                     url: '/clearcart',
                     type: 'POST',
                     data: { customer_id: uid,select: select },
                     dataType:'text',
                     success: function(data) {
                         if (data === "ok") {
                             console.log('장바구니가 비워졌습니다.');
                             // Redirect to storesuccess after clearing cart
                             //window.location.href = '/storesuccess?' +
                              //   'orderId=' + encodeURIComponent(orderId) +
                               //  '&uid=' + encodeURIComponent(uid) +
                               //  '&itemname=' + encodeURIComponent(item_name) +
                               //  '&totalprice=' + encodeURIComponent(totalprice) +
                                // '&source=' + encodeURIComponent(source);
                         }
                     }
                  
                 })
             }                        
       
    }
})
.on('click', '.btnclose', function() {
    // 팝업창을 닫기
    window.close(); // 팝업창을 닫기

    // 기존 페이지를 store로 이동
    window.opener.location.href = '/payment';
});       
            
</script>
</html>