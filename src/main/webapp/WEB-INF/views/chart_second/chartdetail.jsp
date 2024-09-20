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
td {
 border:1px solid black;
}
</style>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div class="maincontainer">
	<div class="top">
		<table class="ftbl">
			<tr>
				<td class="imgcell" rowspan=6>1</td><td>2</td>
			</tr>
			<tr>
				<td>3</td>
			</tr>
			<tr>
				<td>5</td>
			</tr>
			<tr>
				<td>7</td>
			</tr>
			<tr>
				<td>9</td>
			</tr>
			<tr>
				<td>11</td>
			</tr>
		</table>
	</div>
	<div class="mid"></div>
	<div class="bot"></div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
let getmname = "트위스터스";
$(document).ready(function(){
	


	function loadMovied(){
<<<<<<< HEAD
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
=======
		
>>>>>>> branch 'master' of https://github.com/HyukChoi08/MGcinema.git
	}
})
</script>
</html>