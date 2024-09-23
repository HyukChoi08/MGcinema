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
			<div class="director"></div>
			<div class="cast"></div>
			<div class="thrinfo"></div>
			<div class="reldate"></div>
			<div class="emptyb"></div>
			<div class="goticket"><span class="ticbtn">예매하기</span></div>
		</div>
	</div>
	<div class="mid">
		<ul class="midlist">
			<li><span class="Listonbtn">상세정보</span></li>
			<li><span class="actbtn">감독/출연</span></li>
			<li><span class="nowbtn">스틸컷</span></li>
			<li><span class="revbtn">평점/리뷰</span></li>
			<li><span class="thebtn">상영시간</span></li>
		</ul>
	</div>
	<div class="bot">
	    <div class="cut-section">
	        <div class="bottit">스틸컷</div>
	        <div id="cutimg"></div>
	    </div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
let movieid = "${movieid}";
$(document).ready(function(){
	loadMovied();
	
	
	
	$(document).on("click",".ticbtn", function(){
		window.location.href = "ticket?id=" + movieid.trim();
	})
	$(document).on("click",".actbtn", function(){
		window.location.href = "chartdetail?id=" +movieid.trim();
	})
	$(document).on("click",".Listonbtn", function(){
		window.location.href = "chartList1?id=" + movieid.trim();
	})
	$(document).on("click",".revbtn", function(){
		window.location.href = "chartList1?id=" + movieid.trim() + "#commentList";
	})
	$(document).on("click",".thebtn", function(){
		window.location.href = "cinema";
	})
	$(document).on("click", ".nowbtn", function() {
	    document.querySelector('.bot').scrollIntoView({
	        behavior: 'smooth'
	    });
	});
	
	
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
					$(".director").text("감독: " + movie.director);
					$(".cast").text("배우: " + movie.cast)
					$(".thrinfo").text("장르: " + movie.genre + " / 관람이용가: " + movie.age + " / 상영시간: " + movie.runningtime);
					$(".reldate").text("개봉일:" + movie.releasedate);
				})
				let cutcell = $("#cutimg");
				$.ajax({
					url:"/cutimg",
					type:"GET",
					data:{movieid:movieid},
					success:function(data){
						cutcell.empty();
						$.each(data, function(index,cut){
							cutcell.append('<img src="' + cut.image_path + '" class="allcutimg" alt="스틸컷">');
						})
					}
				});
			}
		});
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