<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cinema.mypage.CustomerDTO"%>
<%
// 세션에서 cusrDTO 객체 가져오기
CustomerDTO customer = (CustomerDTO) session.getAttribute("cusDTO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/3a115195d8.js"	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/mypage_css/mypage.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예매내역</title>
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<!-- 프로필 섹션 -->
		<div class="mainscreen">
		<div class="profile-section">
			<img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80" />

			<div class="profile-info">
				<h2>
					<%=customer.getRealname()%>
					님
				</h2>
				<div>
					닉네임 : <span id="nickname"><%=customer.getNickname()%></span>
					<!-- 닉네임 수정 아이콘 클릭 시 모달 표시 -->
					<a href="javascript:void(0)" id="editNicknameBtn">_<i
						class="fa-solid fa-pen"></i></a>
				</div>
				<div>
					아이디 :
					<%=customer.getUid()%>
				</div>
			</div>
		</div>


		<!-- 닉네임 변경하기 모달 -->
		<div id="nicknameModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<h2>닉네임 변경</h2>
				<form id="nicknameForm">
					<label for="newNickname">새 닉네임:</label> 
					<input type="text" id="newNickname" name="newNickname" placeholder="새 닉네임 입력">
					<button type="button" id="saveNicknameBtn">저장</button>
				</form>
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
										<td>${reservation.created}</td>
										<td><button class="button"
												onclick="cancelReservation(${reservation.id})">예매
												취소</button></td>
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
	</div>
	<!-- 푸터 포함 -->
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
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
};
document.addEventListener('DOMContentLoaded', function() {
	const modal = document.getElementById('nicknameModal');
	const editBtn = document.querySelector('.fa-pen');
	const closeBtn = document.querySelector('.close');
	const saveNicknameBtn = document.getElementById('saveNicknameBtn');

	// 닉네임 수정 버튼 클릭 시 모달 창 열기
	editBtn.addEventListener('click', function() {
		modal.style.display = 'block';
	});

	// 닫기 버튼 클릭 시 모달 닫기
	closeBtn.addEventListener('click', function() {
		modal.style.display = 'none';
	});

	// 모달 밖을 클릭하면 닫히게 설정
	window.addEventListener('click', function(event) {
		if (event.target == modal) {
			modal.style.display = 'none';
		}
	});

	// 닉네임 저장 버튼 클릭 시 AJAX 요청
	saveNicknameBtn.addEventListener('click', function() {
		const newNickname = document.getElementById('newNickname').value;
		if (newNickname) {
			$.ajax({
				url : '/updateNickname',
				method : 'POST',
				data : {
					nickname : newNickname
				},
				success : function(response) {
					alert(response); // 서버로부터 성공 메시지 받기
					location.reload(); // 페이지 새로고침해서 닉네임 업데이트 반영
				},
				error : function() {
					alert('닉네임 변경에 실패했습니다.');
				}
			});
			modal.style.display = 'none';
		} else {
			alert('새 닉네임을 입력하세요.');
		}
	});
});

</script>
</html>
