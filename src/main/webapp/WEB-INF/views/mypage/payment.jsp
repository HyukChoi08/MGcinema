<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cinema.mypage.CustomerDTO"%>
<%
    // 세션에서 cusrDTO 객체 가져오기
    CustomerDTO customer = (CustomerDTO) session.getAttribute("cusDTO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스토어 결제내역</title>
    <script src="https://kit.fontawesome.com/3a115195d8.js" crossorigin="anonymous"></script>
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
            <img src="/mypage_image/OO.png" alt="프로필 이미지" width="80" height="80" />
            <div class="profile-info">
                <h2><%= customer.getRealname() %> 님</h2>
                <div>
                    닉네임: <span id="nickname"><%= customer.getNickname() %></span>
                    <!-- 닉네임 수정 아이콘 클릭 시 모달 표시 -->
                    <a href="javascript:void(0)" id="editNicknameBtn">_<i class="fa-solid fa-pen"></i></a>
                </div>
                <div>아이디: <%= customer.getUid() %></div>
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
                    <li><a href="/payment">스토어 결제 내역</a></li>
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
                    <div class="my-history">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>상품명</th>
                                    <th>결제금액</th>
                                    <th>구매일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty storeList}">
                                        <c:forEach var="getPlist" items="${storeList}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${getPlist.itemName}</td>
                                                <td>${getPlist.totalprice}</td>
                                                <td>${getPlist.created}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="4">결제 내역이 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>

                        <c:if test="${totalPages > 1}">
                            <div class="pagination">
                                <c:if test="${currentPage > 1}">
                                    <a href="?page=${currentPage - 1}">이전</a>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <a href="?page=${i}"
                                       class="${i == currentPage ? 'current' : ''}">${i}</a>
                                </c:forEach>
                                <c:if test="${currentPage < totalPages}">
                                    <a href="?page=${currentPage + 1}">다음</a>
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div>
                    <div class="ask-section">
                        <button class="button" onclick="location.href='/store'">HIII Store 바로가기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/footer/footer.jsp"%>
    <!-- 푸터 포함 -->

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
                        url: '/updateNickname',
                        method: 'POST',
                        data: {
                            nickname: newNickname
                        },
                        success: function(response) {
                            alert(response); // 서버로부터 성공 메시지 받기
                            location.reload(); // 페이지 새로고침해서 닉네임 업데이트 반영
                        },
                        error: function() {
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
</body>
</html>
