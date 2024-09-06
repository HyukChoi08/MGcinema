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
            margin-top: 200px;
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
        }
        .search_area {
    margin-bottom: 20px;
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
}

.search_area input {
    padding: 10px;
    flex: 1; /* 버튼을 제외한 나머지 공간을 모두 차지하도록 설정 */
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-right: 10px; /* 버튼과의 간격 */
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
.searchtext {
    margin-bottom: 20px;
}

.searchtext ul {
    list-style-type: none;
    padding: 0;
    display: flex;
    border-bottom: 2px solid #e50914;
    margin: 0;
}

.searchtext li {
    margin: 0;
}

.searchtext a {
    display: block;
    padding: 10px;
    text-decoration: none;
    color: #333;
}

.searchtext a:hover {
    background-color: #f0f0f0;
}

.searchtext li.on a {
    font-weight: bold;
    border-bottom: 2px solid #e50914;
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
        .search_result {
    margin-bottom: 20px;
    text-align: left; /* 텍스트 왼쪽 정렬 */
    display: flex;
    align-items: center; /* 세로 정렬 */
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
            width: 10%; 
        }
        .tbl_notice_list th:nth-child(2) {
            width: 20%; 
        }
        .tbl_notice_list th:nth-child(3) {
            width: 40%;
        }
        .tbl_notice_list th:nth-child(4) {
            width: 15%;
        }
        .tbl_notice_list th:nth-child(5){
            width : 15%;    
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
        .customer_top {
    	text-align: left; /* 텍스트를 왼쪽 정렬로 변경 */
		}
        
        
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
                        <li class="on"><a href="faq">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li><a href="inquiry">이메일 문의</a></li>
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
                   <a href="/faqcreate" class="btn-add">	+</a>
                </div>
                
                <div class="searchtext">
    
    <ul>
    	<li><a href="/faq">전체</a></li>
        <li><a href="/faq?selected=홈페이지/모바일">홈페이지/모바일</a></li>
        <li><a href="/faq?selected=예매/매표">예매/매표</a></li>
        <li><a href="/faq?selected=결제수단">결제수단</a></li>
        <li><a href="/faq?selected=영화관이용">영화관이용</a></li>
        <li><a href="/faq?selected=특별관">특별관</a></li>
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
                                    <td>${faq.id}</td>
                                    <td>${faq.selected}</td>
                                    <td><a href="/FAQdetail?id=${faq.id}">${faq.title}</a></td>
                                    <td>${fn:substring(faq.createdAt, 0, 10)}</td>
                                    <td>${faq.views}</td>
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
