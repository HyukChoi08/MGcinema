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
}
.container {
    width: 1000px;
    margin-top: 50px;
    background-color: #f4f4f4;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
select, button {
    padding: 10px;
    margin: 10px 0;
    width: 200px;
    max-width: 300px;
}
</style>
</head>
<body>
    <div class="container">
        <h1>Movie Ticket Reservation</h1>
        
        <select id="movieSelect">
            <option value="">Select Movie</option>
        </select>
        
        <select id="theaterSelect">
            <option value="">Select Theater</option>
        </select>
        
        <select id="dateSelect">
            <option value="">Select Date</option>
        </select>
        
        <select id="timeSelect">
            <option value="">Select Time</option>
        </select>
        
        <button id="reserveBtn">Reserve Now</button>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
    $(document).ready(function() {
        // Load movies on page load
        $.ajax({
            url: "/movies",
            type: "GET",
            success: function(data) {
                let movieSelect = $("#movieSelect");
                movieSelect.empty().append('<option value="">Select Movie</option>');
                $.each(data, function(index, movie) {
                    movieSelect.append('<option value="' + movie.id + '">' + movie.name + '</option>');
                });
            }
        });

        // Load theaters when a movie is selected
        $("#movieSelect").change(function() {
            let movieId = $(this).val();
            $.ajax({
                url: "/theaters",
                type: "GET",
                data: { movieId: movieId },
                success: function(data) {
                    let theaterSelect = $("#theaterSelect");
                    theaterSelect.empty().append('<option value="">Select Theater</option>');
                    $.each(data, function(index, theater) {
                        theaterSelect.append('<option value="' + theater.id + '">' + theater.name + '</option>');
                    });
                }
            });
        });

        // Load dates when a theater is selected
        $("#theaterSelect").change(function() {
            let theaterId = $(this).val();
            $.ajax({
                url: "/dates",
                type: "GET",
                data: { theaterId: theaterId },
                success: function(data) {
                    let dateSelect = $("#dateSelect");
                    dateSelect.empty().append('<option value="">Select Date</option>');
                    $.each(data, function(index, date) {
                        dateSelect.append('<option value="' + date + '">' + date + '</option>');
                    });
                }
            });
        });

        // Load times when a date is selected
        $("#dateSelect").change(function() {
            let theaterId = $("#theaterSelect").val();
            let date = $(this).val();
            $.ajax({
                url: "/times",
                type: "GET",
                data: { theaterId: theaterId, date: date },
                success: function(data) {
                    let timeSelect = $("#timeSelect");
                    timeSelect.empty().append('<option value="">Select Time</option>');
                    $.each(data, function(index, time) {
                        timeSelect.append('<option value="' + time + '">' + time + '</option>');
                    });
                }
            });
        });

        // Handle reservation
        $("#reserveBtn").click(function() {
            let movieId = $("#movieSelect").val();
            let theaterId = $("#theaterSelect").val();
            let date = $("#dateSelect").val();
            let time = $("#timeSelect").val();

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
</script>
</html>