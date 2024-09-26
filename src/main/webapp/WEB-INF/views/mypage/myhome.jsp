<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- JSTL Functions 태그 추가 -->
<%@ page import="com.cinema.mypage.CustomerDTO"%>

<%
// 세션에서 cusrDTO 객체 가져오기
CustomerDTO customer = (CustomerDTO) session.getAttribute("cusDTO");
%>

<%@ page import="com.cinema.mypage.MovieGetDTO"%>
<%
// 세션에서 MovieGetDTO 객체 가져오기
String customer_id = (String) session.getAttribute("uid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/3a115195d8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/mypage_css/mypage.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<!-- 헤더 포함 -->

	<div class="mainscreen">
		<!-- 프로필 섹션 -->
		<div class="profile-section">
			<img id="profileImage"
				src="<%=customer.getProfileimg() != null ? customer.getProfileimg() : "/mypage_image/profile.png"%>"
				alt="프로필이미지" width="80" height="80" />
			<!-- <img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80" /> -->
			<div id="result"></div>
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


		<!-- 닉네임, 프로필 이미지 변경하기 모달 -->
		<div id="nicknameModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<h2>닉네임 변경</h2>
				<form id="nicknameForm">
					<label for="newNickname">새 닉네임:</label> <input type="text"
						id="newNickname" name="newNickname" placeholder="새 닉네임 입력">
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
					<li><a href="/payment">스토어 결제</a></li>
					<li><a href="/inquiry">1:1 문의</a></li>
					<li><a href="/profile">개인 정보 변경</a></li>
					<li><a href="/cancel">회원 탈퇴</a></li>
				</ul>
			</div>

			<!-- 메인 콘텐츠 -->
			<div class="main-content">
				<!-- 예매 내역 섹션 -->
				<div>
					<h3>최근 나의 예매내역</h3>
					<div class="my-historyMain" onclick="location.href='/reservation'">
						<table>
							<thead>
								<tr>
									<th>영화 이름</th>
									<th>상영관</th>
									<th>인원</th>
									<th>가격</th>
									<th>상영일자</th>
									<th>시작 시간</th>
									<th>종료 시간</th>
									<th>예매 시간</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty recentMovies}">
										<c:forEach var="reservation" items="${recentMovies}"
											varStatus="status">
											<tr>
												<td>${reservation.movie_name}</td>
												<td>${reservation.room_name}</td>
												<td>${reservation.totalpeople}</td>
												<td>${reservation.totalprice}</td>
												<td>${reservation.datetime}</td>
												<td>${reservation.begintime}</td>
												<td>${reservation.endtime}</td>
												<td>${reservation.created}</td>
											</tr>
										</c:forEach>
										<!-- 예매 내역이 5개 미만일 때 빈 줄 추가 -->
										<c:forEach begin="${fn:length(recentMovies) + 1}" end="5">
											<tr>
												<td colspan="8">&nbsp;</td>
												<!-- 빈 칸 유지 -->
											</tr>
										</c:forEach>
										<c:if test="${totalMoviesCount > 5}">
											<tr>
												<td colspan="8" style="text-align: center; color: white;">
													상세 정보는 예매정보 페이지에서 확인해 주세요.</td>
											</tr>
										</c:if>
									</c:when>
									<c:otherwise>
										<!-- 예매 내역이 없을 때 빈 줄 5개 표시 -->
										<c:forEach begin="1" end="5">
											<tr>
												<td colspan="8">&nbsp;</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="8">예매 목록이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

					</div>
				</div>
								<div class="div2">
					<div class="div4">
						<a href="/cinema" style="text-decoration: none;">
							<div class="hover01" style="cursor: pointer;">
								<figure>
									<img src="/mypage_image/movieicon.jpg" alt="아이콘" class="custom-img"
										style="width: 120px; height: 100px;">
										<span style="font-size:25px">극장 정보</span>
								</figure>
								
								<!-- 여기에 텍스트나 다른 요소도 추가 가능 -->
							</div>
						</a>
						
					</div>
					<div class="div4">
						<a href="/ticket" style="text-decoration: none;">
							<div class="hover01" style="cursor: pointer;">
								<figure>
									<img src="/mypage_image/myticket.png" alt="아이콘"class="custom-img"
										style="width: 120px; height: 100px;">
											<span style="font-size:25px">영화 예매 </span>
								</figure>
								<!-- 여기에 텍스트나 다른 요소도 추가 가능 -->
							</div>
						</a>
						
					</div>
						
					<!-- <div class="div3" style="border: 0px;">
						<div class="link">
							<ul>
								<li><a href=/chart>무비차트 보러가기</a></li>
								<br>
								<li><a href=/ageinfo>상영영화 예매율 순위</a></li>
								<br>
								<li><a href=/ticket>상영중인 영화</a></li>
								<br>
								<li><a href=/serviceHome>고객센터 바로가기</a></li>
								<br>
								<li><a href=/store>스토어 바로가기</a></li>
								<br>

							</ul>
						</div>
					</div>  -->
				</div>
				<div>
					<h2>Top 3 Movies</h2>
					<div class="divMovie hover01">
						<c:forEach var="movie" items="${topMovies}">
							<div>
								<h3>${movie.mname}</h3>
								<div>
									<figure style="margin: 0; display: inline-block;">
										<!-- 기본 여백 제거 및 인라인 블록 설정 -->
										<img src="${movie.imagepath}" alt="${movie.mname}"
											id="gochart" data-id="${movie.id}"
											style="width: 200px; height: 300px;">
									</figure>
								</div>
								<p>예매율: ${movie.reservation} %</p>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- icon 메뉴 -->

				<div class="div2">

					

					<div class="div3">
						<a href="/inquirywrite" style="text-decoration: none;">
							<div class="hover01" style="cursor: pointer;">
								<figure>
									<img src="/mypage_image/inquiryicon.png" alt="아이콘"
										style="width: 150px; height: 170px;">
								</figure>
								<!-- 여기에 텍스트나 다른 요소도 추가 가능 -->
							</div>
						</a>
						<h3>질문 하기</h3>

					</div>
					<div class="div3">
						<a href="/payment" style="text-decoration: none;">
							<div class="hover01" style="cursor: pointer;">
								<figure>
									<img src="/mypage_image/mystore.png" alt="아이콘"
										style="width: 150px; height: 170px;">
								</figure>
								<!-- 여기에 텍스트나 다른 요소도 추가 가능 -->
							</div>
						</a>
						<h3>스토어 결제이력</h3>
					</div>
					<div class="div3">
						<a href="/cart" style="text-decoration: none;">
							<div class="hover01" style="cursor: pointer;">
								<figure>
									<img src="/mypage_image/mycarticon.png" alt="아이콘"
										style="width: 150px; height: 170px;">
								</figure>
								<!-- 여기에 텍스트나 다른 요소도 추가 가능 -->
							</div>
						</a>
						<h3>내 장바구니</h3>
					</div>
					<br>
				</div>
				
			</div>
		</div>
	</div>

	<!-- 푸터 포함 -->
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<!-- 푸터 포함 -->
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).on("click", "#gochart", function() {
		let movieid = $(this).data("id");
		window.location.href = "chartList1?id=" + movieid;
	})

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
