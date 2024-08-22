<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>FAQ 페이지</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* 컨테이너 스타일 */
        .col-detail {
            width: 1000px;
            margin: 0 auto; /* 가운데 정렬 */
            padding: 20px;
        }

        .customer_top {
            margin-bottom: 20px;
        }

        .tit {
            font-size: 24px;
            font-weight: bold;
        }

        .stit {
            font-size: 16px;
            color: #555;
        }

        /* 검색 영역 스타일 */
        .search_area {
            margin-bottom: 20px;
        }

        .search_area legend {
            display: none; /* 숨기기 */
        }

        .c_input {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .round.inblack {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .qu_txt {
            margin-top: 10px;
            font-size: 14px;
        }

        .qu_txt a {
            color: #007bff;
            text-decoration: none;
        }

        .qu_txt a:hover {
            text-decoration: underline;
        }

        /* 탭 스타일 */
        .c_tab_wrap {
            margin-bottom: 20px;
        }

        .c_tab {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .c_tab li {
            display: inline;
            margin-right: 10px;
        }

        .c_tab li a {
            text-decoration: none;
            font-size: 11px;
            color: #333;
        }

        .c_tab li.on a {
            font-weight: bold;
        }

        /* 검색 결과 스타일 */
        .search_result {
            margin-bottom: 20px;
            font-size: 14px;
            color: #666;
        }

        /* 테이블 스타일 */
        .tbl_area {
            margin-bottom: 20px;
        }

        .tbl_notice_list {
            width: 100%;
            border-collapse: collapse;
        }

        .tbl_notice_list th,
        .tbl_notice_list td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left; /* 왼쪽 정렬 */
        }

        .tbl_notice_list th {
            background-color: #f4f4f4;
        }

        .tbl_notice_list .tit a {
            color: #007bff;
            text-decoration: none;
        }

        .tbl_notice_list .tit a:hover {
            text-decoration: underline;
        }

        .num {
            text-align: center; /* 정렬 스타일 유지 */
        }

        /* 페이지 네비게이션 스타일 */
        .paging {
            margin-bottom: 20px;
        }

        .paging ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .paging li {
            display: inline;
            margin-right: 5px;
        }

        .paging a {
            text-decoration: none;
            color: #007bff;
        }

        .paging .on a {
            font-weight: bold;
        }

        .btn-paging {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .btn-paging.end {
            background-color: #444;
        }

        /* 검색 순서 스타일 */
        .search_order {
            text-align: left; /* 왼쪽 정렬 */
            font-size: 14px;
        }

        .search_order ol {
            padding-left: 20px;
        }

        .search_order li {
            margin-bottom: 10px;
        }

        .search_order a {
            color: #007bff;
            text-decoration: none;
        }

        .search_order a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="col-detail">
        <div class="customer_top">
            <h2 class="tit">자주 찾는 질문</h2>
            <p class="stit">회원님들께서 가장 자주 하시는 질문을 모았습니다. <br>궁금하신 내용에 대해 검색해보세요.</p>
        </div>

        <div class="search_area">
            <legend><label for="searchtext">검색</label></legend>
            <input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요" value="" style="width:275px;">
            <button type="button" class="round inblack" title="검색하기" id="btn_search"><span>검색하기</span></button>
            <div class="qu_txt">
                <em>추천 검색어 :</em>
                <span class="first"><a href="#none">현금영수증</a></span>
                <span><a href="#none">관람권</a></span>
                <span><a href="#none">예매</a></span>
                <span><a href="#none">환불</a></span>
                <span><a href="#none">취소</a></span>
            </div>
        </div>

        <div class="c_tab_wrap">
            <ul class="c_tab type_free">
                <li class="on"><a href="#" style="font-size: 11px;" title="선택된 탭 메뉴">전체</a></li>
                <li><a href="#" style="font-size: 11px;">예매/매표</a></li>
                <li><a href="#" style="font-size: 11px;">관람권/결제수단</a></li>
                <li><a href="#" style="font-size: 11px;">멤버쉽/클럽서비스</a></li>
                <li><a href="#" style="font-size: 11px;">VIP 관련</a></li>
                <li><a href="#" style="font-size: 11px;">할인혜택</a></li>
                <li><a href="#" style="font-size: 11px;">영화관 이용</a></li>
                <li><a href="#" style="font-size: 11px;">특별관</a></li>
                <li><a href="#" style="font-size: 11px;">기프트샵</a></li>
                <li><a href="#" style="font-size: 11px;">홈페이지/모바일</a></li>
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
                    <col style="width:560px;">
                    <col style="auto">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">구분</th>
                        <th scope="col" class="tit">제목</th>
                        <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 여기에 FAQ 데이터가 동적으로 추가됩니다. -->
                    <tr class="first">
                        <td>1</td>
                        <td>ㅋㅋ</td>
                        <td id="title0" class="txt"><a href="#">ㅋㅋ</a></td>
                        <td class="num">537963</td>
                    </tr>
                    <!-- 나머지 FAQ 항목들... -->
                </tbody>
            </table>
        </div>

        <div class="paging">
            <ul>
                <li class="on"><a title="1 페이지 선택" href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a href="#">7</a></li>
                <li><a href="#">8</a></li>
                <li><a href="#">9</a></li>
                <li><a href="#">10</a></li>
                <li><a class="btn-paging end" href="#">끝</a></li>
            </ul>
        </div>

        <div class="search_order">
            <ol>
                <li><span class="ico_oder find_q">01 자주 찾는 질문 검색</span></li>
                <li><span class="ico_oder email_i">02 이메일 문의</span><a href="#"><img src="http://img.cgv.co.kr/support/faq/btn_inquiry.png" alt="문의"></a></li>
                <li><span class="ico_oder tel_i">03 고객센터 전화문의</span><span class="num">112233334444<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(상담 가능 시간, 월~금 09:00~18:00)</span></li>
            </ol>
        </div>
    </div>
</body>
</html>
