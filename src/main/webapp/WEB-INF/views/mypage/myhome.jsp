<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cinema.mypage.CustomerDTO" %>
<%
    // 세션에서 cusrDTO 객체 가져오기
    CustomerDTO customer = (CustomerDTO) session.getAttribute("cusDTO");
%>
    <!-- 절대 경로로 CSS 파일 링크 -->
    
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/mypage_css/mypage.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My CGV</title>
<style>
@charset "UTF-8";
/* 전체 body 스타일 설정 */

body {   	
	text-align: left !important;
	font-family: Arial, sans-serif; /* 폰트 설정 */
	margin: 0; /* 여백 제거 */
	padding: 0; /* 패딩 제거 */
	background-color: #f4f4f4; /* 페이지 배경색 */
}

/* 프로필 섹션 스타일 */
.profile-section {
	display: flex; /* 이미지와 텍스트를 옆으로 배치 */
	align-items: center; /* 수직 중앙 정렬 */
	padding: 20px; /* 패딩 설정 */
	background-color: white; /* 프로필 섹션 배경색 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 프로필 섹션 그림자 효과 */
	width: 60%; /* 프로필 섹션의 너비 조정 */
	margin: 10px auto; /* 수직 중앙 정렬과 상하 여백 */
	border-radius: 10px; /* 모서리 둥글게 */
}

.profile-section img {
	border-radius: 50%; /* 이미지 원형으로 만들기 */
	margin-right: 15px; /* 이미지와 텍스트 사이 간격 */
}

.profile-section .profile-info {
	flex-grow: 1; /* 남은 공간 차지 */
}

.button {
	background-color: #e50914; /* 버튼 배경색 */
	color: white; /* 텍스트 색상 */
	padding: 10px 20px; /* 버튼 안쪽 여백 */
	text-align: center; /* 텍스트 중앙 정렬 */
	border-radius: 5px; /* 모서리 둥글게 */
	text-decoration: none; /* 링크 밑줄 제거 */
	display: inline-block; /* 인라인 블록 요소로 설정 */
	margin-top: 10px; /* 위쪽 여백 */
	transition: background-color 0.3s ease; /* 배경색 변경 시 애니메이션 추가 */
}

.button:hover {
	background-color: #d10813; /* 버튼에 마우스 올렸을 때 색상 */
}

/* 메인 컨테이너 스타일 */
.container {
	display: flex; /* 사이드바와 메인 콘텐츠를 옆으로 배치 */
	max-width: 1200px; /* 최대 너비 설정 */
	margin: 20px auto; /* 중앙 정렬과 상하 여백 */
}

/* 사이드바 스타일 */
.sidebar {
	width: 25%; /* 사이드바 너비 */
	padding: 15px; /* 패딩 설정 */
	background-color: #f7f7f7; /* 사이드바 배경색 */
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* 사이드바 그림자 효과 */
	height: fit-content; /* 내용에 맞춘 높이 */
	border-radius: 10px; /* 모서리 둥글게 */
}

.sidebar ul {
	list-style-type: none; /* 리스트 스타일 제거 */
	padding: 0; /* 기본 패딩 제거 */
}

.sidebar ul li {
	margin-bottom: 15px; /* 리스트 간 간격 */
}

.sidebar ul li a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: #333; /* 텍스트 색상 */
	font-weight: bold; /* 텍스트 굵게 */
	transition: color 0.3s ease; /* 색상 변경 시 애니메이션 추가 */
}

.sidebar ul li a:hover {
	color: #e50914; /* 링크에 마우스 올렸을 때 색상 */
}

/* 메인 콘텐츠 스타일 */
.main-content {
	width: 75%; /* 콘텐츠 영역 너비 */
	padding: 20px; /* 패딩 설정 */
	background-color: white; /* 배경색 */
	margin-left: 20px; /* 사이드바와의 간격 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	border-radius: 10px; /* 모서리 둥글게 */
}

</style>
</head>
<body>
 <%@ include file="/WEB-INF/views/header/header.jsp"%> 
	<!-- 헤더 포함 -->
	<!-- 프로필 섹션 -->
	<div class="profile-section">
		<img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80" />

		<div class="profile-info">
			<h2 id="nickname"><%= customer.getNickname() %>님</h2>
			<p>
				고객님은 <strong>일반</strong> 고객 입니다.
			</p>
		</div>
		<a href="/profile" class="button">닉네임 설정</a>
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
