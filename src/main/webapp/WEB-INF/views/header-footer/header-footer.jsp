<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Page Title</title>
    <!-- 통합된 CSS 파일 링크 -->
    <link rel="stylesheet" href="/header-footer_css/header-footer.css">
</head>
<body>
    <header class="header">
        <nav class="navbar">
            <div class="navbar1">
                <ul class="nav-links">
                    <li><a href="/chart">영화</a></li>
                    <li><a href="/cinema">극장</a></li>
                    <li><a href="/ticket">예매</a></li>
                    <li><a href="/store">스토어</a></li>
                </ul>
            </div>
            <h1><a href="/">MG CINEMA</a></h1>
            <div class="navbar2">
                <ul class="nav-links">
                    ${linkstr}
                    <li><a href="/myhome">My페이지</a></li>
                    <li><a href="/serviceHome">고객센터</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="page-content">
        <!-- 페이지 콘텐츠를 여기에 추가 -->
    </div>

    <footer class="footer">
        <p>	
            주소: 경기 고양시 일산동구 정발산로 43-20, 센트럴프라자 4층 407호 우편번호 10402<br>
            대표 이메일: korea@mgcinema.com · 고객센터: 1544-1234 (수신자 부담) · 사업자등록번호: 104-86-12345 · 통신판매업신고번호: 통신판매업신고번호 2024-고양일산동-0123 <br>
            대표이사: 박MG · 개인정보 보호 책임자: 박MG · 호스팅 제공자: MG이노베이트
            &copy; MG CINEMA. All rights reserved.<br>       	
        </p>
    </footer>
</body>
</html>
