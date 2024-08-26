<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${serviceHome.title}</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        #container {
            width: 1000px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            overflow: hidden;
            padding: 20px;
        }

        #contents {
            display: flex;
        }

        .col-aside {
            flex: 1;
            max-width: 250px;
            background-color: #f9f9f9;
            padding: 20px;
            border-right: 1px solid #ddd;
        }

        .col-detail {
            flex: 3;
            padding: 20px;
        }

        header, footer {
            background-color: #fff;
            text-align: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
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
            color: black;
            font-size: 1em;
        }
        .snb ul li a:hover {
            text-decoration: underline;
        }
        .snb ul li.on a {
            font-weight: bold;
        }

        .search_area {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .search_area input {
            padding: 10px;
            width: calc(100% - 110px);
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 5px;
        }

        .search_area button {
            padding: 10px;
            background-color: #007bff;
            color: white;
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

        .c_tab_wrap ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            border-bottom: 2px solid #007bff;
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
            border-bottom: 2px solid #007bff;
        }

        .search_result {
            margin-bottom: 20px;
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

        .paging {
            margin: 20px 0;
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
        }

        .paging a:hover {
            background-color: #f0f0f0;
        }

        .paging .btn-paging {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .paging .btn-paging:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="container">
        <header>
            <!-- Header Content -->
        </header>
        
        <div id="contents">
            <div class="col-aside">
                <h2>고객센터 메뉴</h2>
                <div class="snb">
                    <ul>
                        <li><a href="serviceHome">고객센터 메인</a></li>
                        <li class="on"><a href="faq" title="현재선택">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li><a href="eaq">이메일 문의</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-detail">
                <div class="customer_top">
                    <h2 class="tit">자주찾는 질문</h2>
                    <p class="stit">회원님들께서 가장 자주하시는 질문을 모았습니다. <br>궁금하신 내용에 대해 검색해보세요.</p>
                </div>
                <div class="search_area">
                    <label for="searchtext" class="hidden">검색어 입력</label>
                    <input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요">
                    <button type="button" class="round inblack" title="검색하기">검색하기</button>
                </div>
                <div class="c_tab_wrap">
                    <ul class="c_tab type_free">
                        <li class="on"><a href="#">전체</a></li>
                        <li><a href="#">예매/매표</a></li>
                        <li><a href="#">관람권/결제수단</a></li>
                        <li><a href="#">멤버쉽/클럽서비스</a></li>
                        <li><a href="#">VIP관련</a></li>
                        <li><a href="#">할인혜택</a></li>
                        <li><a href="#">영화관이용</a></li>
                        <li><a href="#">특별관</a></li>
                        <li><a href="#">기프트샵</a></li>
                        <li><a href="#">홈페이지/모바일</a></li>
                    </ul>
                </div>
                <div class="search_result">
                    총<span class="num"> 0건</span>이 검색되었습니다.
                </div>
                <div class="tbl_area">
                    <table cellspacing="0" cellpadding="0" class="tbl_notice_list">
                        <caption>목록</caption>
                        <colgroup>
                            <col style="width:40px;">
                            <col style="width:120px;">
                            <col style="width:auto;">
                            <col style="width:120px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>분류</th>
                                <th>제목</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 데이터 반복 -->
                            <c:forEach var="faq" items="${faqList}">
                                <tr>
                                    <td class="no">${faq.id}</td>
                                    <td class="category">${faq.category}</td>
                                    <td><a href="/support/faq/view.jsp?no=${faq.id}">${faq.title}</a></td>
                                    <td class="date">${faq.date}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="paging">
                    <ul>
                        <li><a href="#" class="btn-paging">이전</a></li>
                        <li><a href="#" class="btn-paging">1</a></li>
                        <li><a href="#" class="btn-paging">2</a></li>
                        <li><a href="#" class="btn-paging">3</a></li>
                        <li><a href="#" class="btn-paging">다음</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <footer>
            <!-- Footer Content -->
        </footer>
    </div>
</body>
</html>
