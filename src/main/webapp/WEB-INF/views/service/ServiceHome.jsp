<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${serviceHome.title}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f5f5f5;
        }
        header, footer {
            width: 100%;
            background-color: #fff;
            text-align: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        main {
            width: 1000px; /* 넓이를 1000px로 설정 */
            margin: 20px 0;
            display: flex; /* Flexbox를 사용하여 가로 배치 */
        }
        .sidebar {
            width: 250px; /* 사이드바의 너비 설정 */
            margin-right: 20px; /* 콘텐츠와 사이드바 사이의 간격 */
        }
        .content {
            flex: 1; /* 나머지 공간을 차지하도록 설정 */
        }
        .CS, .service_area, .news {
            border: 1px solid black;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #fff;
        }
        .CS_tit {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .CS_txt {
            color: #666;
        }
        .btn_search {
            background-color: black;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        .search_box {
            margin-bottom: 10px;
        }
        .news {
            margin-top: 20px;
        }
        .news .tit {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .news ul {
            list-style-type: none;
            padding: 0;
        }
        .news ul li {
            margin-bottom: 10px;
        }
        .news a {
            color: #007bff;
            text-decoration: none;
        }
        .news a:hover {
            text-decoration: underline;
        }
        .news .more {
            display: block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .news .more:hover {
            text-decoration: underline;
        }
        .container {
            display: grid;
            grid-template-columns: 1fr 1fr; /* 두 개의 같은 너비 열 */
            gap: 20px; /* 섹션 간의 간격 조정 */
        }
        .service_area .tit, .news .tit {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .service_area .list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .service_area .list li {
            margin-bottom: 10px;
        }
        .service_area .list a {
            color: #007bff;
            text-decoration: none;
        }
        .service_area .list a:hover {
            text-decoration: underline;
        }
        .nav-menu {
            background-color: #fff;
            border: 1px solid black;
            padding: 10px;
        }
        .nav-menu ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .nav-menu ul li {
            margin-bottom: 10px; /* 항목 간의 간격을 설정 */
        }
        .nav-menu ul li a {
            text-decoration: none;
            color: #007bff;
            font-size: 1em;
        }
        .nav-menu ul li a:hover {
            text-decoration: underline;
        }
        .nav-menu ul li.on a {
            font-weight: bold;
        }
    </style>
</head>
<body>
<header>
    <h1>${serviceHome.title}</h1>
    <!-- 추가적인 헤더 내용 (메뉴, 로고 등) -->
</header>

<main>
    <div class="sidebar">
        <!-- 네비게이션 메뉴 -->
        <div class="nav-menu">
            <ul>
                <li class="on"><a href="#">고객센터 메인<i></i></a></li>
                <li><a href="#">자주찾는 질문<i></i></a></li>
                <li><a href="#">공지/뉴스<i></i></a></li>
                <li><a href="#">이메일 문의<i></i></a></li>
            </ul>
        </div>
    </div>

    <div class="content">
        <section id="content">
            <!--  <h2>내용</h2>
            <p>${serviceHome.content}</p>

		-->
            <!-- 자주찾는 질문란 -->
            <div class="CS">
                <strong class="CS_tit">자주찾는 질문 빠른검색</strong>
                <div class="search_box">
                    <input id="searchtext" type="text" placeholder="검색어를 입력해 주세요." />
                    <button type="button" class="btn_search">검색</button>
                </div>
                <div class="faq">
                    <a href="#none">현금영수증</a>
                    <a href="#none">관람권</a>
                    <a href="#none">예매</a>
                    <a href="#none">환불</a>
                    <a href="#none">취소</a>
                </div>
            </div>

            <div class="CS">
                <strong class="CS_tit">상담톡 이용</strong><br>
                <span class="CS_txt">상담 톡을 이용해보세요.</span><br>
                <a href="#">문의하기</a>
            </div>

            <div class="CS">
                <strong class="CS_tit">이메일 문의</strong><br>
                <span class="CS_txt">24시간 365일 언제든지 문의해주세요.</span><br>
                <a href="#">문의하기</a>
            </div>

            <div class="CS">
                <strong class="CS_tit">내 상담 내역 확인</strong><br>
                <span class="CS_txt">문의하신 내용을 확인하실 수 있습니다.</span><br>
                <a href="#">문의내역 조회</a>
            </div>

            <!-- 자주찾는 서비스 및 공지/뉴스 -->
            <div class="container">
                <!-- 자주찾는 서비스 -->
                <div class="service_area">
                    <span class="tit">자주찾는 서비스</span>
                    <ul class="list">
                        <li><a href="#" title="새창열기">신용카드<br>영수증출력</a></li>
                        <li><a href="#" title="새창열기">아이디/<br>비밀번호 찾기</a></li>
                        <li><a href="#" title="새창열기">예매/<br>취소내역 확인</a></li>
                        <li><a href="#">비회원<br>예매/취소</a></li>
                        <li><a href="#" target="_blank" title="새창열기">멤버십포인트<br>사용안내</a></li>
                        <li><a href="#" title="새창열기">관람권<br>할인쿠폰 등록</a></li>
                    </ul>
                </div>

                <!-- 공지사항 -->
                <div class="news">
                    <span class="tit">공지/뉴스</span>
                    <ul>
                        <li><a href="#">공지1</a><span class="day"> 2024.08.21</span></li>
                        <li><a href="#">공지2</a><span class="day"> 2024.08.21</span></li>
                        <li><a href="#">공지3</a><span class="day"> 2024.08.21</span></li>
                        <li><a href="#">공지4</a><span class="day"> 2024.08.21</span></li>
                    </ul>
                    <a href="#" class="more">공지/뉴스 더보기</a>
                </div>
            </div>
        </section>
    </div>
</main>

<footer>
    <!-- 추가적인 푸터 내용 (연락처, 소셜 미디어 링크 등) -->
</footer>
</body>
</html>
