<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${serviceHome.title}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        header, footer {
            width: 100%;
            background-color: #fff;
            text-align: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        #container {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #contents {
            width: 1000px;
            margin: 20px 0;
            display: flex;
        }
        .col-aside {
            width: 250px;
            margin-right: 20px;
        }
        .col-detail {
            flex: 1;
        }
        .snb {
            border: 1px solid black;
            padding: 15px;
            background-color: #fff;
        }
        .snb ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .snb ul li {
            margin-bottom: 10px;
        }
        .snb ul li a {
            text-decoration: none;
            color: #red;
            font-size: 1em;
        }
        .snb ul li a:hover {
            text-decoration: underline;
        }
        .snb ul li.on a {
            font-weight: bold;
        }
        .ad-area {
            margin-top: 20px;
        }
        .ad-partner01, .ad-partner02 {
            margin-bottom: 10px;
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
        }
        .paging ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .paging li {
            display: inline;
            margin-right: 5px;
        }
        .paging li a {
            text-decoration: none;
            color: #007bff;
        }
        .paging li a:hover {
            text-decoration: underline;
        }
        .paging .btn-paging {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .paging .btn-paging:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<header>
    <!-- <h1>${serviceHome.title}</h1> -->
</header>

<div id="container">
    <div id="contents">
        <div class="col-aside">
            <h2>고객센터 메뉴</h2>
            <div class="snb">
                <ul>
               		<li><a href="serviceHome">고객센터 메인<i></i></a></li>
                    <li><a href="faq">자주찾는 질문<i></i></a></li>
                    <li class="on"><a href="news">공지/뉴스<i></i></a></li>
                    <li><a href="eaq">이메일 문의<i></i></a></li>
                    
                </ul>
            </div>
         </div>

        <div class="col-detail">
            <div class="customer_top">
                <h2 class="tit">공지/뉴스</h2>
                <p class="stit">CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
            </div>
            <div class="search_area">
                <legend><label for="c_select">검색</label></legend>
                <select name="selsearchfield" id="selsearchfield" class="c_select" style="width:100px;">
                    <option value="0">제목</option>
                    <option value="1">내용</option>
                </select>
                <label for="searchtext" class="hidden">검색어 입력</label>
                <input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요" style="width:185px;">
                <button type="button" class="round inblack" title="검색하기" id="btn_search"><span>검색하기</span></button>
            </div>
            <div class="c_tab_wrap">
                <ul class="c_tab">
                    <li class="on"><a href="#">전체</a></li>
                    <li><a href="#">시스템점검</a></li>
                    <li><a href="#">극장</a></li>
                    <li><a href="#">행사/이벤트</a></li>
                    <li><a href="#">제휴이벤트</a></li>
                    <li><a href="#">기타</a></li>
                </ul>
            </div>
            <div class="search_result">
                총<span class="num"> 99999건</span>이 검색되었습니다.
            </div>
            <div class="tbl_area">
                <table cellspacing="0" cellpadding="0" class="tbl_notice_list"><Br>
                    <colgroup>
                        <col style="width:70px;">
                        <col style="width:160px;">
                        <col style="auto;">
                        <col style="width:140px;">
                        <col style="width:120px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col" class="tit">내용</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 데이터 반복 -->
                        <c:forEach var="news" items="${newsList}">
                            <tr>
                                <td>${news.id}</td>
                                <td>${news.title}</td>
                                <td class="txt">${news.content}</td>
                                <td class="num">${news.views}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="paging">
                <ul>
                    <li class="on"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                </ul>
                <button class="btn-paging end" type="button" onclick="2'">끝</button>
            </div>
        </div>
    </div>
</div>

<footer>
  
</footer>
</body>
</html>
