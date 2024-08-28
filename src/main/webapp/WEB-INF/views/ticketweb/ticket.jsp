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

#button {
    padding: 3px;
    margin-top: 20px;
    width: 90px;
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
  justify-content: center;
}

.seat {
  width: 15px;
  height: 15px;
  margin: 1px;
  margin-top: 4px;
  background-color: #ddd;
  cursor: pointer;
  display: inline-block;
  font-size:10px;
  background-color:#666666;
  color:#ffffff;
  text-align:center;
}

.seat.selected {
  background-color: #6c7ae0;
}

.seat.occupied {
  background-color: #bbbbbb;
  cursor: not-allowed;
  color:#ffffff;
}
.foots {
	width:1000px;
}
.foots-container {
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
#btnclear {
    margin-left: 90%;
}
#seatinfo {
	display: none;
}
.additional-info {
	display: flex;
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
    <div id="seatinfo">
    	<p id="theaterInfo"></p>
    	<p id="movieTime"></p>
    	<p id="personInfo"></p>
    	<div class="additional-info">
    		<p>일반</p>
            <button class="number-button" onclick="selectTicket('adult', 0)">0</button>
            <button class="number-button" onclick="selectTicket('adult', 1)">1</button>
            <button class="number-button" onclick="selectTicket('adult', 2)">2</button>
            <button class="number-button" onclick="selectTicket('adult', 3)">3</button>
            <button class="number-button" onclick="selectTicket('adult', 4)">4</button>
        </div>
        <div class="additional-info">
        	<p>청소년</p>
            <button class="number-button" onclick="selectTicket('youth', 0)">0</button>
            <button class="number-button" onclick="selectTicket('youth', 1)">1</button>
            <button class="number-button" onclick="selectTicket('youth', 2)">2</button>
            <button class="number-button" onclick="selectTicket('youth', 3)">3</button>
            <button class="number-button" onclick="selectTicket('youth', 4)">4</button>
        </div>
	</div>
    <div class="seat-selection" id="seatSelectionScreen">
        
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

    let totalTickets = 0;
    let adultTicketCount = 0;
    let youthTicketCount = 0;


    function selectTicket(type, count) {
        if (type === 'adult') {
            totalTickets -= adultTicketCount;
            adultTicketCount = count;
            totalTickets += adultTicketCount;
        } else if (type === 'youth') {
            totalTickets -= youthTicketCount;
            youthTicketCount = count;
            totalTickets += youthTicketCount;
        }

        // 최대 선택 가능 좌석 수를 초과하면 알림 표시
        if ($(".seat.selected").length > totalTickets) {
            alert("선택된 티켓 수만큼만 좌석을 선택할 수 있습니다.");
            // 마지막 선택을 해제하거나 추가 조치를 수행할 수 있음
            $(".seat.selected").last().removeClass("selected");
        }

        console.log("Total Tickets: ", totalTickets);
    }

    $(document).on("click","#reserveBtn", function(){
        let mname = $("#movieList li.selected").text();
        let roomId = $("#theaterList li.selected").text().split("-")[0];
        let date = $("#dateList li.selected").data("id");
        let begin = $("#timeList li.selected").data("id");
        let lestseat = $("#timeList li.selected").text().split("  ")[1];
        let allseat = $("#timeList li.selected").data("alls");
        let day = $("#dateList li.selected .day").text();
        let begintime = $("#timeList li.selected").text().split("  ")[0];
        let endtime = $("#timeList li.selected").attr("title");
        if(mname == "") {
            alert("영화를 선택해주세요");
            return;
        }
        if(date == "" || date == null) {
            alert("날짜를 선택해주세요");
            return;
        }
        if(roomId == "") {
            alert("극장을 선택해주세요");
            return;
        }
        if(begin == "" || begin == null) {
            alert("시간을 선택해주세요");
            return;
        }
        
        $("#theaterInfo").text(roomId + " " + lestseat + "/" + allseat + "석");
        $("#movieTime").text(date + "("+ day + ")" + begintime + " ~ " + endtime);
        $("#personInfo").text("최대인원 4명 선택 가능");
        
        $("#selectionScreen").hide();
        $("#seatSelectionScreen").show();
        $("#seatinfo").show();
        $("#confirmBtn").show();
        $("#reserveBtn").hide();
        $("#submitBtn").show();
        let theaterId = roomId;
        $.ajax({
            type: "GET",
            url: "/seats",
            data: { theaterId: theaterId },
            success: function(response) {
                const seatsData = response.seats[0];
                $(".seat-selection").empty();

                // 좌석 키(열 이름)를 알파벳 순으로 정렬합니다.
                const sortedSeatKeys = Object.keys(seatsData).filter(key => key.match(/^[a-z]$/)).sort();

                sortedSeatKeys.forEach(key => {
                    const value = seatsData[key];
                    
                    if (value > 0) {
                        const rowDiv = $("<div></div>").addClass("seat-row").attr("data-row", key);

                        // 행 레이블을 추가합니다.
                        const labelDiv = $("<div></div>").addClass("seat-row-label").text(key.toUpperCase()+"열-");
                        rowDiv.append(labelDiv);

                        for (let i = 1; i <= value; i++) {
                            const seatId = key + i; // 예: "a1", "a2"
                            const seatDiv = $("<div></div>").addClass("seat").attr("data-seat", seatId).text(i);
                            rowDiv.append(seatDiv);
                        }
                        $(".seat-selection").append(rowDiv);
                    }
                });
                initializeOccupiedSeats(["a1", "b2", "c3"]);
            },
            error: function(xhr, status, error) {
                console.error("좌석 정보를 가져오는 중 오류 발생:", error);
            }
        });
    });

    $(document).on("click", "#confirmBtn", function() {
        $("#seatSelectionScreen").hide();
        $("#seatinfo").hide();
        $("#selectionScreen").show();
        $("#confirmBtn").hide();
        $("#reserveBtn").show();
        $("#submitBtn").hide();
        $(".seat").removeClass("selected");
    });


    $(document).on("click", ".seat", function () {
        if ($(this).hasClass("occupied")) return;
        

        if ($(".seat.selected").length < totalTickets || $(this).hasClass("selected")) {
            $(this).toggleClass("selected");
            updateSelectedSeats();
        } else {
            alert("선택된 티켓 수만큼만 좌석을 선택할 수 있습니다.");
        }
    });

    // 선택된 좌석 업데이트 함수
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
        $(".seat").removeClass("occupied");
        occupiedSeats.forEach(function (seat) {
            $(".seat[data-seat='" + seat + "']").addClass("occupied");
        });
    }

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
                    timeList.append('<li data-alls="' +times.allseat + '" data-id="' +times.begintime+ '" title="' +times.endtime + '">' + times.begintime +'  '+ times.lestseat+ '석</li>');
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

    $(document).on("click", "#timeList li", function() {
        $("#timeList li").removeClass("selected");
        $(this).addClass("selected");
    });

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

});
</script>
</html>