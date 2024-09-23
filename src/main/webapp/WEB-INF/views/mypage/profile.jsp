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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
			<img id="profileImage"
				src="<%=customer.getProfileimg() != null ? customer.getProfileimg() : "/mypage_image/profile.png"%>"
				alt="프로필이미지" width="80" height="80" />
			<!-- <img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80" /> -->
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
					<li><a href="/payment">스토어 결제</a></li>
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
						<form method=post action='/profileUpdate'
							enctype="multipart/form-data">
							<table class="profile-input">
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
									<td>
										<div>
											<!-- 우편번호 및 주소 검색 버튼 -->
											<form>
												<label for="post">우편번호</label><br> <input type="text"
													id="post" name=post readonly placeholder="우편번호를 입력하세요">
												<button id="profilebtn" type="button" onclick="searchAddr()">주소
													검색</button>
												<br> <br> <label for="address">주소</label><br>
												<input type="text" id="address" name="address" readonly
													placeholder="주소를 입력하세요"><br> <br> <label
													for="fulladdress">상세 주소</label><br> <input type="text"
													id="fulladdress" name="fulladdress"
													placeholder="상세 주소를 입력하세요"> <br> <br>
											</form>
										</div>
									</td>
								</tr>
								<tr>
									<td><h4>생년월일</h4></td>
									<td><input type="date" name=birthday id=birthday></td>
								</tr>
								<tr>
									<td><h4>통신사</h4></td>
									<td><input type=radio name=tellecom value="LG U+"
										id="radioLG">LG U+ <input type=radio name=tellecom
										value=KT id="radioKT">KT <input type=radio
										name=tellecom value=SKT id="radioSKT">SKT<br> <input
										type=radio name=tellecom value=SKT-MVNO id="radioSKT-MVNO">SKT알뜰폰
										<input type=radio name=tellecom value=KT-MVNO
										id="radioKT-MVNO">KT알뜰폰 <input type=radio
										name=tellecom value=LG-MVNO id="radioLG-MVNO">U+알뜰폰 <br>
									</td>
								</tr>
								<tr>
									<td><h4>휴대폰 번호</h4></td>
									<td><input type=text name=mobile id=mobile></td>
								</tr>


								<tr>
								    <td><h4>관심분야</h4></td>
								    <td>
								        <div class="profilecheckbox">
								            <label><input type="checkbox" name="favorite" id="favoriteAction" value="액션"> 액션</label>
								            <label><input type="checkbox" name="favorite" id="favoriteThriller" value="스릴러"> 스릴러</label>
								            <label><input type="checkbox" name="favorite" id="favoriteSF" value="SF"> SF</label>
								            <label><input type="checkbox" name="favorite" id="favoriteComedy" value="코미디"> 코미디</label>
								            <label><input type="checkbox" name="favorite" id="favoriteRomance" value="로맨스"> 로맨스</label>
								            <label><input type="checkbox" name="favorite" id="favoriteFantasy" value="판타지"> 판타지</label>
								            <label><input type="checkbox" name="favorite" id="favoriteAnimation" value="애니메이션"> 애니메이션</label>
								            <label><input type="checkbox" name="favorite" id="favoriteFamily" value="가족"> 가족</label>
								            <label><input type="checkbox" name="favorite" id="favoriteEtc" value="기타"> 기타</label>
								        </div>
								    </td>
								</tr>
								<tr>
									<td><h4>프로필 이미지</h4></td>
									<td><h5>이미지변경</h5> <input type="file"
										id="profileImageInput" name="profileImage" accept="image/*" />
										<br /> <img id="imagePreview" src="#" alt="이미지 미리보기"
										style="display: none; width: 100px; height: 100px; margin-top: 10px;" />

									</td>
								</tr>
								<tr>
									<td colspan=2 style='text-align: center'><input
										id="probtn" type="submit" value="수정">
										<button id="probtn" onClick="location.href='/myhome'">취소</button>
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
						$('#address').val(data.address);
						$('#birthday').val(data.birthday);
						$('#fulladdress').val(data.fulladdress);
						$('#post').val(data.post);
						$('')

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
						if (data.favorite != null) {
							var favorites = data.favorite.split(',');

							favorites
									.forEach(function(fav) {
										fav = fav.trim(); // 공백 제거
										// value 속성에 해당하는 checkbox를 찾아서 체크
										$(
												'input[name="favorite"][value="'
														+ fav + '"]').prop(
												'checked', true);
									});
						}
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

	// 이미지 미리보기 기능
	document.getElementById('profileImageInput')
			.addEventListener(
					'change',
					function(event) {
						const input = event.target;
						if (input.files && input.files[0]) {
							const reader = new FileReader();
							reader.onload = function(e) {
								const preview = document
										.getElementById('imagePreview');
								preview.src = e.target.result;
								preview.style.display = 'block';

								// 프로필 이미지 업데이트 --- 여기서 구현되면 안됨
								/* const profileImage = document.getElementById('profileImage');
								profileImage.src = e.target.result; */
							}
							reader.readAsDataURL(input.files[0]);
						}
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

	//kakad map api
	function searchAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') {
					// 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else {
					// 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#post").val(data.zonecode);
				$("#address").val(addr);
				// 커서를 상세주소 필드로 이동한다.
				$("#fulladdress").focus();
			}
		}).open();
	}
</script>
</html>