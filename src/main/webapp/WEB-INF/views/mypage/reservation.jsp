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
<title>예매내역</title>
<style>

</style>
</head>
<body>
	<!-- 프로필 섹션 -->
	<div class="profile-section">
		<img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80">
		<div class="profile-info">
			<h2 id="nickname"><%= customer.getNickname() %>님</h2>
			<p>고객님은 <strong>일반</strong> 고객 입니다.</p>
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
				<h3>나의 예매내역</h3>
				<div class="my-history">
					<table class="reservation-table">
						<thead>
							<tr>
								<th>영화 이름</th>
								<th>상영관 이름</th>
								<th>예매인원</th>
								<th>가격</th>
								<th>상영일자</th>
								<th>시작 시간</th>
								<th>종료 시간</th>
								<th>예매 시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="reservation" items="${getMovies}">
								<tr>
									<td>${reservation.movie_name}</td>
									<td>${reservation.room_name}</td>
									<td>${reservation.totalpeople}</td>
									<td>${reservation.totalprice}</td>
									<td>${reservation.datetime}</td>
									<td>${reservation.begintime}</td>
									<td>${reservation.endtime}</td>
									<td>${reservation.endtime}</td>
									<td><button class="button"
											onclick="cancelReservation(${reservation.id})">예매 취소</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 예매 취소 내역 섹션 -->
				<div>
					<h3>예매 취소 내역</h3>
					<div class="ask-section">
						<table class="reservation-table">
							<thead>
								<tr>
									<th>영화 이름</th>
									<th>상영관 이름</th>
									<th>예매인원</th>
									<th>가격</th>
									<th>상영일자</th>
									<th>시작 시간</th>
									<th>종료 시간</th>
									<th>예매 시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cancellation" items="${canceledMovies}">
									<tr>
										<td>${cancellation.movie_name}</td>
										<td>${cancellation.room_name}</td>
										<td>${cancellation.totalpeople}</td>
										<td>${cancellation.totalprice}</td>
										<td>${cancellation.datetime}</td>
										<td>${cancellation.begintime}</td>
										<td>${cancellation.endtime}</td>
										<td>${cancellation.created}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 푸터 포함 -->
	<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
function cancelReservation(id) {
    if (confirm("예매를 취소하시겠습니까?")) {
        $.ajax({
            url: '/reservation/cancel',
            type: 'POST',
            data: { id: id },
            success: function(response) {
                alert('예매가 취소되었습니다.');
                location.reload(); // 페이지 새로고침
            },
            error: function() {
                alert('취소 중 오류가 발생했습니다.');
            }
        });
    }
}
</script>
</html>
