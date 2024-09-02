<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cinema.mypage.CustomerDTO" %>
<%
    // 세션에서 cusrDTO 객체 가져오기
    CustomerDTO customer = (CustomerDTO) session.getAttribute("cusDTO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의 게시판</title>
<style>
/* 전체 body 스타일 설정 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4; /* 페이지 배경색 */
}

/* 프로필 섹션 스타일 */
.profile-section {
	display: flex; /* 이미지와 텍스트를 옆으로 배치 */
	align-items: center; /* 수직 중앙 정렬 */
	padding: 20px;
	background-color: white; /* 프로필 섹션 배경색 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 프로필 섹션 그림자 효과 */
	width: 60%; /* 프로필 섹션의 너비 조정 */
	margin: 10px auto;
	border-radius: 10px; /* 모서리 둥글게 */
}

.profile-section img {
	border-radius: 50%; /* 이미지 원형으로 만들기 */
	margin-right: 15px; /* 이미지와 텍스트 사이 간격 */
}

.profile-section .profile-info {
	flex-grow: 1; /* 프로필 정보의 너비를 남은 공간에 맞추기 */
}

.button {
	background-color: #e50914; /* 버튼 배경색 */
	color: white;
	padding: 10px 20px;
	text-align: center; /* 텍스트 중앙 정렬 */
	border-radius: 5px; /* 모서리 둥글게 */
	text-decoration: none; /* 링크 밑줄 제거 */
	display: inline-block;
	margin-top: 10px;
	transition: background-color 0.3s ease; /* 배경색 변경 시 애니메이션 추가 */
}

.button:hover {
	background-color: #d10813; /* 버튼에 마우스 올렸을 때 색상 */
}

/* 메인 컨테이너 스타일 */
.container {
	display: flex; /* 사이드바와 메인 콘텐츠를 옆으로 배치 */
	max-width: 1200px;
	margin: 20px auto;
}

/* 사이드바 스타일 */
.sidebar {
	width: 25%; /* 사이드바 너비 */
	padding: 15px;
	background-color: #f7f7f7; /* 사이드바 배경색 */
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* 사이드바 그림자 효과 */
	height: fit-content; /* 사이드바의 높이를 내용에 맞추기 */
	border-radius: 10px; /* 모서리 둥글게 */
}

/* 사이드바 내 리스트 스타일 */
.sidebar ul {
	list-style-type: none;
	padding: 0; /* 기본 패딩 제거 */
}

.sidebar ul li {
	margin-bottom: 15px; /* 리스트 간 간격 */
}

.sidebar ul li a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: #333; /* 텍스트 색상 */
	font-weight: bold; /* 텍스트 굵게 */
	transition: color 0.3s ease; /* 텍스트 색상 변경 시 애니메이션 추가 */
}

.sidebar ul li a:hover {
	color: #e50914; /* 링크에 마우스 올렸을 때 색상 */
}

/* 메인 콘텐츠 스타일 */
.main-content {
	width: 75%;
	padding: 20px;
	background-color: white; /* 메인 콘텐츠 배경색 */
	margin-left: 20px; /* 사이드바와 메인 콘텐츠 사이 간격 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 메인 콘텐츠 섹션 그림자 효과 */
	border-radius: 10px; /* 모서리 둥글게 */
}

/* 폼 스타일 */
form {
	display: flex;
	flex-direction: column; /* 폼 요소들을 세로로 정렬 */
}

form label {
	margin-bottom: 5px;
	font-weight: bold;
}

form input, form textarea {
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 16px;
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
	transition: border-color 0.3s ease; /* 경계선 색상 변경 시 애니메이션 추가 */
}

form input:focus, form textarea:focus {
	border-color: #e50914; /* 포커스 시 경계선 색상 변경 */
	outline: none; /* 기본 아웃라인 제거 */
}

form input[type="submit"] {
	background-color: #e50914;
	color: white;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 배경색 변경 시 애니메이션 추가 */
}

form input[type="submit"]:hover {
	background-color: #d10813; /* 마우스 올렸을 때 색상 */
}

/* 관리자 응답 스타일 */
.response {
	margin-top: 40px;
	padding: 20px;
	background-color: #f7f7f7;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 응답 섹션 그림자 효과 */
}

.response h2 {
	margin-top: 0;
	color: #e50914; /* 제목 색상 */
}

.response p {
	line-height: 1.6;
}

/* 문의 내역 테이블 스타일 */
.inquiry-table {
	width: 100%;
	border-collapse: collapse; /* 테이블 경계선 겹치기 */
	margin-top: 40px;
}

.inquiry-table th, .inquiry-table td {
	padding: 12px 15px;
	text-align: left;
	border: 1px solid #ddd;
}

.inquiry-table th {
	background-color: #f7f7f7;
	font-weight: bold;
}

.inquiry-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

.status-complete {
	color: green;
	font-weight: bold;
}

.status-pending {
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>
	<%-- <%@ include file="/WEB-INF/views/header/header.jsp"%> --%>
	<!-- 헤더 포함 -->
	<!-- 프로필 섹션 -->
	<div class="profile-section">
		<img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80">
		<div class="profile-info">
			<h2 id="nickname"><%= customer.getNickname() %>님</h2>
			<p>
				고객님은 <strong>일반</strong> 고객 입니다.
			</p>
		</div>
		<a href="#" class="button">닉네임 설정</a>
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
			<h2>1:1 문의 게시판</h2>

			<!-- 문의 폼 -->
			<button class="button" onclick="location.href='/inquirywrite'">문의하기</button>
			<!-- 나의 문의 내역 -->
			<!-- 문의 목록을 보여주는 테이블 -->
			<table border="1" class="inquiry-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>상태</th>
					</tr>
					<c:forEach var="inquiry" items="${inquiries}">
						<tr>
							<td>${inquiry.id}</td>
							<td><a href='/inquirydetail/${inquiry.id}'>${inquiry.title}</a></td>
							<td>${inquiry.created}</td>
							<td>${inquiry.current}</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
			<br>

			</table>
		</div>
	</div>
	<%-- <%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<!-- 푸터 포함 --> --%>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
   
</script>
</html>