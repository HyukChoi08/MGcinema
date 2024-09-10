<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            max-width: 1250px; /* 최대 너비를 1250px로 설정 */
            margin: 20px auto; /* 상하 여백 20px, 좌우 자동으로 중앙 배치 */
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 200px; /* 상단 여백 200px */
        }
        
        #contents {
            width: 100%; /* 컨텐츠 영역의 너비를 100%로 설정 */
            display: flex;
        }
        
        .sidebar {
            width: 250px; /* 사이드바 너비를 250px로 설정 */
            padding: 15px; /* 패딩 15px */
            background-color: #333; /* 사이드바 배경색 */
            color: white; /* 사이드바 글씨색 */
            height: fit-content;
        }
        
        .sidebar ul {
            list-style-type: none;
            padding: 0;
            text-align: left;
        }
        
        .sidebar ul li {
            margin-bottom: 15px; /* 항목 간의 여백 15px */
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
            width: 1335px; /* 메인 콘텐츠 너비를 1300px로 설정 */
            padding: 15px; /* 패딩 15px */
            background-color: black; /* 메인 콘텐츠 배경색 */
            color: white; /* 메인 콘텐츠 글씨색 */
            border: 1px solid #fff; /* 메인 콘텐츠 테두리색 */
            border-collapse: collapse;
            height: 650px; /* 고정 높이 설정 */
            overflow-y: auto; /* 세로 스크롤 활성화 */
            border-radius: 10px; /* 모서리 둥글게 설정 */
        }
        
        .search_area input {
            padding: 10px; /* 패딩 10px */
            width: calc(100% - 70px); /* 입력 박스 너비 계산 (70px는 버튼 너비) */
            border: 1px solid #fff; /* 테두리 색상 흰색으로 설정 */
            border-radius: 4px; /* 모서리 둥글게 설정 */
            margin-right: 10px; /* 버튼과의 간격 10px */
            color: black; /* 검색 박스 텍스트 색상 */
        }
        
        .search_area button {
            padding: 10px; /* 패딩 10px */
            background-color: #e50914; /* 버튼 배경색 */
            color: white; /* 버튼 글씨색 */
            border: none; /* 테두리 없음 */
            border-radius: 4px; /* 모서리 둥글게 설정 */
            cursor: pointer; /* 커서 포인터로 변경 */
            width: 60px; /* 버튼 너비 60px */
            font-size: 0.8em; /* 폰트 크기 0.8em */
        }
        
        .search_area button:hover {
            background-color: black; /* 버튼 hover 색상 */
        }
        
        .c_check_warp {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            gap: 20px; /* 박스 간의 간격 20px */
            width: 100%;
        }
        
        .c_box {
            flex: 1 1 30%; /* 박스가 30% 너비를 가지도록 설정 */
            padding: 15px; /* 패딩 15px */
            box-sizing: border-box; /* 박스 모델을 테두리와 패딩을 포함하도록 설정 */
            background-color: black; /* 박스 배경색 */
            color: white; /* 박스 내 글씨색 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 박스 그림자 설정 */
            border: 1px solid #fff; /* 박스 테두리색 */
            border-radius: 5px; /* 모서리 둥글게 설정 */
        }
        
        .button, .btn_add {
            background-color: #e50914; /* 버튼 배경색 */
            color: white; /* 버튼 글씨색 */
            padding: 10px 15px; /* 패딩 10px 15px */
            text-align: center; /* 텍스트 중앙 정렬 */
            border-radius: 4px; /* 모서리 둥글게 설정 */
            text-decoration: none; /* 링크 밑줄 제거 */
            display: inline-block; /* 인라인 블록으로 설정 */
            margin-top: 10px; /* 상단 여백 10px */
        }
        
        .button:hover, .btn_add:hover {
            background-color: yellow; /* 버튼 hover 색상 */
        }
        
        .c_qu a, .service_area .list a, .notice_area a {
            color: white; /* 링크 색상 */
            text-decoration: none; /* 링크 밑줄 제거 */
            margin-right: 10px; /* 링크 간의 간격 10px */
        }
        
        .c_qu a:hover, .service_area .list a:hover, .notice_area a:hover {
            text-decoration: underline; /* 링크 hover 시 밑줄 추가 */
        }
        
        .customer_notice_area {
            margin-bottom: 20px; /* 하단 여백 20px */
            padding: 10px; /* 패딩 10px */
            background-color: #333; /* 고객 알림 배경색 */
            border: 1px solid #fff; /* 고객 알림 테두리색 */
            border-radius: 5px; /* 모서리 둥글게 설정 */
            display: flex; /* 플렉스 박스 사용 */
            gap: 20px; /* 요소 간의 간격 20px */
            color: white; /* 고객 알림 글씨색 */
        }
        
        .service_area, .notice_area {
            flex: 1; /* 남은 공간을 모두 차지하도록 설정 */
            padding: 15px; /* 패딩 15px */
            background-color: black; /* 서비스와 공지 배경색 */
            color: white; /* 서비스와 공지 글씨색 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 설정 */
            border-radius: 5px; /* 모서리 둥글게 설정 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
        }
        
        .service_area .tit,{
            font-size: 1.5em; /* 제목 폰트 크기 1.2em */
            margin-bottom: 10px; /* 하단 여백 10px */
        }
        .notice_area .tit{
        	font-size: 1.5em; /* 글씨 크기 조정 (원하는 크기로 변경) */
   		 	margin-bottom: 10px; /* 하단 여백 조정 */
    		list-style: none; /* 점 제거 */
        }

        .faq_button {
   			display: flex;
    		flex-wrap: wrap; /* 버튼이 여러 줄로 배치될 수 있도록 설정 */
    		gap: 10px; /* 버튼 간의 간격 조정 */
    		width: 100%;
		}

		.button-link {
    		flex: 1 1 calc(50% - 10px); /* 버튼 너비를 두 개씩 정렬하도록 설정 */
    		padding: 25px 25px; /* 버튼 패딩 조정 */
    		font-size: 1.0em; /* 폰트 크기 줄이기 */
    		text-align: center; /* 텍스트 중앙 정렬 */
    		box-sizing: border-box; /* 패딩과 테두리 포함 너비 계산 */
    		margin-bottom: 10px; /* 하단 여백 10px */
    		background-color: black; /* 버튼 배경색 검정으로 설정 */
    		color: white; /* 버튼 글씨색 흰색 */
    		border: 2px solid white; /* 버튼 테두리 흰색으로 설정 */
    		border-radius: 5px; /* 버튼 모서리 둥글게 설정 */
    		text-decoration: none; /* 링크 밑줄 제거 */
		}

		.button-link:hover {
    		background-color: #d10813; /* 버튼 hover 시 배경색 변경 */
    		border: 2px solid white; /* hover 시 테두리 색상 유지 */
		}
		.notice_more_btn {
    		display: inline-block;
    		padding: 1px 10px; /* 버튼의 패딩 설정 */
    		font-size: 1.2em; /* 버튼의 폰트 크기 설정 */
    		color: black; /* 버튼 글씨 색상 */
    		background-color: black; /* 버튼 배경 색상 */
    		text-align: center; /* 텍스트 중앙 정렬 */
    		border-radius: 5px; /* 둥근 버튼을 위해 50% 설정 */
    		border: 2px solid white; /* 흰색 테두리 설정 */
    		text-decoration: none; /* 링크 밑줄 제거 */
    		margin-left: 10px; /* 공지사항과의 간격 설정 */
		}

		.notice_more_btn:hover {
    		background-color: white; /* 버튼 hover 시 배경색 변경 */
    		border-color: white; /* hover 시 테두리 색상 변경 */
		}
		.notice_area .list {
    list-style-type: none; /* 기본 점 제거 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
}

.notice_area .list li {
    margin-bottom: 10px; /* 항목 간의 간격 조정 */
}

.notice_area .list a.notice_list {
    font-size: 1.0em; /* 글씨 크기 조정 (원하는 크기로 변경) */
    color: white; /* 링크 글씨 색상 */
    text-decoration: none; /* 링크 밑줄 제거 */
}

.notice_area .list a.notice_list:hover {
    text-decoration: underline; /* 링크 hover 시 밑줄 추가 */
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
                        <span class="emoji">🔍<br></span>자주찾는 질문 빠른검색<Br><br>
                    </strong>
                    <div class="search_area">
                        <form action="faq" method="get" style="display: flex; align-items: center; width: 100%;">
                        <br>    <input id="searchtext" type="text" name="search" placeholder="검색어를 입력해 주세요." />
                            <button type="submit" class="btn_search">검색</button>
                        </form>
                    </div>
                    <br>
                    
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
            </div><br>

            <div class="customer_notice_area">
                <div class="service_area">
                    <span class="tit">즐겨찾는질문</span><Br><br>
                    <div class="faq_button">
                        <a href="faq?selected=홈페이지/모바일" class="button-link">홈페이지/모바일</a>
                        <a href="faq?selected=예매/매표" class="button-link">예매/매표</a>
                        <a href="faq?selected=결제수단" class="button-link">결제수단</a>
                        <a href="faq?selected=영화관이용" class="button-link">영화관이용</a>
                        <a href="faq?selected=특별관" class="button-link">특별관</a>
                        <a href="faq" class="button-link">더보기</a>
                    </div>
                </div>
                <div class="notice_area">
    			<span class="tit">공지사항</span>
    			<!-- 버튼으로 변환된 링크 -->
    			<a href="news" class="notice_more_btn">+</a>
    			<ul class="list">
        		<c:forEach var="news" items="${newsList}">
            		<li><a href="newsDetail?id=${news.id}" class="notice_list">[${news.selected}]  ${news.title} ${news.created_at}</a></li>
        		</c:forEach>
    			</ul>
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


				