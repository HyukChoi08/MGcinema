<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
    <title>${serviceHome.title}</title>
    <style>
    /*	header { 
    color: #ffffff;
    padding: 10px 0;
    width: 100%;
    box-sizing: border-box;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
    height: 150px;
} */  
        /* 전체 body 스타일 설정 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* 페이지 배경색 */
        	margin-top: 100px;
        }

        /* 상단 배너 스타일 */
       

        /* 메인 컨테이너 스타일 */
        #container {
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top : 200px;
        }

        /* 컨텐츠 영역 스타일 */
        #contents {
            width: 100%;
            display: flex;
        }

        /* 사이드바 스타일 */
        .sidebar {
            width: 20%;
            padding: 15px;
            background-color: #f7f7f7;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: fit-content;
        }

        /* 사이드바 내 리스트 스타일 */
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

        /* 메인 콘텐츠 스타일 */
        .col-detail {
            width: 75%;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* 검색 박스 스타일 */
        .search_area {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .search_area input {
            padding: 10px;
            width: calc(100% - 120px);
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
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

        /* 체크박스 영역 */
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
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            align-items: flex-start;
            justify-content: flex-start;
            text-align: left;
        }

        /* 버튼 스타일 */
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

        /* 텍스트 링크 스타일 */
        .c_qu a, .service_area .list a, .notice_area a {
            color: #007bff;
            text-decoration: none;
        }
        .c_qu a:hover, .service_area .list a:hover, .notice_area a:hover {
            text-decoration: underline;
        }

        /* 고객 알림 영역 */
        .customer_notice_area {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f7f7f7;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: flex;
            gap: 20px;
        }
        .service_area, .notice_area {
            flex: 1;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
        footer {
 	   		background-color: white;
   	 		text-align: center;
   			padding: 10px 0;
    		border-top: 1px solid #ddd;
		}
header {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000; /* 다른 요소 위에 위치하게 함 */
}

       
    </style>
</head>
<body>
    <header>
       
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
            <input id="searchtext" type="text" name="search" placeholder="검색어를 입력해 주세요." style="flex: 1; padding: 8px; border: 1px solid #ccc; border-radius: 4px;" />
            <button type="submit" class="btn_search" style="margin-left: 8px; padding: 8px 16px; border: none; background-color: #e50914; color: white; border-radius: 4px; cursor: pointer;">
                검색
            </button>
	</div>

                        <br>
                        <div class="c_qu">
                            <a href="faq?selected=홈페이지/모바일">홈페이지/모바일</a>&nbsp;
                            <a href="faq?selected=예매/매표">예매/매표</a>&nbsp;
                            <a href="faq?selected=결제수단">결제수단</a>&nbsp;
                            <a href="faq?selected=영화관이용">영화관이용</a>&nbsp;
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
                        <ul class="list"><br>
                            <li><a href="FAQdetail?id=74">비밀번호 잃어버렸어요ㅋ</a></li>
                            <li><a href="#">팝콘에서 콩벌레나왔는데요?ㅋㅋ</a></li>
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

    <footer>
         
    </footer>
</body>
</html>
