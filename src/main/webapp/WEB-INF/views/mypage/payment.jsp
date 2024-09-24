<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cinema.mypage.CustomerDTO"%>
<%
    // 세션에서 customerDTO 객체 가져오기
    CustomerDTO customer = (CustomerDTO) session.getAttribute("cusDTO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스토어 결제내역</title>
<script src="https://kit.fontawesome.com/3a115195d8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/mypage_css/mypage.css">
<style>
/* 스타일을 여기에 추가하세요 */
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<!-- 헤더 포함 -->

	<!-- 프로필 섹션 -->
	<div class="mainscreen">
		<div class="profile-section">
			<img id="profileImage" src="<%= customer.getProfileimg() != null ? customer.getProfileimg() : "/mypage_image/profile.png" %>" alt="프로필이미지" width="80" height="80" />
			<!-- <img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80" /> -->
			<div class="profile-info">
				<h2><%=customer.getRealname()%>
					님
				</h2>
				<div>
					닉네임 : <span id="nickname"><%=customer.getNickname()%>_</span>
					<!-- 닉네임 수정 아이콘 클릭 시 모달 표시 -->
					<a href="javascript:void(0)" id="editNicknameBtn"> <i
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
				<!-- 스토어 결제 이력 섹션 -->
				<div>
					<h3>스토어 결제 내역</h3>
					<div class="my-historypayment">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>상품명</th>
									<th>구성</th>
									<th>결제금액</th>
									<th>구매일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty storeList}">
										<c:forEach var="getPlist" items="${storeList}"
											varStatus="status">
											<tr>
												<td>${status.index + 1}</td>
												<td>${getPlist.itemName}</td>
												<td>${getPlist.composition}</td>
												<td>${getPlist.totalprice}</td>
												<td>${getPlist.created}</td>
												<td class="retd">
													<button class="cancel-btn" data-id="${getPlist.id}">결제취소</button>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6">결제 내역이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
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

				<!-- 스토어 결제 취소내역 섹션 -->
				<h3>스토어 결제 취소내역</h3>
				<div class="my-historypayment">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>상품명</th>
								<th>구성</th>
								<th>결제금액</th>
								<th>구매일</th>
								
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty canceledPayments}">
									<c:forEach var="payment" items="${canceledPayments}"
									varStatus="status1">
											<tr>
												<td>${status1.index + 1}</td>
											<td>${payment.itemName}</td>
											<td>${payment.composition}</td>
											<td>${payment.totalprice}</td>
											<td>${payment.created}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">결제 취소 내역이 없습니다.</td>
									</tr>
								</c:otherwise>
								
							</c:choose>
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
					<button class="button" onclick="location.href='/store'">Store
						바로가기</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<!-- 푸터 포함 -->
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script>
        // 닉네임 변경 모달
        var modal = document.getElementById("nicknameModal");
        var btn = document.getElementById("editNicknameBtn");
        var span = document.getElementsByClassName("close")[0];
        var saveBtn = document.getElementById("saveNicknameBtn");

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        saveBtn.onclick = function() {
            var newNickname = document.getElementById("newNickname").value;
            if (newNickname) {
                // 서버에 새로운 닉네임을 저장하도록 AJAX 요청을 보낼 수 있습니다.
                alert("닉네임이 변경되었습니다.");
                modal.style.display = "none";
            }
        }
     // 결제 취소 버튼 클릭 시 AJAX 요청
        $(document).ready(function() {
            $(".cancel-btn").click(function() {
                var paymentId = $(this).data("id"); // 버튼의 data-id 속성에서 결제 ID를 가져옴
                if (confirm("정말로 결제를 취소하시겠습니까?")) {
                    $.ajax({
                        url: "/cancelPayment", // 요청할 URL
                        type: "POST",
                        data: { id: paymentId }, // 서버에 전달할 데이터
                        success: function(response) {
                            if (response === "success") {
                                alert("결제가 성공적으로 취소되었습니다.");
                                // 페이지 새로고침 또는 해당 결제 내역 행을 제거하는 방법
                                location.reload(); // 전체 페이지 새로고침
                            } else {
                                alert("결제 취소에 실패했습니다.");
                            }
                        },
                        error: function() {
                            alert("에러가 발생했습니다. 다시 시도해주세요.");
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
