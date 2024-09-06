<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Ticket Reservation</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ticket_css/styles.css">
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div class="maincontainer">
    <div class="container" id="selectionScreen">
        <h1>영화 예매</h1> <div id="btnclear">예매 초기화</div>
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
        <div class="peradult">
            <span class="pern">일반</span>
            <ul id="adultpernum">
                <li data-count="0" data-type="adult">0</li>
                <li data-count="1" data-type="adult">1</li>
                <li data-count="2" data-type="adult">2</li>
                <li data-count="3" data-type="adult">3</li>
                <li data-count="4" data-type="adult">4</li>
            </ul>
        </div>
        <div class="peryouth">
            <span class="pern">청소년</span>
            <ul id="youthpernum">
                <li data-count="0" data-type="youth">0</li>
                <li data-count="1" data-type="youth">1</li>
                <li data-count="2" data-type="youth">2</li>
                <li data-count="3" data-type="youth">3</li>
                <li data-count="4" data-type="youth">4</li>
            </ul>
        </div>
    </div>
    <div class="seat-selection" id="seatSelectionScreen">
        <!-- 좌석 선택 화면 -->
    </div>
    
    <div class="foots">
        <div id="lastinfo" class="foots-container">
            <div id="confirmBtn" style="display:none;" class="button-container">
            	<div class="arrow-icon-b">➔</div>
        		<div class="button-text">영화 선택</div>
        	</div>
            <div id="movieimage"></div>
            <div id="movieresult">영화 정보</div>
            <div id="roomresult">극장 정보</div>
            <div id="seatresult">좌석 선택</div>
            <div id="priceresult">결제 정보</div>
            <div id="reserveBtn" class="button-container">
            	<div class="arrow-icon-a">➔</div>
        		<div class="button-text">좌석선택</div>
        	</div>
            <div id="submitBtn" style="display:none;" class="button-container">
            	<div class="arrow-icon-a">➔</div>
        		<div class="button-text">결제이동</div>
        	</div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

let totalTickets = 0;
let adultTicketCount = 0;
let youthTicketCount = 0;
let alltotal = 0;
let getmname = "${mname}".trim();
let getdate = "${date}".trim();
let getroom = "${room}".trim();
let gettime = "${time}".trim();
let allseat = "";

$(document).ready(function() {
// 	let takemname = "${mname}";
// 	let takedate = "${date}";
// 	let takeroom = "${room}";
// 	let taketime = "${time}";
// 	loadMovieData();
	
	$(document).on("click","#adultpernum li", function(){
		let type = $(this).data("type");
		let count = $(this).data("count");
		
		$("#adultpernum li").removeClass("selected");
        $(this).addClass("selected");
		
		if (type === 'adult') {
	        totalTickets -= adultTicketCount;
	        adultTicketCount = count;
	        totalTickets += adultTicketCount;
	    } else if (type === 'youth') {
	        totalTickets -= youthTicketCount;
	        youthTicketCount = count;
	        totalTickets += youthTicketCount;
	    }
	    
	    if ($(".seat.selected").length > totalTickets) {
	        alert("선택된 티켓 수만큼만 좌석을 선택할 수 있습니다.");
	        // 마지막 선택을 해제하거나 추가 조치를 수행할 수 있음
	        $(".seat.selected").removeClass("selected");
	    }
	    
	    $("#seatresult").text("좌석 정보");
	    let seatresult = $("#seatresult");
        seatresult.append("<p>인원" + totalTickets + "</p>");
        
	})
	$(document).on("click","#youthpernum li", function(){
		let type = $(this).data("type");
		let count = $(this).data("count");
		
		$("#youthpernum li").removeClass("selected");
        $(this).addClass("selected");
		
		if (type === 'adult') {
	        totalTickets -= adultTicketCount;
	        adultTicketCount = count;
	        totalTickets += adultTicketCount;
	    } else if (type === 'youth') {
	        totalTickets -= youthTicketCount;
	        youthTicketCount = count;
	        totalTickets += youthTicketCount;
	    }
	    
	    if ($(".seat.selected").length > totalTickets) {
	        alert("선택된 티켓 수만큼만 좌석을 선택할 수 있습니다.");
	        
	        $(".seat.selected").removeClass("selected");
	    }
	    
	    $("#seatresult").text("좌석 정보");
	    let seatresult = $("#seatresult");
        seatresult.append("<p>인원" + totalTickets + "</p>");
	})
	
	$(document).on("click","#adultpernum li, #youthpernum li", function(){
		alltotal = 0;
		 $("#priceresult").text();
	        let priceresult = $("#priceresult");
	        let movieId = $("#movieList li.selected").data("id");
	        let roomId = $("#theaterList li.selected").text().split("-")[0];
	        let moviedate = $("#dateList li.selected").data("id");
	        let begintime = $("#timeList li.selected").text().split("  ")[0];
	        $.ajax({
	            url: "/totalprice",
	            type: "GET",
	            data: { movieId:movieId, roomId:roomId, moviedate:moviedate, begintime:begintime },
	            success: function(data) {
	                priceresult.empty();
	                let ayid = data[0].id;
	                let aprice = data[0].a_price;
	                let yprice = data[0].y_price;
	                let totala = (aprice*adultTicketCount);
	                let totaly = (yprice*youthTicketCount);
	                alltotal = totala + totaly;
	                if(adultTicketCount != 0) {
	                priceresult.append('<p data-id="' + ayid + '" data-price="' + aprice + '">일반' + aprice + 'X' + adultTicketCount + '</p>');
	                priceresult.append('<p data-totala="' + totala + '">' + totala + '</p>');
	                };
	                if(youthTicketCount != 0) {
	                priceresult.append('<p data-id="' + ayid + '" data-price="' + yprice + '">청소년' + yprice + 'X' + youthTicketCount + '</p>');
	                priceresult.append('<p data-totaly="' + totaly + '">' + totaly + '</p>');
	                };
	            }
	        });
	})

    $(document).on("click", "#reserveBtn", function() {
    	var sessionUid = '${sessionScope.uid}';
    	if(!sessionUid || sessionUid.trim() === '') {
    		if (confirm("로그인페이지로 이동하시겠습니까?")) {
    			window.location.href = "/login?redirect=ticket";
        		return;
    		} else {
    		    return;
    		}
    	}
	    let mname = $("#movieList li.selected").text();
	    let roomId = $("#theaterList li.selected").text().split("-")[0];
	    let date = $("#dateList li.selected").data("id");
	    let begin = $("#timeList li.selected").data("id");
	    let lestseat = $("#timeList li.selected").text().split("  ")[1];
	    let timetype = $("#timeList li.selected").text().split("  ")[2];
	    let allseat = $("#timeList li.selected").data("alls");
	    let day = $("#dateList li.selected .day").text();
	    let begintime = $("#timeList li.selected").text().split("  ")[0];
	    let endtime = $("#timeList li.selected").attr("title");
	    let moviename = $("#movieList li.selected").data("name");
	    
	    if (mname == "") {
	        alert("영화를 선택해주세요");
	        return;
	    }
	    if (date == "" || date == null) {
	        alert("날짜를 선택해주세요");
	        return;
	    }
	    if (roomId == "") {
	        alert("극장을 선택해주세요");
	        return;
	    }
	    if (begin == "" || begin == null) {
	        alert("시간을 선택해주세요");
	        return;
	    }
	    
	    $("#theaterInfo").text(roomId + " " + lestseat + "/" + allseat + "석" + " " + timetype);
	    $("#movieTime").text(date + " (" + day + ")" + begintime + " ~ " + endtime);
	    $("#personInfo").text("최대인원 8명 선택 가능");
	    
	    $("#selectionScreen").hide();
	    $("#seatSelectionScreen").show();
	    $("#seatinfo").show();
	    $("#confirmBtn").show();
	    $("#reserveBtn").hide();
	    $("#submitBtn").show();
	    
	    $.ajax({
	        type: "GET",
	        url: "/seats",
	        data: { theaterId: roomId },
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
	                    const labelDiv = $("<div></div>").addClass("seat-row-label").text(key.toUpperCase() + "열-");
	                    rowDiv.append(labelDiv);
	
	                    for (let i = 1; i <= value; i++) {
	                        const seatId = key + i; // 예: "a1", "a2"
	                        const seatDiv = $("<div></div>").addClass("seat").attr("data-seat", seatId).text(i);
	                        rowDiv.append(seatDiv);
	                    }
	                    $(".seat-selection").append(rowDiv);
	                }
	            });
	            $.ajax({
	                type: "GET",
	                url: "/occupiedSeats",
	                data: {
	                    movieName: moviename,
	                    roomName: roomId,
	                    beginTime: begintime,
	                    dateTime: date
	                },
	                success: function(response) {
	                    const occupiedSeats = response;
	                    const allOccupiedSeats = [];
	                    occupiedSeats.forEach(group => {
	                        allOccupiedSeats.push(...group.split(' '));
	                    });
	
	                    $(".seat").each(function() {
	                        const seatId = $(this).data("seat");
	                        if (allOccupiedSeats.includes(seatId)) {
	                            $(this).addClass("occupied").text("X");
	                            $(this).off("click");
	                        }
	                    });
	                },
	                error: function(xhr, status, error) {
	                    console.error("예약된 좌석 정보를 가져오는 중 오류 발생:", error);
	                }
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error("좌석 정보를 가져오는 중 오류 발생:", error);
	        }
	    });
	    $("#seatresult").text("좌석 정보");
	});

    $(document).on("click", "#confirmBtn", function() {
        $("#seatSelectionScreen").hide();
        $("#seatinfo").hide();
        $("#selectionScreen").show();
        $("#confirmBtn").hide();
        $("#reserveBtn").show();
        $("#submitBtn").hide();
        $(".seat").removeClass("selected");
        $("#adultpernum li").removeClass("selected");
        $("#youthpernum li").removeClass("selected");
        totalTickets = 0;
        adultTicketCount = 0;
        youthTicketCount = 0;
        $("#priceresult").text("결제 정보");
        $("#seatresult").text("좌석 선택");
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
        allseat= "";
        $(".seat.selected").each(function () {
            selectedSeats.push($(this).data("seat"));
        });
        
        for(let i=0; i<selectedSeats.length;i++) {
        	allseat += selectedSeats[i] + " ";
        };
        
        
        $("#seatresult").text("좌석 정보");
	    let seatresult = $("#seatresult");
        seatresult.append("<p>인원" + totalTickets + "</p>");
        seatresult.append("<p>좌석 번호" + allseat.trim() + "</p>");
        
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
    	if(totalTickets == 0 || allseat == "") {
    		alert("좌석을 선택해주세요");
    		return;
    	}
    	let moviename =$("#movieList li.selected").data("name");
    	let Aticket = "일반 - " + adultTicketCount + "매";
    	let Yticket = "청소년 - " + youthTicketCount + "매";
    	let resultprice = alltotal;
    	let resultseat = allseat.trim();
    	let roomname = $("#theaterList li.selected").text().split("-")[0];
    	let people = totalTickets;
    	let begintime = $("#timeList li.selected").data("id");
    	let endtime = $("#timeList li.selected").attr("title");
    	let runningtime = $("#movieList li.selected").data("time");
    	let datetime = $("#dateList li.selected").data("id");
    	
    	let seatcheck = [];
    	$(".seat.selected").each(function () {
            seatcheck.push($(this).data("seat"));
        });
    	if(seatcheck.length < totalTickets) {
    		alert("좌석을 인원수만큼 선택해주세요")
    		return;
    	}
    	
    	moviename = encodeURIComponent(moviename);
        Aticket = encodeURIComponent(Aticket);
        Yticket = encodeURIComponent(Yticket);
        resultprice = encodeURIComponent(resultprice);
        resultseat = encodeURIComponent(resultseat);
        roomname = encodeURIComponent(roomname);
        people = encodeURIComponent(people);
        begintime = encodeURIComponent(begintime);
        endtime = encodeURIComponent(endtime);
        runningtime = encodeURIComponent(runningtime);
        datetime = encodeURIComponent(datetime);
    	
    	var popupWidth = 600;
        var popupHeight = 700;

        var leftPosition = (window.screen.width / 2) - (popupWidth / 2);
        var topPosition = (window.screen.height / 2) - (popupHeight / 2);

        var url = '/ticketweb/checkout?moviename=' + moviename + '&Aticket=' + Aticket + '&Yticket=' + Yticket + '&resultprice=' 
        		+ resultprice + '&resultseat=' + resultseat + '&roomname=' + roomname + '&people=' + people + '&begintime=' + begintime +
        		'&endtime=' + endtime + '&runningtime=' + runningtime + '&datetime=' + datetime;

        window.open(
            url,
            'CheckoutWindow',
            'width=' + popupWidth + ', height=' + popupHeight + ', left=' + leftPosition + ', top=' + topPosition + ', resizable=yes, scrollbars=yes'
        );
        window.location.href = '/ticket';
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
        $("#roomresult").text("극장정보");
        let moviename = $("#movieList li.selected").data("name");
        let movieage = $("#movieList li.selected").data("age");
        
        $("#movieresult").text("");
        let movieresult = $("#movieresult");
        let movieimage = $("#movieimage");
        let movieId = $("#movieList li.selected").data("id");
        
        let checkname = $("#movieList li.selected").data("name");
        let checkid = $("#movieList li.selected").data("id");
        let checkage = $("#movieList li.selected").data("age");
        console.log(checkname+"-"+checkid+"-"+checkage);
        
        $.ajax({
            url: "/movieimage",
            type: "GET",
            data: {movieId:movieId},
            success: function(data) {
            	movieimage.empty();
            	movieimage.append('<img src="' + data + '" alt="영화 차트 이미지">');
            	movieresult.append('<p id="gochart">' + moviename + '</p>');
            	if(movieage=="all") {
            		movieresult.append('<p>전체 이용가</p>');
            	} else {
            		movieresult.append('<p>' + movieage + '세 이용가</p>');
            	}
            }
        });
        
    });
    

    $(document).on("click", "#theaterList li", function() {
        $("#theaterList li").removeClass("selected");
        $(this).addClass("selected");
        let movieId = $("#movieList li.selected").data("id");
        let date = $("#dateList li.selected").data("id");
        let roomId = $("#theaterList li.selected").text().split("-")[0];
        let day = $("#dateList li.selected .day").text();
        $.ajax({
            url: "/times",
            type: "GET",
            data: { movieId:movieId, date:date, roomId:roomId },
            success: function(data) {
                let timeList = $("#timeList ul");
                timeList.empty();
                $.each(data, function(index, times) {
                	let currentDate = new Date();
                    let currentHours = currentDate.getHours();
                    let currentMinutes = currentDate.getMinutes();
                    
                    let [begintimeHours, begintimeMinutes] = times.begintime.split(':').map(Number);
                    let begintimeDate = new Date();
                    begintimeDate.setHours(begintimeHours, begintimeMinutes, 0, 0);
                    let isPast = currentDate > begintimeDate;
                    
                    let timeStatus = isPast ? ' (지나감)' : '';
                    let listItemClass = isPast ? 'past-time' : '';
                    
                    timeList.append('<li class="' + listItemClass + '" data-timetype="' + times.timetype + '" data-alls="' + times.allseat + '" data-id="' + times.begintime + '" title="' + times.endtime + '">' +
                    		times.begintime + '  ' + times.lestseat + '석'+ '  ' + times.timetype + '</li>');
                    
                });
                $("#timeList li").each(function() {
                    if ($(this).data("id") === gettime) {
                        $(this).click();
                        scrollToSelected("#timeList li");
                    }
                });
            }
        });
        $("#roomresult").text("");
        let roomresult = $("#roomresult");
        roomresult.append('<p>선택 극장 ' + roomId + '</p>');
        roomresult.append('<p>일시 ' + date + ' ' + '(' +day+ ')' + '</p>');
    });

    $(document).on("click", "#dateList li", function() {
    	if($("#movieList li.selected").data("id")==null) {
        	alert("영화를 선택해주세요.");
        	return;
        }
    	$("#roomresult").text("극장정보");
        $("#dateList li").removeClass("selected");
        $(this).addClass("selected");
        let movieId = $("#movieList li.selected").data("id");
        let date = $(this).data("id");
        let day = $("#dateList li.selected .day").text();
        $("#timeList ul").empty();
        $.ajax({
            url: "/theaters",
            type: "GET",
            data: { movieId: movieId, date: date },
            success: function(data) {
                let theaterList = $("#theaterList ul");
                theaterList.empty();
                $.each(data, function(index, theater) {
                    theaterList.append('<li data-rname="' + theater.sname + '">' + theater.sname + "-" + theater.seatlevel + '</li>');
                });
                $("#theaterList li").each(function(){
                	if ($(this).data("rname") === getroom) {
                		$(this).click();
                		scrollToSelected("#theaterList li");
                	}
                });
            }
        });
        let roomresult = $("#roomresult");
        roomresult.append('<p>일시 ' + date + ' ' + '(' +day+ ')' + '</p>');
    });

    $(document).on("click", "#timeList li", function(e) {
    	if ($(this).hasClass('past-time')) {
            e.preventDefault();
            return false;
        }
        $("#timeList li").removeClass("selected");
        $(this).addClass("selected");
        $("#roomresult").text("");
        
        let date = $("#dateList li.selected").data("id");
        let roomId = $("#theaterList li.selected").text().split("-")[0];
        let day = $("#dateList li.selected .day").text();
        let time = $("#timeList li.selected").data("id");
        
        let roomresult = $("#roomresult");
        roomresult.append('<p>선택 극장 ' + roomId + '</p>');
        roomresult.append('<p>일시 ' + date + ' ' + '(' +day+ ')' + time  + '</p>');
        
    });
	
    $(document).on("click", "#btnclear", function(){
    	window.location.href = '/ticket';
    });

    
    function loadMovies() {
    	$.ajax({
            url: "/movies",
            type: "GET",
            success: function(data) {
                let movieList = $("#movieList ul");
                movieList.empty();
                $.each(data, function(index, movie) {
                    movieList.append('<li data-time="' + movie.runningtime+ '" data-name="' + movie.mname + '" data-id="' + movie.id + '" data-age="' + movie.age + '"><span class="age' + movie.age + '">' 
                    		+ movie.age + '</span>' + movie.mname + '</li>');
                });
                
            }
        });
    }

    function loadDates() {
    	let dateList = $("#dateList ul");
        dateList.empty();
        
        let currentDate = new Date();
        for (let i = 0; i < 7; i++) {
            let newDate = new Date(currentDate);
            newDate.setDate(currentDate.getDate() + i);

            let dayName = newDate.toLocaleString('ko-KR', { weekday: 'short' });
            let fulldate = newDate.toISOString().split('T')[0];
            let dateString = newDate.toISOString().split('T')[0].split('-');
            let dayClass = (dayName === "토") ? "saturday" : (dayName === "일") ? "sunday" : "";

            dateList.append('<li date-orgin="' + newDate + '" data-id="'+ fulldate +'" class="' + dayClass + '"><div class="date-wrapper"><span class="day">' 
            		+ dayName + '</span><span class="date">' + dateString[2] + '</span></div></li>');
        }
    }

    $(document).on("click","#gochart", function(){
    	let movieId = $("#movieList li.selected").data("id");
    	window.location.href = "/chartList1?id=" + movieId;
    })


    function loadMovieData() {
        if (!getmname || !getdate || !getroom || !gettime) {
            return;
        }

        $.ajax({
            url: "/movies",
            type: "GET",
            success: function(data) {
                let movieList = $("#movieList ul");
                movieList.empty();
                $.each(data, function(index, movie) {
                    movieList.append('<li data-time="' + movie.runningtime + '" data-name="' + movie.mname + '" data-id="' + movie.id + '" data-age="' + movie.age + '">' +
                        '<span class="age' + movie.age + '">' + movie.age + '</span>' + movie.mname + '</li>');
                });

                $("#movieList li").each(function() {
                    if ($(this).data("name") === getmname) {
                        $(this).click();
                        scrollToSelected("#movieList li");
                    }
                });
                $("#dateList li").each(function() {
                    if ($(this).data("id") === getdate) {
                        $(this).click();
                        scrollToSelected("#dateList li");
                    }
                });
            }
        });
    }

    loadMovieData();
	
    function scrollToSelected(selector) {
        $(selector).each(function() {
            if ($(this).hasClass('selected')) {
                $(this)[0].scrollIntoView({ behavior: 'auto', block: 'center' });
                return false; // 첫 번째로 선택된 항목만 이동
            }
        });
    }

});


</script>
</html>