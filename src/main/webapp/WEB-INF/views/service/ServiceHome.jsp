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
        .c_check_warp {
            display: flex;
            flex-direction: row; /* 자식 요소들을 수평으로 배치 */
            flex-wrap: wrap; /* 자식 요소들이 컨테이너를 넘칠 경우 자동으로 줄바꿈 */
            gap: 20px; /* 자식 요소 사이의 간격 설정 */
            width: 100%; /* 전체 너비 사용 */
        }
        .c_box {
            flex: 1 1 30%; /* 각 박스가 30% 너비를 가짐 (반응형 디자인을 위한 비율 설정) */
            padding: 15px;
            box-sizing: border-box; /* 패딩과 보더를 포함하여 너비 계산 */
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            align-items: flex-start; /* 수평 중앙 정렬에서 좌측 정렬로 변경 */
            justify-content: flex-start; /* 수직 중앙 정렬에서 상단 정렬로 변경 */
            text-align: left; /* 텍스트 좌측 정렬 */
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
        .customer_notice_area {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f7f7f7;
            border: 1px solid #ddd;
            border-radius: 5px;
            display : flex;
            gap : 20px;
        }
        .customer_notice_area ul {
            list-style-type: none; /* 기본 점 스타일 제거 */
            padding: 0;
            margin: 0;
        }
        .service_area, .notice_area {
            flex: 1; /* 두 요소가 동일한 비율로 공간을 차지하도록 설정 */
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: left; /* 텍스트 좌측 정렬 */
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
        .c_tit .emoji {
            font-size: 2em; /* 이모티콘 크기 조정 */
        }
        footer {
            background-color: white;
            text-align: center;
            padding: 10px 0;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <header>
        <!-- 상단 배너가 필요한 경우 여기에 추가 -->
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
                        <strong class="c_tit"><span class="emoji">🔍<br></span>자주찾는 질문 빠른검색</strong>
                        <div class="search_box">
                            <input id="searchtext" type="text" placeholder="검색어를 입력해 주세요." />
                            <button type="button" class="btn_search">검색</button>
                        </div>
                        <br>
                        <div class="c_qu">
                            <a href="faq">현금영수증</a>&nbsp;
                            <a href="faq">관람권</a>&nbsp;
                            <a href="faq">예매</a>&nbsp;
                            <a href="faq">환불</a>&nbsp;
                            <a href="faq">취소</a>
                        </div>
                    </div>
                    <div class="c_box email_inquiry">
                        <strong class="c_tit"><span class="emoji">📧</span><br>이메일 문의</strong><br><br>
                        <span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
                        <br><br><a href="inquirywrite">문의하기</a>
                    </div>
                    <div class="c_box my_advice">
                        <strong class="c_tit"><span class="emoji">🧐</span><br>내 상담 내역 확인</strong><br><br>
                        <span class="c_txt">이메일 문의 조회입니다.</span><br>
                        <br><a href="inquiry">문의내역 조회</a>
                    </div>
                </div>

                <div class="customer_notice_area">
                    <div class="service_area">
                        <span class="tit">즐겨찾는질문</span>
                        <ul class="list"><br>
                            <li><a href="#">아이디 <br>비밀번호 찾기</a></li><br>
                            <li><a href="#">예매내역 확인</a><br>
                            <br><li><a href="#">예매취소내역 확인</a></li>
                        </ul>
                    </div>
                    <div class="notice_area">
                          <span class="tit">공지/뉴스</span>
                        <ul class="txt">
                            <c:forEach var="news" items="${newsList}">
                                <li><a href="#">${news.title}</a><span class="day">${news.createdAt}</span></li>
                            </c:forEach>
                        </ul>
                        <a class="more" href="news">더보기</a>
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
