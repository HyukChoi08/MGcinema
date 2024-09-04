<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>결제 성공</title>
</head>
<body>
    <h2>결제 성공</h2>
    <div>
        <p>주문 ID: ${param.orderId}</p>
        <p>UID: ${param.uid}</p>
        <p>영화 이름: ${param.moviename}</p>
        <p>상영관 이름: ${param.roomname}</p>
        <p>결제 금액: ${param.resultprice}</p>
        <p>상영 시간: ${param.runningtime}</p>
        <p>좌석: ${param.resultseat}</p>
        <p>인원 수: ${param.people}</p>
        <p>상영 날짜: ${param.datetime}</p>
        <p>시작 시간: ${param.begintime}</p>
        <p>종료 시간: ${param.endtime}</p>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
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
