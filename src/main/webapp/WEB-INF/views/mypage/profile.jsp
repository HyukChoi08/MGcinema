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
<script src="https://kit.fontawesome.com/3a115195d8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/mypage_css/mypage.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<!-- 헤더 포함 -->
		<!-- DB 작업 실패 시 에러메세지 출력 -->
		<c:if test="${not empty errorMessage}">
			<script>
				alert('${errorMessage}');
			</script>
		</c:if>

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
						<li><a href="/payment">결제 내역</a></li>
						<li><a href="/inquiry">1:1 문의</a></li>
						<li><a href="/profile">개인 정보 변경</a></li>
						<li><a href="/cancel">회원 탈퇴</a></li>
					</ul>
				</div>

				<!-- 메인 콘텐츠 -->
				<div class="main-content">
					<div>
						<div>
							<h3>회원 정보 수정</h3>
						</div>
						<div>
							<form method=post action='/profileUpdate'>
								<table>
									<tr>
										<td></td>
										<td><input type=hidden name=id id=id></td>
									</tr>
									<tr>
										<td><h4>아이디</h4></td>
										<td><input type=text name=uid id=uid readonly></td>
									</tr>
									<tr>
										<td><h4>비밀번호</h4></td>
										<td><input type=password name=passwd id=passwd></td>
									</tr>
									<!-- <tr><td>비밀번호확인</td><td><input type=password name=passwd1></td></tr> -->
									<tr>
										<td><h4>실명</h4></td>
										<td><input type=text name=realname id=realname readonly></td>
									</tr>
									<tr>
										<td><h4>닉네임</h4></td>
										<td><input type="text" name="nickname" id=inputNickname></td>
									</tr>
									<tr>
										<td><h4>e-mail</h4></td>
										<td><input type=text name=email id=email></td>
									</tr>
									<tr>
										<td><h4>주소</h4></td>
										<td><input type=text name=region id=region></td>
									</tr>
									<tr>
										<td><h4>생년월일</h4></td>
										<td><input type="date" name=birthday id=birthday></td>
									</tr>
									<tr>
										<td><h4>통신사</h4></td>
										<td><input type=radio name=tellecom value="LG U+"id="radioLG">LG U+ 
										<input type=radio name=tellecom	value=KT id="radioKT">KT 
										<input type=radio name=tellecom value=SKT id="radioSKT">SKT<br> 
										<input type=radio name=tellecom value=SKT-MVNO id="radioSKT-MVNO">SKT알뜰폰
										<input type=radio name=tellecom value=KT-MVNO id="radioKT-MVNO">KT알뜰폰 
										<input type=radio name=tellecom value=LG-MVNO id="radioLG-MVNO">U+알뜰폰 <br>
										</td>
									</tr>
									<tr>
										<td><h4>휴대폰 번호</h4></td>
										<td><input type=text name=mobile id=mobile></td>
									</tr>


									<tr>
										<td><h4>관심분야</h4></td>
										<td>
											<input type="checkbox" name="favorite"id="favoriteAction" value="액션">액션 
											<input type="checkbox" name="favorite" id="favoriteComedy"value="코미디">코미디 
											<input type="checkbox" name="favorite" id="favoriteDrama" value="드라마">드라마<br>
											<input type="checkbox" name="favorite" id="favoriteSF"value="SF">SF 
											<input type="checkbox" name="favorite"id="favoriteRomance" value="로맨스">로맨스 
											<input type="checkbox" name="favorite" id="favoriteThriller"value="스릴러">스릴러<br> 
											<input type="checkbox" name="favorite" id="favoriteHorror" value="공포">공포 
											<input type="checkbox" name="favorite" id="favoriteAnimation" value="애니메이션">애니메이션 
											<input type="checkbox" name="favorite" id="favoriteFantasy" value="판타지">판타지<br>
											<input type="checkbox" name="favorite" id="favoriteFamily"value="가족">가족 
											<input type="checkbox" name="favorite" id="favoriteAdventure" value="모험">모험 
											<input type="checkbox" name="favorite" id="favoriteWar" value="전쟁">전쟁
											<input type="checkbox" name="favorite" id="favoriteMusic"value="음악">음악</td>
									</tr>
									<tr>
										<td colspan=2 style='text-align: center'><input
											type="submit" value="수정" class="button">
											<button class="button" onClick="location.href='/myhome'">취소</button>
										</td>
									</tr>
								</table>
							</form>

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
	$(document).ready(

			function() {

				$.ajax({
					url : "/customerInfo",
					method : "POST",
					success : function(data) {
						// 서버에서 받아온 데이터로 프로필 섹션 업데이트
						console.log("받아온 데이터 id: " + data.id);
						$('#id').val(data.id);
						$('#uid').val(data.uid);
						$('#passwd').val(data.passwd);
						$('#realname').val(data.realname);
						$('#inputNickname').val(data.nickname);
						$('#email').val(data.email);
						$('#region').val(data.region);
						$('#birthday').val(data.birthday);

						// tellecom radio 체크 설정
						if (data.tellecom === "LG U+") {
							$('#radioLG').prop('checked', true);
						} else if (data.tellecom === "KT") {
							$('#radioKT').prop('checked', true);
						} else if (data.tellecom === "SKT") {
							$('#radioSKT').prop('checked', true);
						} else if (data.tellecom === "SKT-MVNO") {
							$('#radioSKT-MVNO').prop('checked', true);
						} else if (data.tellecom === "KT-MVNO") {
							$('#radioKT-MVNO').prop('checked', true);
						} else if (data.tellecom === "LG-MVNO") {
							$('#radioLG-MVNO').prop('checked', true);
						}

						$('#mobile').val(data.mobile);

						// favorite checkbox 설정
						var favorites = data.favorite.split(',');

						favorites.forEach(function(fav) {
							fav = fav.trim(); // 공백 제거
							// value 속성에 해당하는 checkbox를 찾아서 체크
							$('input[name="favorite"][value="' + fav + '"]')
									.prop('checked', true);
						});
					},
					error : function() {
						$('#nickname').text("알수없음");
						console.log("AJAX Error:", textStatus, errorThrown);
					}
				});
			});
	$(function() {
		// 현재 날짜를 ISO 문자열 형식으로 가져오고, 'T'를 기준으로 나눈 후 첫 번째 부분을 선택합니다.
		var today = new Date().toISOString().split('T')[0];
		// #birthday 요소의 max 속성을 현재 날짜로 설정합니다.
		$('#birthday').attr('max', today);
	});
	
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