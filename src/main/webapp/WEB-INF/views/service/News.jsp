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
            margin: 0;
            padding: 0;
            background-color: black; /* 페이지 배경색 */
            color: white; /* 전체 글씨색 */
            font-family: Arial, sans-serif;
        }
        .banner {
            width: 100%;
            background-color: #e50914; /* 배너 배경색 */
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
            background-color: #333; /* 사이드바 배경색 */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
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
            color: white; /* 사이드바 링크 글씨색 */
            font-weight: bold;
        }
        .sidebar ul li a:hover {
            color: #e50914; /* 사이드바 링크 hover 색상 */
        }
        .col-detail {
    		width: 75%;
    		padding: 15px;
   	 		background-color: black; /* 메인 콘텐츠 배경색 */
    		color: white; /* 메인 콘텐츠 글씨색 */
    		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    		border: 1px solid #fff; /* 메인 콘텐츠 테두리색 */
    		border-radius: 5px;
		}
		.search_area {
            margin-bottom: 20px;
            text-align: left;
            display: flex;
            align-items: center;
        }
        .search_area input {
            padding: 10px;
            flex: 1; /* 버튼을 제외한 나머지 공간을 모두 차지하도록 설정 */
            border: 1px solid #fff;
            border-radius: 4px;
            margin-right: 10px; /* 버튼과의 간격 */
            color: black; /* 검색 박스 텍스트 색상 */
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
            color: white; /* 탭 링크 색상 */
        }
        .c_tab_wrap a:hover {
            background-color: #333; /* 탭 링크 hover 색상 */
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
            border: 1px solid #fff; /* 테두리 색상 */
            text-align: left;
            color: white; /* 테이블 내 글씨색 */
        }
        .tbl_notice_list th {
            background-color: #333; /* 테이블 헤더 배경색 */
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
            border: 1px solid #fff; /* 페이지 네이션 테두리 색상 */
            border-radius: 4px;
            font-size: 0.9em;
        }
        .paging a:hover {
            background-color: #333; /* 페이지 네이션 hover 색상 */
        }
        .paging .btn-paging {
            background-color: #333	;
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
            background-color: #e50914; /* 버튼 배경색 */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
        }
        .btn-add:hover {
            background-color: #d10813;
        }
        .customer_top {
            text-align: left; /* 텍스트를 왼쪽 정렬로 변경 */
        }
        .total-count {
            text-align: left; /* 왼쪽 정렬 */
            margin-bottom: 20px; /* 아래쪽 여백 추가 */
        }
        /* 모든 링크에 대해 기본 색상을 흰색으로 설정 */
		a {
    		color:  white;	 /* 기본 링크 색상 흰색으로 설정 */
    		text-decoration: none; /* 링크 밑줄 제거 */
		}

			/* 링크에 마우스를 올렸을 때 스타일 */
		a:hover {
    		text-decoration: underline; /* 마우스를 올렸을 때 밑줄 추가 */
		}

		/* 테이블 내 링크에 대해 색상 설정 (이 부분은 선택 사항입니다) */
		.tbl_notice_list a {
    	color:  #C0C0C0 /* 테이블 내 링크 색상 흰색으로 설정 */
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
                    <li><a href="/inquiry">이메일 문의<i></i></a></li>
                </ul>
            </div>
        </div>

        <div class="col-detail">
            <div class="customer_top">
                <h2 class="tit">공지/뉴스</h2>
                <p class="stit">MG Cinema의 주요한 이슈 및 여러 가지 소식들을 확인하실 수 있습니다.</p>
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
                        <c:forEach var="news" items="${newsList}">
                            <tr>
                                <td>${news.id}</td>
                                <td>${news.selected}</td>
                               <td><a href="/newsDetail?id=${news.id}">${news.title}</a></td>
                                <td>${news.created_at}</td>
                                <td>${news.views}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="/news?page=${currentPage - 1}&size=${size}&search=${search}">‹ 이전</a>
                </c:if>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span>${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="/news?page=${i}&size=${size}&search=${search}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="/news?page=${currentPage + 1}&size=${size}&search=${search}">다음 ›</a>
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
