<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <style>
        /* 전체 body 스타ㅇ,ㄹ */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* 페이지 배경색 */
        }
        /* 메인 컨테이너 스타일 */
        .container {
            display: flex; /* 사이드바와 메인 콘텐츠를 옆으로 배치 */
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: white; /* 컨테이너 배경색 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 컨테이너 그림자 효과 */
        }
        /* 사이드바 스타일 */
        .sidebar {
            width: 20%;
            padding: 15px;
            background-color: #f7f7f7; /* 사이드바 배경색 */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* 사이드바 그림자 효과 */
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
            width: 80%;
            padding: 15px;
        }
        /* 공통 섹션 마진 설정 */
        .profile-section, .my-history, .ask-section, .my-cgv-home, .footer-section {
            margin-bottom: 20px;
        }
        /* 프로필 섹션 스타일 */
        .profile-section {
            display: flex; /* 이미지와 텍스트를 옆으로 배치 */
            align-items: center; /* 수직 중앙 정렬 */
        }
        .profile-section img {
            border-radius: 50%; /* 이미지 원형으로 만들기 */
            margin-right: 15px; /* 이미지와 텍스트 사이 간격 */
        }
        .profile-section .profile-info {
            flex-grow: 1; /* 프로필 정보의 너비를 남은 공간에 맞추기 */
        }
        /* 예매 내역과 문의 내역 섹션 스타일 */
        .my-history, .ask-section {
            display: flex; /* 내부 콘텐츠들을 옆으로 배치 */
            justify-content: space-between; /* 내부 콘텐츠들 사이 간격을 자동으로 배치 */
        }
        .my-history div, .ask-section div {
            width: 100%;
            padding: 10px;
            background-color: #f7f7f7; /* 배경색 */
            border: 1px solid #ddd; /* 테두리 색상 */
            border-radius: 5px; /* 모서리 둥글게 */
        }
        /* 버튼 스타일 */
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
    </style>
</head>
<body>
    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar">
            <ul>
                <li><a href="#">MY CGV HOME</a></li>
                <li><a href="#">나의 예매정보</a></li>
                <li><a href="#">결제 내역</a></li>
                <li><a href="#">1:1 문의</a></li>
                <li><a href="#">개인 정보 변경</a></li>
                <li><a href="#">회원 탈퇴</a></li>
            </ul>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="main-content"> <!-- class name 변경: main-history -> main-content -->
            <!-- 프로필 섹션 -->
            <div class="profile-section">
                <img src="profile-placeholder.png" width="80" height="80">
                <div class="profile-info">
                    <h2>Hi_Movie님</h2>
                    <p>고객님은 <strong>일반</strong> 고객 입니다.</p>
                </div>
                <a href="#" class="button">닉네임 설정</a>
            </div>

            <!-- 예매 내역 섹션 -->
            <div class="my-history">
                <div>
                    <h2>나의 예매내역</h2>
                    <p></p>
                    <button class="button">CGV 영화 예매 바로가기</button>
                </div>
            </div>

            <!-- 문의 내역 섹션 -->
            <div class="ask-section">
                <div>
                    <h2><strong>나의 1:1 문의 내역</strong></h2>
                    <p></p>
                    <button class="button">1:1 문의내역 바로가기</button>
                </div>
            </div>

            <!-- My CGV Home 섹션 -->
            <div class="my-cgv-home">
                <h3>MY CGV HOME</h3>
                <div class="my-movie-info">
                    <p>청소년 등급 영화</p>
                </div>
                <div class="my-movie-info">
                    <p>극장관 정보</p>
                </div>
                <div class="my-movie-info">
                    <p>스토어 바로가기</p>
                </div>
            </div><br><br><br>

            <!-- 푸터 섹션 -->
            <div class="footer-section">
                <p>보고싶은 영화가 있나요?</p>
                <a href="#" class="button">상영중인 영화 바로가기</a>
            </div>
        </div>
    </div>
</body>
</html>
