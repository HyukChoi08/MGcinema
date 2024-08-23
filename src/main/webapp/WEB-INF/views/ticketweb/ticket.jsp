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
.maincontainer {
	width: 1000px;
	
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
    width: 100px;
    max-width: 100px;
}



.seat-selection {
  display: none;
    width: 1000px;
    margin-top: 50px;
    background-color: #f4f4f4;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.seat-row {
  display: flex;
  margin-bottom: 5px;
}

.seat {
  width: 20px;
  height: 20px;
  margin: 2px;
  background-color: #ddd;
  cursor: pointer;
  display: inline-block; 
}

.seat.selected {
  background-color: #6c7ae0;
}

.seat.occupied {
  background-color: #444;
  cursor: not-allowed;
}
.foots {
	width:1000px;
}
.foots-container {
	padding:10px;
	display: flex;
    justify-content: space-between;
}

</style>
</head>
<body>
<div class="maincontainer">
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
    </div>
    <div class="seat-selection" id="seatSelectionScreen">
        <h2>좌석 선택</h2>
        <div class="seatsa">
            <div class="seat" data-seat="A1"></div>
            <div class="seat" data-seat="A2"></div>
            <div class="seat" data-seat="A3"></div>
        </div>
        <div class="seatsb">
        	<div class="seat" data-seat="B1"></div>
        	<div class="seat" data-seat="B2"></div>
        </div>
    </div>
    
    <div class="foots">
    	<div class="foots-container">
		    <div id="confirmBtn" style="display:none;">영화 선택</div>
		    <div>영화정보</div>
		    <div>극장정보</div>
		    <div id="reserveBtn">좌석 선택</div>
		    <div id="submitBtn" style="display:none;">결제 선택</div>
	    </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
    $(document).ready(function() {
    	$(document).on("click","#reserveBtn", function(){
    		$("#selectionScreen").hide();
            $("#seatSelectionScreen").show();
            $("#confirmBtn").show();
            $("#reserveBtn").hide();
            $("#submitBtn").show();
    	});
    	$(document).on("click","#confirmBtn",function(){
    		$("#seatSelectionScreen").hide();
            $("#selectionScreen").show();
            $("#confirmBtn").hide();
            $("#reserveBtn").show();
            $("#submitBtn").hide();
    	});
    	
        $(".seat").click(function () {
            // 이미 예약된 좌석은 선택하지 않음
            if ($(this).hasClass("occupied")) return;
            
            // 선택된 좌석인지 확인
            $(this).toggleClass("selected");
            
            // 선택된 좌석 리스트를 갱신
            updateSelectedSeats();
          });
        $(document).on("click", "#submitBtn", function() {
            let selectedSeats = [];
            $(".seat.selected").each(function() {
                selectedSeats.push($(this).data("seat"));
            });
            let movieId = $("#movieList li.selected").data("id");
            let roomId = $("#theaterList li.selected").text().split("-")[0];
            let date = $("#dateList li.selected").data("id");
            let begin = $("#timeList li.selected").data("id");
            $.ajax({
                type: "POST",
                url: "/reserveSeats",
                contentType: "application/json",
                data: JSON.stringify({
                    seats: selectedSeats,
                    movieId: movieId,
                    theaterId: roomId,
                    date: date,
                    time: begin
                }),
                success: function(response) {
                    alert(response);
                },
                error: function(xhr, status, error) {
                    alert("예매 중 오류가 발생했습니다. 다시 시도해 주세요.");
                }
            });
        });
        
          function updateSelectedSeats() {
            let selectedSeats = [];
            
            $(".seat.selected").each(function () {
              selectedSeats.push($(this).data("seat"));
            });
            
            console.log("Selected Seats: ", selectedSeats);
            // 서버로 선택된 좌석 정보를 전송하거나 다른 작업 수행 가능
          }

          // 초기 예약된 좌석 데이터를 설정합니다 (예시)
          function initializeOccupiedSeats(occupiedSeats) {
            occupiedSeats.forEach(function (seat) {
              $(".seat[data-seat='" + seat + "']").addClass("occupied");
            });
          }

          // 예: 이미 예약된 좌석 리스트 (서버로부터 가져올 수 있음)
          initializeOccupiedSeats(["A1", "B2", "C3"]);
    	
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
                        timeList.append('<li data-id="' +times.begintime+ '">' + times.begintime +'  '+ times.lestseat+ '석</li>');
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