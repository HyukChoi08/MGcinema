<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${faqDetail.title}</title>
    <style>
        /* 전체 body 스타일 설정 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* 페이지 배경색 */
        }
        /* 상단 배너 스타일 */
        .banner {
            width: 100%;
            background-color: #e50914; /* 배너 배경색 */
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 1.2em;
            font-weight: bold;
        }
        
        /* 메인 컨테이너 스타일 */
        #container {
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        /* 컨텐츠 영역 스타일 */
        #contents {
            width: 100%;
            display: flex;
        }
        /* 사이드바 스타일 */
        .sidebar {
            width: 20%; /* 사이드바 너비 */
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
            margin-bottom: 15px;
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
        .col-detail {
            width: 75%;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px; /* 하단 마진 추가 */
        }
        /* 고객센터 타이틀 스타일 */
        .customer_top {
            margin-bottom: 20px;
        }
        .customer_top .tit {
            font-size: 1.5em;
            font-weight: bold;
            margin: 0;
        }
        .customer_top .stit {
            color: #777;
            font-size: 0.9em;
        }
        /* FAQ 내용 스타일 */
        .view_area {
            margin-top: 20px;
        }
        .view_area p {
            line-height: 1.6;
        }
        /* 버튼 그룹 스타일 */
        .btn-group {
            text-align: center; /* 버튼 그룹을 중앙 정렬 */
            margin-top: 20px;
        }
        .btn-group button {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
            margin: 0 10px; /* 좌우 마진 추가 */
        }
        .btn-edit {
            background-color: #4CAF50; /* 수정 버튼 배경색 (초록색) */
            color: white;
        }
        .btn-delete {
            background-color: #f44336; /* 삭제 버튼 배경색 (빨간색) */
            color: white;
        }
        .btn-list {
            background-color: #2196F3; /* 목록 버튼 배경색 (파란색) */
            color: white;
        }
        .btn-group button:hover {
            opacity: 0.9;
        }
        /* 푸터 스타일 */
        footer {
            background-color: white;
            text-align: center;
            padding: 10px 0;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    
    <!--<header class="header">
        <nav class="navbar">
            <h1><a href="/">MG Cinema</a></h1>
            <ul class="nav-links">
                <li><a href="/login">로그인</a></li>
                <li><a href="/signup">회원가입</a></li>
                <li><a href="/myhome">My페이지</a></li>
                <li><a href="/serviceHome">고객센터</a></li>
            </ul>
        </nav>
    </header> -->

    <div id="container">
        <div id="contents">
            <!-- 사이드바 -->
            <div class="sidebar">
                <div class="snb">
                    <ul>
                        <li><a href="serviceHome">고객센터 메인</a></li>
                        <li><a href="faq">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li><a href="inquiry">이메일 문의</a></li>
                    </ul>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="col-detail">
                <div class="customer_top">
                	
                    <h2 class="tit">${faqDetail.title}</h2>
                    <p class="stit">작성일: ${faqDetail.createdAt}</p> <!-- LocalDateTime 그대로 출력 -->
                </div>
                <div class="view_area">
                    <p>${faqDetail.content}</p>
                </div>
                <p>조회수: ${faqDetail.views}</p>

                <!-- 버튼 그룹 -->
                <div class="btn-group">
    <button class="btn-list" onclick="location.href='faq'">목록</button>
 <button class="btn-edit" onclick="location.href='FAQedit?id=${faqDetail.id}'">수정</button>
    <button class="btn-delete" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='FAQdelete?id=${faqDetail.id}'">삭제</button> 
</div>
            </div>
        </div>
    </div>

    <footer>
       <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
    </footer>
</body>
</html>
