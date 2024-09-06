<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <!-- 절대 경로로 CSS 파일 링크 -->
    <link rel="stylesheet" href="login_css/login.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    <div class="login-page"> <!-- CSS 클래스 이름을 수정 -->
        <h2>로그인</h2>
        <form action="/doLogin" method="post">
            <div class="form-group">
                <label for="userid">아이디</label>
                <input type="text" id="uid" name="uid" placeholder="아이디를 입력하세요" required> <!-- JSP와 컨트롤러에서 사용하는 이름 일치 -->  
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="passwd" placeholder="비밀번호를 입력하세요." required> <!-- JSP와 컨트롤러에서 사용하는 이름 일치 --> 
            </div>
            <button type="submit">로그인</button>
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>
            <div class="login-links">
            	<a href="/findId">아이디 찾기</a> | 
            	<a href="/findPassword">비밀번호 찾기</a>
        	</div>
        </form>
    </div>
     <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
