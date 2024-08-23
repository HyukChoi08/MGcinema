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
    <div class="container">
        <h1>Movie Ticket Reservation</h1>
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
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
    $(document).ready(function() {
        loadMovies();
		loadDates();
        // Load theaters when a movie is selected
        $(document).on("click", "#movieList li", function() {
            $("#movieList li").removeClass("selected");
            $(this).addClass("selected");
            
        });

        // Load dates when a theater is selected
        $(document).on("click", "#theaterList li", function() {
            $("#theaterList li").removeClass("selected");
            $(this).addClass("selected");
            
            let theaterId = $(this).data("id");
            $.ajax({
                url: "/dates",
                type: "GET",
                data: { theaterId: theaterId },
                success: function(data) {
                    let dateList = $("#dateList ul");
                    dateList.empty();
                    $.each(data, function(index, date) {
                        dateList.append('<li>' + date + '</li>');
                    });
                }
            });
        });

        // Load times when a date is selected
        $(document).on("click", "#dateList li", function() {
            $("#dateList li").removeClass("selected");
            $(this).addClass("selected");
            let movieid = $("#movieList li.selected").data("id");
          //  let theaterId = $("#theaterList li.selected").data("id");
            let date = $(this).data("id");
            console.log(movieid+date);
            $.ajax({
                url: "/theaters",
                type: "GET",
                data: { movieId: movieid, date: date },
                success: function(data) {
                    let theaterList = $("#theaterList ul");
                    theaterList.empty();
                    $.each(data, function(index, theater) {
                        theaterList.append('<li>' + theater.sname + '</li>');
                    });
                }
            });
        });

        // Handle reservation
        $("#reserveBtn").click(function() {
            let movieId = $("#movieList li.selected").data("id");
            let theaterId = $("#theaterList li.selected").data("id");
            let date = $("#dateList li.selected").text();
            let time = $("#timeList li.selected").text();

            if (movieId && theaterId && date && time) {
                $.ajax({
                    url: "/reserve",
                    type: "POST",
                    data: {
                        movieId: movieId,
                        theaterId: theaterId,
                        date: date,
                        time: time
                    },
                    success: function(response) {
                        alert("Reservation successful!");
                    },
                    error: function() {
                        alert("Failed to reserve. Please try again.");
                    }
                });
            } else {
                alert("Please select all options.");
            }
        });
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