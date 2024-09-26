<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
  	<link rel="stylesheet" href="/service/servicehome.css">    
    <style>     
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
                    <li class="hover-item"><a href="serviceHome">고객센터 메인</a></li>
                    <li><a href="faq">자주찾는 질문</a></li>
                    <li><a href="news">공지/뉴스</a></li>
                    <li><a href="inquiry">문의하기</a></li>
                </ul>
            </div>
        </div>
        <div class="col-detail">
            <div class="c_check_warp">
                <div class="c_box qna_search">
                    <strong class="c_tit">
    					<span class="emoji-search"></span><br>자주찾는 질문 빠른검색
					</strong>
                    <div class="search_area">
                        <form action="faq" method="get"">
                        <br><input id="searchtext" type="text"name="search" placeholder="검색어를 입력해 주세요."><br><br>
                          <button type="submit" class="btn_search">검색</button>
                        </form>
                    </div>
                    <br>
                    
                </div>
                <div class="c_box email_inquiry">
                    <strong class="c_tit">
    					<span class="emoji-email"></span></span><br>1:1 문의</strong><br><br>
                    <span class="c_txt">365일 언제든지 문의해주세요.</span>
                    <br><br><a href="inquirywrite" class="button">문의하기</a>
                </div>
                <div class="c_box my_advice">	
                    <strong class="c_tit"><span class="emoji-center"></span><br>내 상담 내역 확인</strong><br><br>
                    <span class="c_txt">이메일 문의 조회입니다.</span><br>
                    <br><a href="inquiry" class="button">문의내역 조회</a>
                </div>
            </div><br>

            <div class="customer_notice_area">
                <div class="service_area">
                    <span class="tit">즐겨찾는질문</span><Br><br>
                    <div class="faq_button">
                        <a href="faq?selected=홈페이지/모바일" class="button-link">홈페이지모바일</a>
                        <a href="faq?selected=예매/매표" class="button-link">예매<br>문의</a>
                        <a href="faq?selected=결제수단" class="button-link">결제수단문의</a>
                        <a href="faq?selected=영화관이용" class="button-link">영화관<br>이용</a>
                        <a href="faq?selected=특별관" class="button-link">특별관<br>상세</a>
                        <a href="faq" class="button-link">질문<br>더보기</a>
                    </div>
                </div>
				<div class="notice_area">
    			<span class="tit">공지사항</span>
    			<a href="news" class="notice_more_btn">+</a>
    			<ul class="list"><br> 
    				<c:forEach var="news" items="${newsList}">
        		<li class="notice_item">
            		<a href="newsDetail?id=${news.id}" class="notice_list">[${news.selected}] ${news.title}
            		</a>
            		<div class="notice_date">${news.created_at}
            		</div>
        		</li>
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


				