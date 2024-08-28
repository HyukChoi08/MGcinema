<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제내역</title>
    <style>
        /* 전체 body 스타일 설정 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* 페이지 배경색 */
        }
        /* 프로필 섹션 스타일 */
        .profile-section {
            display: flex; /* 이미지와 텍스트를 옆으로 배치 */
            align-items: center; /* 수직 중앙 정렬 */
            padding: 20px;
            background-color: white; /* 프로필 섹션 배경색 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 프로필 섹션 그림자 효과 */
            width: 80%; /* 프로필 섹션의 너비 조정 */
            margin: 0 auto;
        }
        .profile-section img {
            border-radius: 50%; /* 이미지 원형으로 만들기 */
            margin-right: 15px; /* 이미지와 텍스트 사이 간격 */
        }
        .profile-section .profile-info {
            flex-grow: 1; /* 프로필 정보의 너비를 남은 공간에 맞추기 */
        }
        .button {
            background-color: #e50914; /* 버튼 배경색 */
            color: white;
            padding: 5px 20px;
            text-align: center; /* 텍스트 중앙 정렬 */
            border-radius: 5px; /* 모서리 둥글게 */
            text-decoration: none; /* 링크 밑줄 제거 */
            display: inline-block;
            margin-top: 10px;
        }
        .button:hover {
            background-color: #d10813; /* 버튼에 마우스 올렸을 때 색상 */
        }
        /* 메인 컨테이너 스타일 */
        .container {
            display: flex; /* 사이드바와 메인 콘텐츠를 옆으로 배치 */
            max-width: 1200px;
            margin: 20px auto;
        }
        /* 사이드바 스타일 */
        .sidebar {
            width: 25%; /* 사이드바 너비 */
            padding: 15px;
            background-color: #f7f7f7; /* 사이드바 배경색 */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* 사이드바 그림자 효과 */
            height: fit-content; /* 사이드바의 높이를 내용에 맞추기 */
        }
        /* 사이드바 내 리스트 스타일 */
        .sidebar ul {
            list-style-type: none;
            padding: 0; /* 기본 패딩 제거 */
        }
        .sidebar ul li {
            margin-bottom: 15px; /* 리스트 간 간격 */
        }
        .sidebar ul li a {
            text-decoration: none; /* 링크 밑줄 제거 */
            color: #333; /* 텍스트 색상 */
            font-weight: bold; /* 텍스트 굵게 */
        }
        .sidebar ul li a:hover {
            color: #e50914; /* 링크에 마우스 올렸을 때 색상 */
        }
        /* 메인 콘텐츠 스타일 */
        .main-content {
            width: 75%;
            padding: 15px;
            background-color: white; /* 메인 콘텐츠 배경색 */
            margin-left: 20px; /* 사이드바와 메인 콘텐츠 사이 간격 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 메인 콘텐츠 섹션 그림자 효과 */
        }
        /* 예매 내역과 문의 내역 섹션 스타일 */
        .my-history, .ask-section, .section {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f7f7f7; /* 배경색 */
            border: 1px solid #ddd; /* 테두리 색상 */
            border-radius: 5px; /* 모서리 둥글게 */
        }
    </style>
</head>
<body>
   <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    <!-- 프로필 섹션 -->
    <div class="profile-section">
        <img src="profile-placeholder.png" width="80" height="80">
        <div class="profile-info">
            <h2 id="nickname">Hi_Movie님</h2> 
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
                <h3>영화 결제 내역 </h3>
                <div class="my-history">
                    <button>내역 조회하기</button>
                </div>
            </div>
            <div>
                <thead >
                    <tr>
                        <th>구매일</th>
                        <th>주문번호</th>
                        <th>상품명</th>
                        <th>결제금액</th>
                        <th>상태</th>
                    </tr><br>
                    <tr>
                        <th>0</th>
                        <th>0</th>
                        <th>0</th>
                        <th>0</th>
                        <th>0</th>  
                    </tr>
                </thead>
                <div class="ask-section">
                    <button class="button">CGV 영화 예매 바로가기</button>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

</script>
</html>