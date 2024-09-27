<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  	
    <title>자주 찾는 질문</title>
    <link rel="stylesheet" href="/service/faq.css">
    <style>    	  
    </style>
</head>
<body>
 <%@ include file="/WEB-INF/views/header/header.jsp" %>

    <div id="container">
        <div id="contents">
            <!-- 사이드바 -->
            <div class="sidebar">
                <div class="snb">
                    <ul>
                        <li><a href="serviceHome">고객센터 메인</a></li>
                        <li class="hover-item"><a href="faq">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li><a href="inquiry">문의하기</a></li>
                    </ul>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="col-detail">
                <div class="customer_top">
                    <h2 class="tit">자주찾는 질문</h2>
                    <p class="stit">회원님들께서 가장 자주 하시는 질문을 모았습니다.</p>
                </div>

                <!-- 검색 영역 추가 -->
                <div class="search_area">
                    <form action="faq" method="get">
                        <input type="text" name="search" placeholder="검색어를 입력하세요" value="${param.search}" />
                        <button type="submit">검색</button>
                    </form>
                </div>

                <div class="search_result">
                    
                   총&nbsp; <span class="num">${totalFAQCount}건</span>&nbsp;
                   <!--  <a href="/faqcreate" class="btn-add">+</a>-->
                </div>
                
			<div class="searchtext">
   	 		<ul>
        		<li class="${param.selected == null ? 'on' : ''}"><a href="/faq">전체</a></li>
        		<li class="${param.selected == '홈페이지/모바일' ? 'on' : ''}"><a href="/faq?selected=홈페이지/모바일">홈페이지/모바일</a></li>
        		<li class="${param.selected == '예매/매표' ? 'on' : ''}"><a href="/faq?selected=예매/매표">예매/매표</a></li>
        		<li class="${param.selected == '결제수단' ? 'on' : ''}"><a href="/faq?selected=결제수단">결제수단</a></li>
        		<li class="${param.selected == '영화관이용' ? 'on' : ''}"><a href="/faq?selected=영화관이용">영화관이용</a></li>
        		<li class="${param.selected == '특별관' ? 'on' : ''}"><a href="/faq?selected=특별관">특별관</a></li>
    		</ul>
			</div>


                <div class="tbl_area">
                    <table class="tbl_notice_list">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">구분</th>
                                <th scope="col">제목</th>
                                <th scope="col">등록일</th>
                                <th scope="col">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="faq" items="${faqList}">
                                <tr>
                                    <td class="id">${faq.id}</td>
                                    <td class="select">${faq.selected}</td>
                                    <td class="title">
    								<c:choose>
        									<c:when test="${fn:length(faq.title) > 30}">
            									<a href="/FAQdetail?id=${faq.id}&page=${currentPage}">
                								${fn:substring(faq.title, 0, 30)}...
            									</a>
        									</c:when>
        								<c:otherwise>
            								<a href="/FAQdetail?id=${faq.id}&page=${currentPage}">
                							${faq.title}
            								</a>
        								</c:otherwise>
    								</c:choose>
									</td>
                                    <td class="create">${fn:substring(faq.created_at, 0, 10)}</td>
                                    <td class="view">${faq.views}</td>
                                </tr>
                            </c:forEach>

                            <!-- FAQ 항목이 없을 때 -->
                            <c:if test="${empty faqList}">
                                <tr>
                                    <td colspan="5" style="text-align: center;">FAQ 항목이 없습니다.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <div class="paging">
                    <c:if test="${currentPage > 1}">
                        <a href="/faq?page=${currentPage - 1}&size=${size}&search=${param.search}" class="btn-paging">이전</a>
                    </c:if>
                    <ul>
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <li><a href="/faq?page=${i}&size=${size}&search=${param.search}" class="${i == currentPage ? 'active' : ''}">${i}</a></li>
                        </c:forEach>
                    </ul>
                    <c:if test="${currentPage < totalPages}">
                        <a href="/faq?page=${currentPage + 1}&size=${size}&search=${param.search}" class="btn-paging">다음</a>
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