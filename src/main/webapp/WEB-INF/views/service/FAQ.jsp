<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터 FAQ</title>
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
            display: flex; /* Flexbox를 사용하여 열 배치 */
        }

        .col-aside {
            flex: 1;
            max-width: 220px;
            background-color: #f9f9f9;
            padding: 20px;
        }

        .col-detail {
            flex: 3;
            padding: 20px;
        }

        .snb ul {
            list-style-type: none;
            padding: 0;
        }

        .snb li {
            margin: 5px 0;
        }

        .snb a {
            text-decoration: none;
            color: #333;
        }

        .snb a.on {
            font-weight: bold;
            color: #007bff;
        }

        .search_area {
            margin-bottom: 20px;
        }

        .search_area input, .search_area button {
            padding: 10px;
            margin-right: 5px;
        }

        .search_area input {
            width: calc(100% - 110px);
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search_area button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
        }

        .c_tab_wrap {
            margin-bottom: 20px;
        }

        .c_tab_wrap ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            border-bottom: 2px solid #007bff;
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
        }

        .paging li {
            margin: 0 5px;
        }

        .paging a {
            text-decoration: none;
            color: #007bff;
        }

        .paging .btn-paging {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="container">
        <!-- Contents Area -->
        <div id="contents">
            <!-- 사이드바 (왼쪽) -->
            <div class="col-aside">
                <h2>고객센터 메뉴</h2>
                <div class="snb">
                    <ul>
                        <li><a href="#">고객센터 메인</a></li>
                        <li class="on"><a href="#" title="현재선택">자주찾는 질문</a></li>
                        <li><a href="#">공지/뉴스</a></li>
                        <li><a href="#">이메일 문의</a></li>
                        <li><a href="#">단체/ 대관 문의</a></li>
                    </ul>
                </div>
            </div>

            <!-- 콘텐츠 (오른쪽) -->
            <div class="col-detail">
                <div class="customer_top">
                    <h2 class="tit">자주찾는 질문</h2>
                    <p class="stit">회원님들께서 가장 자주하시는 질문을 모았습니다. <br>궁금하신 내용에 대해 검색해보세요.</p>
                </div>
                <div class="search_area">
                    <legend><label for="searchtext">검색</label></legend>
                    <input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요">
                    <button type="button" class="round inblack" title="검색하기">검색하기</button>
                    <div class="qu_txt">
                        <em>추천검색어 :</em>
                        <span class="first"> <a href="#none">현금영수증</a></span>
                        <span> <a href="#none">관람권</a></span>
                        <span> <a href="#none">예매</a></span>
                        <span> <a href="#none">환불</a></span>
                        <span> <a href="#none">취소</a></span>
                    </div>
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
                    총<span class="num">156건</span>이 검색되었습니다.
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
                            <tr>
                                <td class="no">1</td>
                                <td class="category">예매/매표</td>
                                <td><a href="/support/faq/view.aspx?no=1"></a></td>
                                <td class="date">2024-08-20</td>
                            </tr>
                            <!-- 추가 행들 -->
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
    </div>
</body>
</html>


