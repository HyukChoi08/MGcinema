<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${faqDetail.title}</title>
    <link rel="stylesheet" href="/service/faqdetail.css">
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
                        <li><a href="serviceHome">고객센터 메인</a></li>
                        <li class="hover-item"><a href="faq">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li><a href="inquiry">문의하기</a></li>
                    </ul>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="col-detail">
                <div class="customer_top">
                    <h2 class="tit">${faqDetail.title}</h2>
                    <p class="day">작성일: ${formattedDate}</p>	
                     <p class="stit">조회수: ${faqDetail.views}</p>
                </div>  
                <div class="view_area">
                    <pre>${faqDetail.content}</pre>
                </div>
                <!-- 버튼 그룹 -->
                
<div class="btn-group">
    <button class="btn-list" 
            onclick="location.href='/faq?page=${currentPage}&size=${size}&search=${param.search}&selected=${faqDetail.selected}'">
        목록
    </button>
   <!--  <button class="btn-edit" onclick="location.href='FAQedit?id=${faqDetail.id}'">수정</button> -->
    <!-- <button class="btn-delete" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='FAQdelete?id=${faqDetail.id}'">삭제</button> -->
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