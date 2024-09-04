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
<link rel="stylesheet" href="/mypage_css/mypage.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의 게시판</title>
<style>

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
					 <c:set var="counter" value="1" />
					<c:forEach var="inquiry" items="${inquiries}">
						<tr>
							 <td><c:out value="${counter}" /></td>
							<%-- <td>${inquiry.id}</td> --%>
							<td><a href='/inquirydetail/${inquiry.id}'>${inquiry.title}</a></td>
							<td>${inquiry.created}</td>
							<td>${inquiry.current}</td>
						</tr>
						<c:set var="counter" value="${counter + 1}" />
					</c:forEach>
				</thead>
			</table>
			<br>

			</table>
		</div>
	</div>
	 <%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
   
</script>
</html>