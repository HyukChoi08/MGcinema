<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="login_css/login.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
    <div class="login-page">
        <h2>로그인</h2>
        <form action="/doLogin" method="post">
            <div class="form-group">
                <label for="uid">아이디</label>
                <input type="text" id="uid" name="uid" placeholder="아이디를 입력해주세요." required>
            </div>
            <div class="form-group">
                <label for="passwd">비밀번호</label>
                <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요." required>
            </div>
            <button type="submit">로그인</button>
            <c:if test="${not empty errorMessage}">
                <p class="error-message">${errorMessage}</p>
            </c:if>
            <div class="login-links">
                <a href="/findId">아이디 찾기</a>
                <a href="/findPassword">비밀번호 찾기</a>
                <a href="/signup">회원가입</a>
            </div>
        </form>
    </div>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
</html>
