<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${serviceHome.title}</title>
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
        }
        .search_area {
            margin-bottom: 20px;
        }
        .search_area input[type="text"] {
            padding: 5px;
            width: 185px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search_area button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .search_area button:hover {
            background-color: #0056b3;
        }
        .c_tab_wrap {
            margin-bottom: 20px;
        }
        .c_tab {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .c_tab li {
            display: inline;
            margin-right: 10px;
        }
        .c_tab li a {
            text-decoration: none;
            color: #007bff;
        }
        .c_tab li.on a {
            font-weight: bold;
        }
        .c_tab li a:hover {
            text-decoration: underline;
        }
        .tbl_area {
            margin-bottom: 20px;
        }
        .tbl_notice_list {
            width: 100%;
            border-collapse: collapse;
        }
        .tbl_notice_list th, .tbl_notice_list td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .tbl_notice_list th {
            background-color: #f4f4f4;
        }
        .paging {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .paging .btn-paging {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 5px;
        }
        .paging .btn-paging:hover {
            background-color: #0056b3;
        }
        .paging ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
        }
        .paging li {
            margin: 0 5px;
        }
        .paging li a {
            text-decoration: none;
            color: #007bff;
        }
        .paging li a:hover {
            text-decoration: underline;
        }
        .paging .active {
            font-weight: bold;
        }
        footer { 
            background-color: white;
            text-align: center;
            padding: 10px 0;
            border-top: 1px solid #ddd;
        }
    </style>
    <link rel="stylesheet" href="/Header_css/Header.css">    
</head>
<body>
<header class="header">
    <nav class="navbar">
        <h1><a href="/">MG Cinema</a></h1>
        <ul class="nav-links">
            <li><a href="/login">로그인</a></li>
            <li><a href="/signup">회원가입</a></li>
            <li><a href="/myhome">My페이지</a></li>
            <li><a href="/serviceHome">고객센터</a></li>
        </ul>
    </nav>
</header>   

<div id="container">
    <div id="contents">
        <div class="sidebar">
            <div class="snb">
                <ul>
                    <li><a href="/serviceHome">고객센터 메인<i></i></a></li>
                    <li><a href="/faq">자주찾는 질문<i></i></a></li>
                    <li class="on"><a href="/news">공지/뉴스<i></i></a></li>
                    <li><a href="/eaq">이메일 문의<i></i></a></li>
                </ul>
            </div>
        </div>

        <div class="col-detail">
            <div class="customer_top">
                <h2 class="tit">공지/뉴스</h2>
                <p class="stit">MG Cinema의 주요한 이슈 및 여러 가지 소식들을 확인하실 수 있습니다.</p>
            </div>
            
            <div class="tbl_area">
                <table cellspacing="0" cellpadding="0" class="tbl_notice_list">
                    <colgroup>
                        <col style="width:70px;">
                        <col style="width:160px;">
                        <col style="auto;">
                        <col style="width:140px;">
                        <col style="width:120px;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col" class="tit">내용</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="news" items="${newsList}">
                            <tr>
                                <td>${news.id}</td>
                                <td>${news.title}</td>
                                <td><a href="/newsDetail?id=${news.id}">${news.content}</a></td>
                                <td>${news.created_at}</td>
                                <td>${news.views}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="paging">
                <c:if test="${currentPage > 1}">
                    <a href="/news?page=${currentPage - 1}&size=${size}" class="btn-paging">이전</a>
                </c:if>
                <ul>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li>
                            <a href="/news?page=${i}&size=${size}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
                <c:if test="${currentPage < totalPages}">
                    <a href="/news?page=${currentPage + 1}&size=${size}" class="btn-paging">다음</a>
                </c:if>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>MG Cinema &copy; 2024</p>
</footer>
</body>
</html>
