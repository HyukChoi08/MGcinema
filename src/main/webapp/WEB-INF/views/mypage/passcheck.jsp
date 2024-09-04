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
<title>결제내역</title>
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
					<h3>회원 정보 확인을 위해 비밀번호를 입력해주세요.</h3>
					<div>
						<form action="/checkPasswd" method="post">
							<input type="hidden" name="redirectUrl"
								value="${param.redirectUrl}"> <input type="hidden"
								name="id" id="id" value="1" readonly> <input
								type="password" id="passwd" name="passwd"><br>
							<button class="button" type="submit">확인</button>
						</form>
						<c:if test="${not empty errorMessage}">
							<p style="color: red;">${errorMessage}</p>
						</c:if>
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
	$(document).ready(function() {
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
	});
</script>
</html>
