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
		<div id="gocut"><span class="cutbtn">스틸컷</span></div>
	</div>
	<div class="bot">
	    <div class="director-section">
	        <div>감독</div>
	        <div id="dirimg"></div>
	    </div>
	    <div class="cast-section">
	        <div>배우</div>
	        <div id="castimg"></div>
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
	
	$(document).on("click",".cutbtn", function(){
		window.location.href = "chartcut?id=" + movieid.trim();
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
					$(".director").text("감독: " + movie.director);
					$(".cast").text("배우: " + movie.cast)
					$(".thrinfo").text("장르: " + movie.genre + " / 관람이용가: " + movie.age + " / 상영시간: " + movie.runningtime);
					$(".reldate").text("개봉일:" + movie.releasedate);
				})
				let dircell = $("#dirimg");
				let dirname = $(".director").text();
				dirn = dirname.split(":")[1].trim();
				$.ajax({
					url:"/dirimg",
					type:"GET",
					data:{movieid:movieid,dirn:dirn},
					success:function(data){
						dircell.empty();
						console.log(data);
						dircell.append('<img src="' + data + '" class="actorimg" alt="감독이미지">');
						dircell.append(dirn);
					}
				});
				let castcell = $("#castimg");
				let castname = $(".cast").text();
				castname = castname.split(":")[1];
				let allcastname = castname.split(",");
				allcastname = allcastname.map(name => name.trim());
				console.log(allcastname);
				$.ajax({
					url: "/getCastImages",
					type: "GET",
					data: {
						castNames: allcastname,
						movieid: movieid
					},
					traditional: true,
					success: function(data) {
						console.log(data);
						castcell.empty();
						$.each(data, function(index, actor) {
							let imagePath = actor.image_path || '/default_image_path.jpg';
							castcell.append('<div><img src="' + imagePath + '" class="actorimg" alt="배우 이미지">' + actor.actor + '</div>');
						});
					}
				});
			}
		})
	}
	function allClear(){
		$(".imgcell").text("");
		$(".mnamecell").text("");
		$(".rescell").text("");
		$(".director").text("");
		$(".cast").text("");
		$(".thrinfo").text("");
		$(".reldate").text("");
	}
})
</script>
</html>