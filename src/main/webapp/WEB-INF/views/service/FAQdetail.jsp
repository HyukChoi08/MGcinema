<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${faqDetail.title}</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: black; /* 페이지 배경색을 검정으로 설정 */
            color: white; /* 전체 글씨색을 흰색으로 설정 */
        }

        #container {
            max-width: 1000px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 200px;
        }
        #contents {
            width: 100%;
            display: flex;
        }

        .sidebar {
            width: 20%;
            padding: 15px;
            background-color: #333; /* 사이드바 배경색 */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
            height: fit-content;
            color: white; /* 사이드바 글씨색 */
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            text-align: left;
        }

        .sidebar ul li {
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: white; /* 사이드바 링크 글씨색 */
            font-weight: bold;
        }

        .sidebar ul li a:hover {
            color: #e50914; /* 사이드바 링크 hover 색상 */
        }

        .col-detail {
    width: 100%;
    padding: 15px;
    background-color: black; /* 메인 콘텐츠 배경색 */
    color: white; /* 메인 콘텐츠 글씨색 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    border: 1px solid #fff; /* 메인 콘텐츠 테두리색 */
    height: 600px; /* 고정 높이 설정 */
    overflow-y: auto; /* 세로 스크롤 활성화 */
}

        .customer_top {
            margin-bottom: 20px;
        }

        .customer_top .tit {
            font-size: 1.5em;
            font-weight: bold;
            margin: 0;
            text-align: left;
        }

        .customer_top .stit {
            color: #777;
            font-size: 0.9em;
        }

        .view_area {
            margin-top: 20px;
            text-align: left;
        }

        .view_area pre {
            display: block; /* 기본 블록 레벨 요소로 설정 */
            white-space: pre-wrap; /* 공백과 줄 바꿈 유지 */
        }

        .view_area p {
            line-height: 1.6;
            text-align: left; /* 텍스트 왼쪽 정렬 */
        }

        .col-detail p {
            text-align: left; /* 조회수 왼쪽 정렬 */
        }

        .btn-group {
            margin-top: auto; /* 남은 공간을 차지하고 버튼을 하단으로 이동 */
            text-align: center; /* 버튼을 중앙 정렬 */
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

        
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
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
                    <p>작성일: ${formattedDate}</p>
                     <p class="stit">조회수: ${faqDetail.views}</p>
                </div>  
                <div class="view_area">
                    <pre>${faqDetail.content}</pre>
                </div>
                

                <!-- 버튼 그룹 -->
                <div class="btn-group">
                    <button class="btn-list" onclick="location.href='faq'">목록</button>
                  <!--   <button class="btn-edit" onclick="location.href='FAQedit?id=${faqDetail.id}'">수정</button>-->
              <!--       <button class="btn-delete" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='FAQdelete?id=${faqDetail.id}'">삭제</button>  -->
                </div>
            </div>
        </div>
    </div>

    <footer>
        <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
    </footer>
</body>
</html>
