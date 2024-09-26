<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="newPassword_css/newPassword.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
    
    <div class="newPassword-page">
        <h2>비밀번호 변경</h2>
        <!-- 비밀번호 변경 폼 -->
        <form method="post" action="newPassword" onsubmit="return validateForm()">            
            <input type="hidden" name="uid" value="${uid}">
            
            <div class="form-group">
                <label for="passwd">비밀번호</label>
                <input type="password" id="passwd" name="passwd" value="${formData.passwd}" placeholder="비밀번호를 입력해주세요." required autocomplete="new-password">
            </div>
            
            <div class="form-group">
                <label for="passwd2">비밀번호 확인</label>
                <input type="password" id="passwd2" name="passwd2" value="${formData.passwd2}" placeholder="비밀번호를 확인해주세요." required autocomplete="new-password">
            </div>
            
            <button type="submit">비밀번호 변경</button>
            
        </form>
        
        <!-- 메시지 표시 -->
        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>
    </div>
    
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
<script>
	function validateForm() {
    	let passwd = document.getElementById('passwd').value;
        let passwd2 = document.getElementById('passwd2').value;
        	if (passwd !== passwd2) {
            	alert("비밀번호가 일치하지 않습니다.");
                return false;
            } else{
            	alert("비밀번호가 성공적으로 변경되었습니다.");
            }
            return true;
	}
</script>
</html>

