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
<title>1:1 문의</title>
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<!-- 프로필 섹션 -->
	<div class="mainscreen">
		<div class="profile-section">
			<img id="profileImage"
				src="<%=customer.getProfileimg() != null ? customer.getProfileimg() : "/mypage_image/profile.png"%>"
				alt="프로필이미지" width="80" height="80" />
			<div class="profile-info">
				<h2><%=customer.getRealname()%>
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
					<%=customer.getUid()%></div>
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
				<h2>1:1 문의 게시판</h2>

				<!-- 문의 작성 및 상세보기 -->
				<div class="inquiry-detail">
					<c:choose>
						<c:when test="${view == 'inquirywrite'}">
							<h3>문의 작성</h3>
							<form action="/inquirywrite" method="post">
								<table>
									<tr>
										<td>제목</td>
										<td><input type="text" name="title" id="inputcreated"
											required /></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea name="content" required></textarea></td>
									</tr>
									<tr>
										<td colspan="2"><input class="inputbtn" type="submit"
											value="등록" />
											<button colspan="2" type="button" class="inputbtn"
												onclick="location.href='/inquiry'">뒤로가기</button></td>
									</tr>
								</table>
							</form>
						</c:when>

						<c:when test="${view == 'inquirydetail'}">
							<h3>상세보기</h3>
							<table>
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" id="inputcreated"
										value="${inquiry.title}" readonly /></td>
								</tr>
								<tr>
									<td class="noline">내용</td>
									<td class="noline"><textarea name="content" rows="10"
											cols="50" readonly>${inquiry.content}</textarea></td>
								</tr>
								<tr>
									<td>작성일자</td>
									<td><input type="text" name="created" id="inputcreated"
										value="${inquiry.created}" readonly /></td>
								</tr>

								<c:if test="${inquiry.current == '답변완료'}">
									<div>
										<tr>
											<td colspan="2" class="noline">
												<h3>관리자 답변</h3>
											</td>
										</tr>
										<tr>
											<td class="noline">답변내용</td>
											<td class="noline"><textarea name="answer" rows="10"
													cols="50" readonly>${inquiry.answer}</textarea></td>
										</tr>
										<tr>
											<td>답변일자</td>
											<td><input type="text" name="ancreated"
												id="inputcreated" value="${inquiry.ancreated}" readonly /></td>
										</tr>
									</div>
								</c:if>
								
							</table>
							<button type="button" class="inputbtn"
												onclick="location.href='/inquiry'">뒤로가기</button></td>
						</c:when>
						
					</c:choose>
					
				</div>
					
				<!-- 나의 문의 내역 -->
				<h3>나의 문의 내역</h3>
				<table border="1" class="inquiry-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="inquiry" items="${inquiries}" varStatus="status">
							<tr>
								<td><c:out value="${status.index + 1}" /></td>
								<td><a href='/inquirydetail/${inquiry.id}'>${inquiry.title}</a></td>
								<td>${inquiry.created}</td>
								<td>${inquiry.current}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- 페이징 처리 -->
				<div class="pagination">
					<c:if test="${currentPage > 1}">
						<a href="?page=${currentPage - 1}">이전</a>
					</c:if>
					<c:forEach var="i" begin="1" end="${totalPages}">
						<c:choose>
							<c:when test="${i == currentPage}">
								<span>${i}</span>
							</c:when>
							<c:otherwise>
								<a href="?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPages}">
						<a href="?page=${currentPage + 1}">다음</a>
					</c:if>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
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