<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어결제 완료</title>
</head>
<body>
	<h2>결제 성공</h2>
    <div>
        <p>주문 ID: ${param.orderId}</p>
        <p>UID: ${param.uid}</p>
        <p>상품 이름: ${param.itemname}</p>
        <p>총 결제금액: ${param.totalprice}</p>
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