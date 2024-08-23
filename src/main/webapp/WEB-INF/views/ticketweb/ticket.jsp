<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Ticket Reservation</title>
<style>
body {
    display: flex;
    justify-content: center;
    height: 100vh;
    margin: 0;
    text-align: center;
    font-family: Arial, sans-serif;
}

.container {
    width: 1000px;
    margin-top: 50px;
    background-color: #f4f4f4;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.list-container {
    display: flex;
    justify-content: space-between;
}

.list-box {
    width: 22%;
    background-color: #fff;
    border: 1px solid #ddd;
    height: 300px;
    overflow-y: scroll;
    padding: 10px;
}

.list-box ul {
    list-style-type: none;
    padding: 0;
}

.list-box li {
    padding: 8px;
    cursor: pointer;
    border-bottom: 1px solid #ddd;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.list-box li:hover {
    background-color: #eee;
}

.list-box li.selected {
    background-color: #cce5ff;
}

.date-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}

.date-wrapper span {
    width: 50%;
    text-align: left;
}

.date-wrapper .day {
    color: #666;
}

.date-wrapper .date {
    font-weight: bold;
}

.sunday {
    color: red;
}

.saturday {
    color: blue;
}

button {
    padding: 10px;
    margin-top: 20px;
    width: 100%;
    max-width: 200px;
}
</style>
</head>
<body>
    <div class="container" id="selectionScreen">
        <h1>예매</h1> <button id="btnclear">예매 초기화</button>
        <div class="list-container">
            <div class="list-box" id="movieList"><p>영화</p>
                <ul></ul>
            </div>
            <div class="list-box" id="dateList"><p>날짜</p>
                <ul></ul>
            </div>
            <div class="list-box" id="theaterList"><p>극장</p>
                <ul></ul>
            </div>
            <div class="list-box" id="timeList"><p>시간</p>
                <ul></ul>
            </div>
        </div>
        <button id="reserveBtn">좌석 선택</button>
    </div>
    <div class="seat-selection" id="seatSelectionScreen">
        <h2>좌석 선택</h2>
        <div class="seats">
            <!-- 좌석 목록 -->
            <div class="seat" data-seat="A1"></div>
            <div class="seat" data-seat="A2"></div>
            <div class="seat" data-seat="A3"></div>
            <!-- 추가 좌석 -->
        </div>
        <button id="confirmBtn">예매 확인</button>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
    $(document).ready(function() {
    	$("#reserveBtn").click(function() {
            $("#selectionScreen").hide();  // 첫 번째 화면 숨기기
            $("#seatSelectionScreen").show();  // 두 번째 화면 보이기
        });

        // 좌석 클릭 시 선택 상태 토글
        $(".seat").click(function() {
            $(this).toggleClass("selected");
        });

        // "예매 확인" 버튼 클릭 시 첫 번째 화면으로 돌아가기 (선택 유지)
        $("#confirmBtn").click(function() {
            $("#seatSelectionScreen").hide();
            $("#selectionScreen").show();
        });
    	
    	
    	//예매
    	loadMovies();
		loadDates();
        $(document).on("click", "#movieList li", function() {
            $("#movieList li").removeClass("selected");
            $(this).addClass("selected");
            $("#dateList li").removeClass("selected");
            $("#theaterList ul").empty();
            $("#timeList ul").empty();
        });

        $(document).on("click", "#theaterList li", function() {
            $("#theaterList li").removeClass("selected");
            $(this).addClass("selected");
            let movieId = $("#movieList li.selected").data("id");
            let date = $("#dateList li.selected").data("id");
            let roomId = $("#theaterList li.selected").text().split("-")[0];
            console.log(movieId+"--"+date+"--"+roomId)
            $.ajax({
                url: "/times",
                type: "GET",
                data: { movieId:movieId, date:date, roomId:roomId },
                success: function(data) {
                    let timeList = $("#timeList ul");
                    timeList.empty();
                    $.each(data, function(index, times) {
                        timeList.append('<li>' + times.begintime +'  '+ times.lestseat+ '석</li>');
                    });
                }
            });
        });

        $(document).on("click", "#dateList li", function() {
            $("#dateList li").removeClass("selected");
            $(this).addClass("selected");
            let movieId = $("#movieList li.selected").data("id");
            let date = $(this).data("id");
            $("#timeList ul").empty();
            console.log(movieId+"----"+date);
            $.ajax({
                url: "/theaters",
                type: "GET",
                data: { movieId: movieId, date: date },
                success: function(data) {
                    let theaterList = $("#theaterList ul");
                    theaterList.empty();
                    $.each(data, function(index, theater) {
                        theaterList.append('<li>' + theater.sname + "-" + theater.seatlevel + '</li>');
                    });
                }
            });
        });

        $("#reserveBtn").click(function() {
            
        });
    });
    
    //예매
    	$("#btnclear").click(function(){
    		$("#movieList ul").empty();
    		$("#dateList ul").empty();
    		$("#theaterList ul").empty();
    		$("#timeList ul").empty();
    		loadMovies();
    		loadDates();
    	});
function loadMovies() {
	$.ajax({
        url: "/movies",
        type: "GET",
        success: function(data) {
            let movieList = $("#movieList ul");
            movieList.empty();
            $.each(data, function(index, movie) {
                movieList.append('<li data-id="' + movie.id + '">' + movie.mname + '</li>');
            });
        }
    });
}
function loadDates() {
    let dateList = $("#dateList ul");
    dateList.empty();
    
    let currentDate = new Date();
    for (let i = 0; i < 20; i++) {
        let newDate = new Date(currentDate);
        newDate.setDate(currentDate.getDate() + i);

        let dayName = newDate.toLocaleString('ko-KR', { weekday: 'short' });
        let fulldate = newDate.toISOString().split('T')[0];
        let dateString = newDate.toISOString().split('T')[0].split('-');
        let dayClass = (dayName === "토") ? "saturday" : (dayName === "일") ? "sunday" : "";

        dateList.append('<li data-id="'+ fulldate +'" class="' + dayClass + '"><div class="date-wrapper"><span class="day">' + dayName + '</span><span class="date">' + dateString[2] + '</span></div></li>');
    }
}
</script>
</html>