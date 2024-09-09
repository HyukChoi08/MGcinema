<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${serviceHome.title}</title>
    
    <link rel="stylesheet" href="/Header_css/Header.css">    
    <style>
       
        body {
        	margin: 0;
    		padding: 0;
    		background-color: black; /* 페이지 배경색을 검정으로 설정 */
    		color: white; /* 전체 글씨색을 흰색으로 설정 */
        }
        #container {
            max-width: 1000px;
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
            height: fit-content;
            color: white; /* 사이드바 글씨색 */
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
    width: 100%;
    padding: 15px;
    background-color: black; /* 메인 콘텐츠 배경색 */
    color: white; /* 메인 콘텐츠 글씨색 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    border: 1px solid #fff; /* 메인 콘텐츠 테두리색 */
    height: 600px; /* 고정 높이 설정 */
    overflow-y: auto; /* 세로 스크롤 활성화 */
}
        .search_area input {
            padding: 10px;
            width: calc(100% - 120px);
            border: 1px solid #fff;
            border-radius: 4px;
            margin-right: 10px;
            color: black; /* 검색 박스 텍스트 색상 */
        }
        .search_area button {
            padding: 10px;
            background-color: #e50914;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 60px;
            font-size: 0.5em;
        }
        .search_area button:hover {
            background-color: black;
        }
        .c_check_warp {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            gap: 20px;
            width: 100%;
        }
        .c_box {
            flex: 1 1 30%;
            padding: 15px;
            box-sizing: border-box;
            background-color: black; /* 박스 배경색 */
            color: white; /* 박스 내 글씨색 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            border: 1px solid #fff; /* 박스 테두리색 */
            border-radius: 5px;
        }
        .button, .btn_add {
            background-color: #e50914;
            color: white;
            padding: 10px 15px;
            text-align: center;
            border-radius: 4px;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }
        .button:hover, .btn_add:hover {
            background-color: #d10813;
        }
        .c_qu a, .service_area .list a, .notice_area a {
            color: white; /* 링크 색상 */
            text-decoration: none;
            margin-right: 10px; /* 링크 간의 간격 조정 */
        }
        .c_qu a:hover, .service_area .list a:hover, .notice_area a:hover {
            text-decoration: underline;
        }
        .customer_notice_area {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #333; /* 고객 알림 배경색 */
            border: 1px solid #fff; /* 고객 알림 테두리색 */
            border-radius: 5px;
            display: flex;
            gap: 20px;
            color: white; /* 고객 알림 글씨색 */
        }
        .service_area, .notice_area {
            flex: 1;
            padding: 15px;
            background-color: black; /* 서비스와 공지 배경색 */
            color: white; /* 서비스와 공지 글씨색 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            text-align: left;
        }
        .service_area .tit, .notice_area .tit {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .notice_area .more {
            display: block;
            margin-top: 10px;
            color: white; /* 링크 색상을 흰색으로 변경 */
            text-decoration: none;
        }
        .notice_area .more:hover {
            text-decoration: underline;
        }
        .shortcu_area ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .shortcu_area li {
            margin-bottom: 20px;
        }
        .shortcu_area .tit_shortcut {
            font-weight: bold;
        }
        .shortcu_area .round {
            display: inline-block;
            padding: 5px 10px;
            background-color: gray;
            color: white;
            text-decoration: none;
        }
        .shortcu_area .round.on {
            background-color: black;
        }
    </style>
</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
</header>

<div id="container">
    <div id="contents">
        <!-- 사이드바 -->
        <div class="sidebar">
            <div class="snb">
                <ul>
                    <li class="on"><a href="serviceHome">고객센터 메인</a></li>
                    <li><a href="faq">자주찾는 질문</a></li>
                    <li><a href="news">공지/뉴스</a></li>
                    <li><a href="inquiry">이메일 문의</a></li>
                </ul>
            </div>
            <div class="ad-area">
                <!-- 광고 공간 -->
            </div>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="col-detail">
            <div class="c_check_warp">
                <div class="c_box qna_search">
                    <strong class="c_tit">
                        <span class="emoji">🔍<br></span>자주찾는 질문 빠른검색
                    </strong>
                    <div class="search_area">
                        <form action="faq" method="get" style="display: flex; align-items: center; width: 100%;">
                            <input id="searchtext" type="text" name="search" placeholder="검색어를 입력해 주세요." />
                            <button type="submit" class="btn_search">
                                검색
                            </button>
                        </form>
                    </div>
                    <br>
                    <div class="c_qu">
                        <a href="faq?selected=홈페이지/모바일">홈페이지/모바일</a>&nbsp;
                        <a href="faq?selected=예매/매표">예매/매표</a>&nbsp;<br>
                        <a href="faq?selected=결제수단">결제수단</a>&nbsp;
                        <a href="faq?selected=영화관이용">영화관이용</a>&nbsp;<br>
                        <a href="faq?selected=특별관">특별관</a>
                    </div>
                </div>
                <div class="c_box email_inquiry">
                    <strong class="c_tit"><span class="emoji">📧</span><br>이메일 문의</strong><br><br>
                    <span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
                    <br><br><a href="inquirywrite" class="button">문의하기</a>
                </div>
                <div class="c_box my_advice">
                    <strong class="c_tit"><span class="emoji">🧐</span><br>내 상담 내역 확인</strong><br><br>
                    <span class="c_txt">이메일 문의 조회입니다.</span><br>
                    <br><a href="inquiry" class="button">문의내역 조회</a>
                </div>
            </div>

            <div class="customer_notice_area">
                <div class="service_area">
                    <span class="tit">즐겨찾는질문</span>
                    <ul class="list">
                        <li><a href="FAQdetail?id=74">faq역기</a></li>
                        <li><a href="#">faq엮</a></li>
                        <li><a href="#">우리애가 물건좀 슬쩍가져갈수있는거아니에요?맘카페에 퍼뜨릴게요</a></li>
                    </ul>
                </div>

                <div class="notice_area">
                    <span class="tit">공지사항</span>
                    <ul class="list">
                        <li><a href="#">9월 프로모션 안내</a></li>
                        <li><a href="#">서버 점검 공지</a></li>
                        <li><a href="#">고객센터 운영시간 변경 안내</a></li>
                    </ul>
                    <a href="news" class="more">더보기</a>
                </div>
            </div>
        </div>
    </div>
</div>
<footer> 
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</footer>
</body>
</html>
				