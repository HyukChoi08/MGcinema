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
            background-color: #f5f5f5;
        }
        header, footer {
            width: 100%;
            background-color: #fff;
            text-align: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        #container {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #contents {
            width: 1000px;
            margin: 20px 0;
            display: flex;
        }
        .col-aside {
            width: 250px;
            margin-right: 20px;
        }
        .col-detail {
            flex: 1;
        }
        .snb {
            border: 1px solid black;
            padding: 15px;
            background-color: #fff;
        }
        .snb ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .snb ul li {
            margin-bottom: 10px;
        }
        .snb ul li a {
            text-decoration: none;
            color: #007bff;
            font-size: 1em;
        }
        .snb ul li a:hover {
            text-decoration: underline;
        }
        .snb ul li.on a {
            font-weight: bold;
        }
        .ad-area {
            margin-top: 20px;
        }
        .ad-partner01, {
            margin-bottom: 10px;
        }
        .c_check_warp {
            border: 1px solid black;
            padding: 15px;
            background-color: #fff;
        }
        .c_box {
            margin-bottom: 20px;
        }
        .c_tit {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .c_txt {
            color: #666;
        }
        .c_qu a {
            display: block;
            margin-bottom: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .c_qu a:hover {
            text-decoration: underline;
        }
        .customer_notice_area {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .service_area, .notice_area {
            border: 1px solid black;
            padding: 15px;
            background-color: #fff;
        }
        .service_area .tit, .notice_area .tit {
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
        .notice_area ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .notice_area ul li {
            margin-bottom: 10px;
        }
        .notice_area a {
            color: #007bff;
            text-decoration: none;
        }
        .notice_area a:hover {
            text-decoration: underline;
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
   <!--   <h1>${serviceHome.title}</h1> -->
</header>

<div id="container">
    <div id="contents">
        <div class="col-aside">
            <h2>고객센터 메뉴</h2>
            <div class="snb">
                <ul>
                    <li class="on"><a href="#">고객센터 메인<i></i></a></li>
                    <li><a href="#">자주찾는 질문<i></i></a></li>
                    <li><a href="#">공지/뉴스<i></i></a></li>
                    <li><a href="#">이메일 문의<i></i></a></li>
                    <li><a href="#">단체/ 대관 문의<i></i></a></li>
                </ul>
            </div>
            <div class="ad-area">
                <!--광고사진넣었던곳인데 ifram으로 넣어보던지하자 --> 
                
            </div>
        </div>

        <div class="col-detail">
            <div class="c_check_warp">
                <div class="c_box qna_search">
                    <strong class="c_tit">자주찾는 질문 빠른검색</strong>
                    <div class="search_box">
                        <input id="searchtext" type="text" placeholder="검색어를 입력해 주세요." />
                        <button type="button" class="btn_search">검색</button>
                    </div>
                    <div class="c_qu">
                        <a href="#none">현금영수증</a>
                        <a href="#none">관람권</a>
                        <a href="#none">예매</a>
                        <a href="#none">환불</a>
                        <a href="#none">취소</a>
                    </div>
                </div>
                <div class="c_box talk_inquiry">
                    <strong class="c_tit">상담톡 이용</strong>
                    <span class="c_txt">상담 톡을 이용해보세요.</span>
                    <a href="#">문의하기</a>
                </div>
                <div class="c_box email_inquiry">
                    <strong class="c_tit">이메일 문의</strong>
                    <span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
                    <a href="#">문의하기</a>
                </div>
                <div class="c_box my_advice">
                    <strong class="c_tit">내 상담 내역 확인</strong>
                    <span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
                    <a href="#">문의내역 조회</a>
                </div>
            </div>
            <div class="customer_notice_area">
                <div class="service_area">
                    <span class="tit">자주찾는 서비스</span>
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
                        <li><a href="#">공지1</a><span class="day">2024.08.21</span></li>
                        <li><a href="#">공지2</a><span class="day">2024.08.20</span></li>
                        <li><a href="#">공지3</a><span class="day">2024.08.19</span></li>
                    </ul>
                    <a href="#" class="more">더보기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
  
</footer>
</body>
</html>
