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
		<p>${moviename}</p>
		<p>${roomname}</p>
		<p>${resultprice}</p>
		<p>${runningtime}</p>
		<p>${resultseat}</p>
		<p>${people}</p>
		<p>${begintime}</p>
		<p>${endtime}</p>
		<p>${datetime}</p>
	</div>
    <script>
      main();

      async function main() {
    	  const button = document.getElementById("payment-button");
    	  const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
    	  const tossPayments = TossPayments(clientKey);

    	  const customerKey = "cAg8BbUMvP2EHWtXUraIo";
    	  const widgets = tossPayments.widgets({
    	    customerKey,
    	  });

    	  await widgets.setAmount({
    	    currency: "KRW",
    	    value: ${resultprice},
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
    	      orderName: "${moviename} ${Aticket} ${Yticket}",
    	      successUrl: window.location.origin + "/success?orderId=" + encodeURIComponent("${orderId}") +
    	                  "&uid=" + encodeURIComponent("${uid}") +
    	                  "&moviename=" + encodeURIComponent("${moviename}") +
    	                  "&roomname=" + encodeURIComponent("${roomname}") +
    	                  "&resultprice=" + encodeURIComponent("${resultprice}") +
    	                  "&runningtime=" + encodeURIComponent("${runningtime}") +
    	                  "&resultseat=" + encodeURIComponent("${resultseat}") +
    	                  "&people=" + encodeURIComponent("${people}") +
    	                  "&begintime=" + encodeURIComponent("${begintime}") +
    	                  "&endtime=" + encodeURIComponent("${endtime}") +
    	                  "&datetime=" + encodeURIComponent("${datetime}"),
    	      failUrl: window.location.origin + "/fail",
    	      customerEmail: "${email}",
    	      customerName: "${realname}",
    	      customerMobilePhone: "${mobile}",
    	    });
    	  });
    	}


    </script>
  </body>
</html>
