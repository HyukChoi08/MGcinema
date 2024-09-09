<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="/Header_css/Header.css">	
    <title>${newsDetail.title}</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: black; /* 기존 페이지와 일치하는 배경색 */
            color: white; /* 전체 글씨색 */
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
            color: #777; /* 기존 페이지와 일치하는 색상 */
            font-size: 0.9em;
            text-align: left;
        }
        .view_area {
            margin-top: 20px;
        }
        .view_area p {
            line-height: 1.6;
            text-align: left; /* 텍스트 왼쪽 정렬 */
        }
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
            margin: 0 10px;
        }
        .btn-edit {
            background-color: #4CAF50;
            color: white;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
        }
        .btn-list {
            background-color: #e50914; /* 버튼 배경색 */
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
        <div class="sidebar">
            <div class="snb">
                <ul>
                    <li><a href="/serviceHome">고객센터 메인</a></li>
                    <li><a href="/faq">자주찾는 질문</a></li>
                    <li><a href="/news">공지/뉴스</a></li>
                    <li><a href="/inquiry">이메일 문의</a></li>
                </ul>
            </div>
        </div>

        <div class="col-detail">
            <div class="customer_top">
                <h2 class="tit">${newsDetail.title}</h2>
                <p class="stit">작성일: ${newsDetail.created_at}</p>
            </div>
            <div class="view_area">
                <p>${newsDetail.content}</p>
            </div>
            <p>조회수: ${newsDetail.views}</p>

            <div class="btn-group">
                <button class="btn-list" onclick="location.href='/news'">목록</button>
            </div>
        </div>
    </div>
</div>
<footer>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</footer>
</body>
</html>
