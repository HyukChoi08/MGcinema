<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
 --%>
 
 
<%--  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header Component</title>
    <!-- 절대 경로 CSS 파일 링크 -->
    <link rel="stylesheet" href="/Header_css/Header.css">
</head>
<body>
    <header class="header">
        <nav class="navbar">
        <nav class="navbar1">
            <ul class="nav-links">
                <li><a href="/Movie">영화</a></li>
                <li><a href="/cinema">극장</a></li>
                <li><a href="/ticket">예매</a></li>
                <li><a href="/store">스토어</a></li>
            </ul>
        </nav>
            <h1><a href="/">Movie Theater</a></h1>
            <ul class="nav-links">
                <li><a href="/login">로그인</a></li>
                <li><a href="/signup">회원가입</a></li>
                <li><a href="/myhome">My페이지</a></li>
                <li><a href="/serviceHome">고객센터</a></li>
            </ul>
        </nav>
    </header>
</body>
</html>

 --%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header Component</title>
    <!-- 절대 경로 CSS 파일 링크 -->
    <link rel="stylesheet" href="/Header_css/Header.css">
    <!-- 공통 CSS 파일 링크 -->
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
                    ${ linkstr }
                    <!-- <li><a href="/signup">회원가입</a></li> -->
                    <li><a href="/myhome">My페이지</a></li>
                    <li><a href="/serviceHome">고객센터</a></li>
                </ul>
            </div>
        </nav>
    </header>
</body>
<!-- 자바스크립트로 세션체크 --> 
</html>

 