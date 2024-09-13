<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/detail_css/chartdetail.css">
</head>
<style>
</style>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div class="maincontainer">
	<div class="top">
		<div class="inimg">
			<img class="imgcell" id="mimage" alt="영화 이미지">
		</div>
		<div class="allinfo">
			<div class="mnamecell"></div>
			<div class="emptya"></div>
			<div class="rescell"></div>
			<div class="actor"></div>
			<div class="thrinfo"></div>
			<div class="reldate"></div>
			<div class="emptyb"></div>
			<div class="goticket">예매하기</div>
		</div>
	</div>
	<div class="mid">
		<div></div>
	</div>
	<div class="bot">
		<div>감독</div>
		<div>배우</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
let movieid = "${movieid}";
$(document).ready(function(){
	loadMovied();
	
	
	
	$(document).on("click",".goticket", function(){
		window.location.href = "ticket?id=" + movieid.trim();
	})
	
	function loadMovied(){
		let movieimg = $(".imgcell"); 
		$.ajax({
			url:"/detailmovies",
			type:"GET",
			data:{id:movieid},
			success:function(data){
				allClear();
				$.each(data, function(index, movie){
					$('#mimage').attr('src', movie.imagepath);
					$(".mnamecell").text(movie.mname);
					$(".rescell").text("예매율: " + movie.reservation + "%");
					$(".actor").text("감독:" + movie.director + " / 배우:" + movie.cast);
					$(".thrinfo").text("장르:" + movie.genre + " / 관람이용가:" + movie.age + " / 상영시간:" + movie.runningtime);
					$(".reldate").text("개봉일:" + movie.releasedate);
				})
			}
		})
	}
	function allClear(){
		$(".imgcell").text("");
		$(".mnamecell").text("");
		$(".rescell").text("");
		$(".actor").text("");
		$(".thrinfo").text("");
		$(".reldate").text("");
	}
})
</script>
</html>