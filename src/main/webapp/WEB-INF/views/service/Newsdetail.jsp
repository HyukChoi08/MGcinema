<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${newsDetail.title}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .banner {
            width: 100%;
            background-color: #e50914;
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 1.2em;
            font-weight: bold;
        }
        #container {
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 150px;
        }
        #contents {
            width: 100%;
            display: flex;
        }
        .sidebar {
            width: 20%;
            padding: 15px;
            background-color: #f7f7f7;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
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
            color: #333;
            font-weight: bold;
        }
        .sidebar ul li a:hover {
            color: #e50914;
        }
        .col-detail {
            width: 75%;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
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
        }
        .view_area p {
            line-height: 1.6;
            text-align: left; /* 텍스트 왼쪽 정렬 */
        }
        .col-detail p {
            text-align: left; /* 조회수 왼쪽 정렬 */
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
            background-color: #2196F3;
            color: white;
        }
        .btn-group button:hover {
            opacity: 0.9;
        }
        
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
    
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
