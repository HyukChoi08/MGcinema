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
        .profile-section img {
            border-radius: 50%; /* 이미지 원형으로 만들기 */
            margin-right: 15px; /* 이미지와 텍스트 사이 간격 */
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
        /* 예매 내역과 문의 내역 섹션 스타일 */
        .c_check_warp, .customer_notice_area {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f7f7f7;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        /* 버튼 스타일 */
        .button {
            background-color: #e50914;
            color: white;
            padding: 5px 20px;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }
        .button:hover {
            background-color: #d10813;
        }
        /* 텍스트 링크 스타일 */
        .c_qu a, .service_area .list a, .notice_area a, .shortcu_area .round {
            color: #007bff;
            text-decoration: none;
        }
        .c_qu a:hover, .service_area .list a:hover, .notice_area a:hover, .shortcu_area .round:hover {
            text-decoration: underline;
        }
        /* 고객센터 서비스 및 공지사항 영역 스타일 */
        .service_area, .notice_area {
            border: 1px solid black;
            padding: 15px;
            background-color: white;
        }
        .service_area .tit, .notice_area .tit {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .notice_area .more {
            display: block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .notice_area .more:hover {
            text-decoration: underline;
        }
        /* 단축키 영역 스타일 */
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
    <head>
    <title>고객센터홈</title>
    <link rel="stylesheet" href="/Header_css/Header.css">
    </head>
	<body>
	<header class="header">
        <nav class="navbar">
            <h1><a href="/">MG Cinema</a></h1>
            <ul class="nav-links">
                <li><a href="/login">로그인</li>
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
                        <li class="on"><a href="serviceHome">고객센터 메인</a></li>
                        <li><a href="faq">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li><a href="eaq">이메일 문의</a></li>
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
                        <strong class="c_tit">🔍자주찾는 질문 빠른검색</strong>
                        <div class="search_box">
                            <input id="searchtext" type="text" placeholder="검색어를 입력해 주세요." />
                            <button type="button" class="btn_search">검색</button>
                        </div>
                        <div class="c_qu">
                            <a href="faq">현금영수증</a>&nbsp;
                            <a href="faq">관람권</a>&nbsp;
                            <a href="faq">예매</a>&nbsp;
                            <a href="faq">환불</a>&nbsp;
                            <a href="faq">취소</a>
                        </div>
                    </div>
                  <!--  <div class="c_box talk_inquiry">
                        <strong class="c_tit">상담톡 이용</strong>
                        <span class="c_txt">상담 톡을 이용해보세요.</span>
                        <a href="#">문의하기</a>
                    </div> -->
                    <div class="c_box email_inquiry">
                        <strong class="c_tit">📧이메일 문의</strong>
                        <span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
                        <a href="eaq">문의하기</a>
                    </div>
                    <div class="c_box my_advice">
                        <strong class="c_tit">🧐내 상담 내역 확인</strong>
                        <span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
                        <a href="#">문의내역 조회</a>
                    </div>
                </div>
                <div class="customer_notice_area">
                    <div class="service_area">
                        <span class="tit">자주찾는 질문</span>
                        <ul class="list">
                            <li><a href="#">신용카드<br>영수증출력</a></li>
                            <li><a href="#">아이디/<br>비밀번호 찾기</a></li>
                            <li><a href="#">예매/<br>취소내역 확인</a></li>
                            <li><a href="#">비회원<br>예매/취소</a></li>
                            <li><a href="#">멤버십포인트<br>사용안내</a></li>
                            <li><a href="#">관람권<br>할인쿠폰 등록</a></li>
                        </ul>
                    </div>
                    <div class="notice_area">
                        <span class="tit">공지/뉴스</span>
                        <ul class="txt">
                            <li><a href="#">공지1 </a><span class="day">2024.08.21</span></li>
                            <li><a href="#">공지2 </a><span class="day">2024.08.20</span></li>
                            <li><a href="#">공지3 </a><span class="day">2024.08.19</span></li>
                            <li><a href="#">공지4 </a><span class="day">2024.08.18</span></li>
                            <li><a href="#">공지5 </a><span class="day">2024.08.17</span></li>
                        </ul>
                        <a class="more" href="#">더보기</a>
                    </div>
                </div>                
            </div>
        </div>
    </div>
    <footer>
        <p>MG Cinema &copy; 2024</p>
    </footer>
</body>
</html>
