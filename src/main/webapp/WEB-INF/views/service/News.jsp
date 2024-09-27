<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${serviceHome.title}</title>
    <link rel="stylesheet" href="/service/notice.css">
    <style>      
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
                    <li class="hover-item"><a href="/news">공지/뉴스<i></i></a></li>
                    <li><a href="/inquiry">문의하기<i></i></a></li>
                </ul>
            </div>
        </div>

        <div class="col-detail">
            <div class="customer_top">
                <h2 class="tit">공지/뉴스</h2>
                <p class="stit">주요한 이슈 및 여러 가지 소식들을 확인하실 수 있습니다.</p>
            </div>
            
            <!-- 검색 영역 추가 -->
            <div class="search_area">
                <form action="/news" method="get">
                    <input type="text" name="search" placeholder="검색어를 입력하세요" value="${search}" />
                    <button type="submit">검색</button>
                </form>
            </div>
            <div class="total-count">
                총 <span class="num">${totalNewsCount}건</span>
            </div>

            <div class="c_tab_wrap">
                <ul>
                    <li class="${empty selected ? 'on' : ''}">
                        <a href="/news">전체</a>
                    </li>
                    <li class="${selected == '시스템점검' ? 'on' : ''}">
                        <a href="/news?selected=시스템점검">시스템점검</a>
                    </li>
                    <li class="${selected == '극장' ? 'on' : ''}">
                        <a href="/news?selected=극장">극장</a>
                    </li>
                    <li class="${selected == '기타' ? 'on' : ''}">
                        <a href="/news?selected=기타">기타</a>
                    </li>
                </ul>
            </div>
            
            <div class="tbl_area">
                <table class="tbl_notice_list">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>구분</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="itemsPerPage" value="10" /> <!-- 페이지당 항목 수 -->
                        <c:set var="startIndex" value="${(currentPage - 1) * itemsPerPage}" /> <!-- 시작 인덱스 계산 -->
                        <c:forEach var="news" items="${newsList}" varStatus="status">
                            <tr>
                                <td class="id">${startIndex + status.index + 1}</td> <!-- 시작 인덱스와 상태 인덱스를 조합 -->
                                <td class="select">${news.selected}</td>
                                <td class="title">
                                    <c:choose>
                                        <c:when test="${fn:length(news.title) > 30}">
                                            <a href="/newsDetail?id=${news.id}&page=${currentPage}&selected=${news.selected}">
                                                ${fn:substring(news.title, 0, 30)}...
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/newsDetail?id=${news.id}&page=${currentPage}&selected=${news.selected}">
                                                ${news.title}
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="created">${news.created_at}</td>
                                <td class="view">${news.views}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="paging">
                <c:if test="${currentPage > 1}">
                    <a href="/news?page=${currentPage - 1}&size=${size}&search=${search}" class="btn-paging">이전</a>
                </c:if>
                <ul>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li>
                            <a href="/news?page=${i}&size=${size}&search=${search}" class="${i == currentPage ? 'active' : ''}">
                                ${i}
                            </a>    
                        </li>
                    </c:forEach>
                </ul>
                <c:if test="${currentPage < totalPages}">
                    <a href="/news?page=${currentPage + 1}&size=${size}&search=${search}" class="btn-paging">다음</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<footer>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</footer>
</body>
</html>
