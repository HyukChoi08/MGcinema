<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주찾는 질문</title>
    <style>
        /* 기본 스타일 */
        /* ... 여기에 기존 스타일 추가 ... */
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
                        <li><a href="#">고객센터 메인</a></li>
                        <li class="on"><a href="#" title="현재선택">자주찾는 질문</a></li>
                        <li><a href="#">공지/뉴스</a></li>
                        <li><a href="#">이메일 문의</a></li>
                        <li><a href="#">단체/ 대관 문의</a></li>
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
                    총<span class="num"></span>건이 검색되었습니다.
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
                                    <td><a href="/service/faq/view?no=${faq.id}">${faq.title}</a></td>
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
