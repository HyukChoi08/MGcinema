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
	<h2>결제 성공</h2>
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
    // Ensure saveData is called only once
    if (!window.dataSaved) {
       storeData();
        window.dataSaved = true;
    }
    

    function storeData() {
        let orderId = "${param.orderId}";
        let uid = "${param.uid}";
        let item_name = "${param.itemname}";
        let totalprice = "${param.totalprice}";

        console.log("toto3"+totalprice);
        
        
        $.ajax({
            url: '/storeData',
            type: 'get',
            data: {
                random_id: orderId,
                customer_id: uid,
                item_name: item_name,
                totalprice: totalprice,
            },
            dataType: 'text',
            success: function(data) {
                if (data == 'ok') {        
                    return;
                }
            }
        });
    }  	
  })
          








</script>
</html>