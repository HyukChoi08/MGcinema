<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>${newsDetail.title}</title>
    <link rel="stylesheet" href="/service/noticedetail.css">
    <style>       
    </style>
</head>
<body>
 <%@ include file="/WEB-INF/views/header/header.jsp" %>

<div id="container">
    <div id="contents">
        <div class="sidebar">
            <div class="snb">
                <ul>
                    <li><a href="/serviceHome">고객센터 메인</a></li>
                    <li><a href="/faq">자주찾는 질문</a></li>
                    <li class="hover-item"><a href="/news">공지/뉴스</a></li>
                    <li><a href="/inquiry">문의하기</a></li>
                </ul>
            </div>
        </div>

        <div class="col-detail">
            <div class="customer_top">
                <h2 class="tit">${newsDetail.title}</h2>
                <p class="stit">작성일: ${newsDetail.created_at}</p>
                <p class="click">조회수: ${newsDetail.views}</p>
            </div>
            <div class="view_area">
                <pre>${newsDetail.content}</pre>
           		
            </div>
           

<div class="btn-group">
    <button class="btn-list" onclick="window.location.href='/news?page=${currentPage}&size=${size}&search=${search}&selected=${newsDetail.selected}'">목록</button>
</div>


        </div>
    </div>
</div>
<footer>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</footer>
</body>
</html>