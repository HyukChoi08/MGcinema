<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <script src="https://js.tosspayments.com/v2/standard"></script>
    <style>
      #successSave {
        display: none;
      }
    </style>
  </head>
  <body>
    <!-- 결제 UI -->
    <div id="payment-method"></div>
    <!-- 이용약관 UI -->
    <div id="agreement"></div>
    <!-- 결제하기 버튼 -->
    <button class="button" id="payment-button" style="margin-top: 30px">결제하기</button>
	<div id="successSave">
		<p>${orderId}</p>
		<p>${uid}</p>
		<p id="itemname">${itemname}</p>
		<p>${totalprice}</p>>
		 <input type="hidden" id="select" value="${select}">

	</div>
    <script>
  
      main();

      async function main() {

    	    const itemname = document.getElementById("itemname").textContent.trim();
    	    console.log("itemname:", itemname);

    	    // 문자열을 쉼표로 나누어 배열로 변환
    	    const items = itemname.split(',').map(item => item.trim());
    	    console.log("items:", items); // 배열의 내용 확인

    	    // 배열의 첫 번째 항목만 추출
    	    const firstItem = items[0];
    	    console.log("First Item:", firstItem);

    	    // 나머지 상품들을 추출
    	    const remainingItems = items.slice(1).map(item => item.trim()).join(', ');
    	    console.log("Remaining Items:", remainingItems); // 나머지 항목 확인

    	    // orderName 설정
    	    let orderName;
    	    if (remainingItems.trim().length > 0) {
    	        orderName = firstItem + " + 그 외의 상품";
    	    } else {
    	        orderName = firstItem;
    	    }
    	    console.log("Order Name:", orderName);
    	        	    
    	    const select = document.getElementById("select").value.trim();
    	    console.log("select:", select);
    	    
    	    
    	    
    	  
    	  const button = document.getElementById("payment-button");
    	  const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
    	  const tossPayments = TossPayments(clientKey);

    	  const customerKey = "cAg8BbUMvP2EHWtXUraIo";
    	  const widgets = tossPayments.widgets({
    	    customerKey,
    	  });

    	  await widgets.setAmount({
    	    currency: "KRW",
    	    value: ${totalprice}, //총가격 totalprice
    	  });

    	  await Promise.all([
    	    widgets.renderPaymentMethods({
    	      selector: "#payment-method",
    	      variantKey: "DEFAULT",
    	    }),
    	    widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }),
    	  ]);

    	  button.addEventListener("click", async function () {
    	    await widgets.requestPayment({
    	      orderId: "${orderId}",
    	      orderName: orderName,
    	      successUrl: window.location.origin + "/storesuccess?orderId=" + encodeURIComponent("${orderId}") +
    	                  "&uid=" + encodeURIComponent("${uid}") +
	  	                  "&itemname=" + encodeURIComponent("${itemname}") +
    	                  "&totalprice=" + encodeURIComponent("${totalprice}")+
    	                  "&source=" + encodeURIComponent("${source}")+// source 추가
    	                  "&select=" + encodeURIComponent("${select}"),
    	  
    	      failUrl: window.location.origin + "/storefail",
    	      customerEmail: "${email}",
    	      customerName: "${realname}",
    	      customerMobilePhone: "${mobile}",
    	    });
    	  });
    	}


    </script>
  </body>
</html>
