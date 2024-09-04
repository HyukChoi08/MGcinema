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
            display: flex;
            align-items: center;
        }
        .search_area input {
            padding: 10px;
            width: calc(100% - 120px);
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }
        .search_area button {
            padding: 10px;
            background-color: #e50914;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100px;
            font-size: 0.9em;
        }
        .search_area button:hover {
            background-color: #d10813;
        }
        .c_tab_wrap {
            margin-bottom: 20px;
        }
        .c_tab_wrap ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            border-bottom: 2px solid #e50914;
            margin: 0;
        }
        .c_tab_wrap li {
            margin: 0;
        }
        .c_tab_wrap a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #333;
        }
        .c_tab_wrap a:hover {
            background-color: #f0f0f0;
        }
        .c_tab_wrap li.on a {
            font-weight: bold;
            border-bottom: 2px solid #e50914;
        }
        .tbl_area {
            margin-bottom: 20px;
        }
        .tbl_notice_list {
            width: 100%;
            border-collapse: collapse;
        }
        .tbl_notice_list th, .tbl_notice_list td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .tbl_notice_list th {
            background-color: #f0f0f0;
        }
        .tbl_notice_list th:nth-child(1) {
            width: 10%; /* 번호 열 */
        }
        .tbl_notice_list th:nth-child(2) {
            width: 10%; /* 구분 열 */
        }
        .tbl_notice_list th:nth-child(3) {
            width: 50%; /* 제목 열 */
        }
        .tbl_notice_list th:nth-child(4) {
            width: 15%; /* 등록일 열 */
        }
        .tbl_notice_list th:nth-child(5) {
            width: 15%; /* 조회수 열 */
        }
        .paging {
            margin: 20px 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .paging ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            margin: 0;
        }
        .paging li {
            margin: 0 5px;
        }
        .paging a {
            text-decoration: none;
            color: #007bff;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 0.9em;
        }
        .paging a:hover {
            background-color: #f0f0f0;
        }
        .paging .btn-paging {
            background-color: #e50914;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
            margin: 0 5px;
        }
        .paging .btn-paging:hover {
            background-color: #d10813;
        }
        .btn-add {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
        }
        .btn-add:hover {
            background-color: #45a049;
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
                <table class="tbl_notice_list">
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">구분</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>ㅁㅁ
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
</footer>
</body>
</html>
