<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${serviceHome.title}</title>
    <style>
        /* 전체 body 스타일 설정 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* 페이지 배경색 */
        }
        /* 상단 배너 스타일 */
        .banner {
            width: 100%;
            background-color: #e50914; /* 배너 배경색 */
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 1.2em;
            font-weight: bold;
        }
        
        /* 메인 컨테이너 스타일 */
        #container {
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        /* 컨텐츠 영역 스타일 */
        #contents {
            width: 100%;
            display: flex;
        }
        /* 사이드바 스타일 */
        .sidebar {
            width: 20%; /* 사이드바 너비 */
            padding: 15px;
            background-color: #f7f7f7; /* 사이드바 배경색 */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* 사이드바 그림자 효과 */
            height: fit-content; /* 사이드바의 높이를 내용에 맞추기 */
        }
        /* 사이드바 내 리스트 스타일 */
        .sidebar ul {
            list-style-type: none;
            padding: 0; /* 기본 패딩 제거 */
        }
        .sidebar ul li {
            margin-bottom: 15px;
        }
        .sidebar ul li a {
            text-decoration: none; /* 링크 밑줄 제거 */
            color: #333; /* 텍스트 색상 */
            font-weight: bold; /* 텍스트 굵게 */
        }
        .sidebar ul li a:hover {
            color: #e50914; /* 링크에 마우스 올렸을 때 색상 */
        }
        /* 메인 콘텐츠 스타일 */
        .col-detail {
            width: 75%;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        /* 검색 영역 스타일 */
        .search_area {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .search_area input {
            padding: 10px;
            width: calc(100% - 120px); /* 버튼을 고려하여 폭 조정 */
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px; /* 버튼과의 간격 조정 */
        }
        .search_area button {
            padding: 10px;
            background-color: #e50914;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100px; /* 버튼 너비 조정 */
            font-size: 0.9em; /* 버튼 글씨 크기 조정 */
        }
        .search_area button:hover {
            background-color: #d10813;
        }
        /* 탭 메뉴 스타일 */
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
        /* 검색 결과 및 테이블 스타일 */
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
        /* 페이지네이션 스타일 */
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
            font-size: 0.9em; /* 페이지네이션 버튼 글씨 크기 조정 */
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
            font-size: 0.9em; /* 페이지네이션 버튼 글씨 크기 조정 */
            margin: 0 10px; /* 버튼 사이 간격 조정 */
        }
        .paging .btn-paging:hover {
            background-color: #d10813;
        }
        

		.btn-add {
   			 padding: 10px 15px;
    		background-color: #4CAF50; /* 추가 버튼 배경색 (예: 초록색) */
    		color: white;
    		border: none;
    		border-radius: 4px;
    		cursor: pointer;
    		font-size: 0.9em; /* 버튼 글씨 크기 조정 */
		}

		.btn-add:hover {
    		background-color: #45a049; /* 버튼에 마우스를 올렸을 때 색상 변경 */
		}
        /* 푸터 스타일 */
        footer {
            background-color: white;
            text-align: center;
            padding: 10px 0;
            border-top: 1px solid #ddd;
        }
    </style>
    <link rel="stylesheet" href="/Header_css/Header.css">    
</head>
<body>
    <header class="header">
        <nav class="navbar">
            <h1><a href="/">MG Cinema</a></h1>
            <ul class="nav-links">
                <li><a href="/login">로그인</a></li>
                <li><a href="/signup">회원가입</a></li>
                <li><a href="/myhome">My페이지</a></li>
                <li><a href="/serviceHome">고객센터</a></li>
            </ul>
        </nav>
    </header>

    <div id="container">
        <div id="contents">
            <!-- 사이드바 -->
            <div class="sidebar">
                <div class="snb">
                    <ul>
                        <li><a href="serviceHome">고객센터 메인</a></li>
                        <li class="on"><a href="faq">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li><a href="eaq">이메일 문의</a></li>
                    </ul>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="col-detail">
                <div class="customer_top">
                    <h2 class="tit">자주찾는 질문</h2>
                    <p class="stit">회원님들께서 가장 자주하시는 질문을 모았습니다. </p>
                </div>
                               
                <div class="search_result">
                    총<span class="num"> 0건</span>&nbsp;
                    <button type="button" class="btn-add" onclick="location.href='/FAQdetail?id=1'"> + </button>

                </div>
                 <div class="tbl_area">
                    <table class="tbl_notice_list">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">등록일</th>
                                <th scope="col">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="faq" items="${faqList}">
                                <tr>
                                    <td>${faq.id}</td>
                                    <td><a href="/FAQdetail?id=${faq.id}">${faq.title}</a></td>
                                    <td>${faq.createdAt}</td>
                                    <td>${faq.viewCount}</td>
                                </tr>
                            </c:forEach>
                            <!-- FAQ 항목이 없을 때 -->
                            <c:if test="${empty faqList}">    
                           </c:if>
                        </tbody>
                    </table>
                </div>               
                <div class="paging">
                <button type="button" class="btn-paging">이전</button>
                <ul>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                    </ul>
                    <button type="button" class="btn-paging">다음</button>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>MG Cinema &copy; 2024</p>
    </footer>
</body>
</html>

