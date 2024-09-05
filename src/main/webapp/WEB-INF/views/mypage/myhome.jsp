<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="com.cinema.mypage.CustomerDTO"%>
<%
// 세션에서 cusrDTO 객체 가져오기
CustomerDTO customer = (CustomerDTO) session.getAttribute("cusDTO");
%>
<!-- 절대 경로로 CSS 파일 링크 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/3a115195d8.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/mypage_css/mypage.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My CGV</title>
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<!-- 헤더 포함 -->
	<!-- 프로필 섹션 -->
	<div class="mainscreen">
		<div class="profile-section">
			<img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80" />

			<div class="profile-info">
				
				<h2>
					<%=customer.getRealname()%> 님
				</h2>
				<div>
					닉네임 :
					
					<%=customer.getNickname()%>
					
					<a href="/profile">_<i class="fa-solid fa-pen"></i></a>
				</div>
				<div>
					아이디 :
					<%=customer.getUid()%>
				</div>
				
			</div>
			
		</div>

		<!-- 메인 컨테이너 -->
		<div class="container">
			<!-- 사이드바 -->
			<div class="sidebar">
				<ul>
					<li><a href="/myhome">MY HOME</a></li>
					<li><a href="/reservation">나의 예매정보</a></li>
					<li><a href="/payment">결제 내역</a></li>
					<li><a href="/inquiry">1:1 문의</a></li>
					<li><a href="/profile">개인 정보 변경</a></li>
					<li><a href="/cancel">회원 탈퇴</a></li>
				</ul>
			</div>

			<!-- 메인 콘텐츠 -->
			<div class="main-content">
				<!-- 예매 내역 섹션 -->
				<div>
					<h3>나의 예매내역</h3>
					<div class="my-history">
						<button class="button" onclick="location.href='/cinema'">CGV
							영화 예매 바로가기</button>
					</div>
				</div>

				<!-- 문의 내역 섹션 -->
				<div>
					<h3>예매 취소 내역</h3>
					<div class="ask-section">
						<button class="button" onclick="location.href='/cinema'">CGV
							영화 예매 바로가기</button>
					</div>
				</div>
				<!-- My CGV Home 섹션 -->
				<div class="link">
					<ul>
						<li><a href=/chart>Movie Home</a></li>
						<li><a href=/ageinfo>등급영화 보기</a></li>
						<li><a href=/ticket>상영중인 영화</a></li>
						<li><a href=/serviceHome>고객센터 바로가기</a></li>
						<li><a href=/store>스토어 바로가기</a></li>

					</ul>
				</div>
				<br> <br> <br>

				<!-- 푸터 섹션 -->
				<div class="footer-section">
					<p>보고싶은 영화가 있나요?</p>
					<a href="/chart" class="button">상영중인 영화 바로가기</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	/* 	$(document).ready(function() {
	 var userId = 1; // 테스트할 사용자 ID, 실제 상황에서는 동적으로 설정

	 $.ajax({
	 url : "/customerInfo",
	 method : "POST",
	 data : {
	 id : userId
	 },
	 success : function(data) {
	 // 서버에서 받아온 데이터로 프로필 섹션 업데이트
	 $('#nickname').text(data.nickname + "님");
	 },
	 error : function() {
	 $('#nickname').text("알수없음");
	 console.log("AJAX Error:", textStatus, errorThrown);
	 }
	 });
	 }); */
</script>
</html>
