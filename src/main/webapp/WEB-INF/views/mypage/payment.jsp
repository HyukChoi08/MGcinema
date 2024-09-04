<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cinema.mypage.CustomerDTO"%>
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
<title>스토어 결제내역</title>
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<!-- 헤더 포함 -->
	<div class="mainscreen">
		<!-- 프로필 섹션 -->
		<div class="profile-section">
			<img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80">
			<div class="profile-info">
				<h2 id="nickname"><%=customer.getNickname()%>님
				</h2>
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
				<!-- 예매 내역 섹션 -->
				<div>
					<h3>스토어 결제 내역</h3>
					<div class="my-history">
						<table>
							<thead>
								<tr>
									<th>구매일</th>
									<th>주문번호</th>
									<th>상품명</th>
									<th>결제금액</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:forEach var="reservation" items="${getMovies}">
										<tr>
											<td>${movie.movie_name}</td>
											<td>${movie.room_name}</td>
											<td>${movie.totalprice}</td>
											<td>${movie.begintime}</td>
											<td>${movie.endtime}</td>
										</tr>
									</c:forEach>
								</tr>
							</tbody>
						</table>
						<c:if test="${empty getMovies}">
							<p>No reservations found.</p>
						</c:if>

					</div>
				</div>
				<div>
					<div class="ask-section">
						<button class="button" onclick="location.href='/store'">
						HIII Store 바로가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

</script>
</html>
