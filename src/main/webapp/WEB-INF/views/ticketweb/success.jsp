<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>결제 성공</title>
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
</head>
<body>
    <div class="container">
        <div class="success-icon">✔️</div>
        <h2>결제 성공!</h2>
<%--         <div class="info"><span>주문 ID:</span> ${param.orderId}</div> --%>
        <div class="info"><span>UID:</span> ${param.uid}</div>
        <div class="info"><span>영화 이름:</span> ${param.moviename}</div>
        <div class="info"><span>상영관 이름:</span> ${param.roomname}</div>
        <div class="info"><span>결제 금액:</span> ${param.resultprice} 원</div>
        <div class="info"><span>상영 시간:</span> ${param.runningtime}</div>
        <div class="info"><span>좌석:</span> ${param.resultseat}</div>
        <div class="info"><span>인원 수:</span> ${param.people}</div>
        <div class="info"><span>상영 날짜:</span> ${param.datetime}</div>
        <div class="info"><span>시작 시간:</span> ${param.begintime}</div>
        <div class="info"><span>종료 시간:</span> ${param.endtime}</div>
        <div class="btnclose">화면 닫기</div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).on("click",".btnclose",function(){
	window.close();
})

$(document).ready(function() {
    // Ensure saveData is called only once
    if (!window.dataSaved) {
        saveData();
        window.dataSaved = true;
    }

    function saveData() {
        let orderId = "${param.orderId}";
        let uid = "${param.uid}";
        let moviename = "${param.moviename}";
        let roomname = "${param.roomname}";
        let price = "${param.resultprice}";
        let runningtime = "${param.runningtime}";
        let seat = "${param.resultseat}";
        let people = "${param.people}";
        let begintime = "${param.begintime}";
        let endtime = "${param.endtime}";
        let datetime = "${param.datetime}";

        $.ajax({
            url: '/saveData',
            type: 'get',
            data: {
                random_id: orderId,
                customer_id: uid,
                movie_name: moviename,
                room_name: roomname,
                totalprice: price,
                runningtime: runningtime,
                seat: seat,
                totalpeople: people,
                begintime: begintime,
                endtime: endtime,
                datetime: datetime
            },
            dataType: 'text',
            success: function(data) {
                if (data == 'ok') {
                    console.log("결제완료");
                    return;
                }
            }
        });
        
        $.ajax({
        	url: '/changeSeat',
        	type: 'get',
        	data: {
        		movie_name: moviename,
        		room_name: roomname,
        		moviedate: datetime,
        		begintime: begintime,
        		people: people
        	}
        });
    }
});

</script>
</html>
