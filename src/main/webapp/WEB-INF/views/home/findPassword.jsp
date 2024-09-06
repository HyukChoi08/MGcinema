<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="findPassword_css/findPassword.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
    
    <div class="findPassword-page">
        <h2>비밀번호 변경</h2>
        <!-- 비밀번호 변경 폼 -->
        <form action="doFindPassword" method="post">            
			<div class="form-group">
            	<label for="uid">아이디</label>
                <input type="text" id="uid" name="uid" value="${formData.uid}" placeholder="(필수)" required>
            </div>
            
            <div class="form-group">
                <label for="birthday">생년월일</label>
                <input type="text" id="birthday" name="birthday" placeholder="YYYY-MM-DD 형식으로 입력해주세요" required maxlength="10" pattern="\d{4}-\d{2}-\d{2}">
            </div>
            
            <div class="form-group">
                <label for="mobile">전화번호</label>
                <input type="text" id="mobile" name="mobile" placeholder="01012345678 형식으로 작성해주세요" required maxlength="11">
            </div>                          
            
            <button type="submit">본인 인증</button>
            
            <!-- Display error message if available -->
            <c:if test="${not empty errorMessage}">
                <p class="error-message">${errorMessage}</p>
                <%-- console.log(${errorMessage}); --%>
            </c:if>
            
        </form>
</div>
    
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
<!-- <script>
let eid = ${errorMessage};
let sid = ${successMessage};
</script> -->
</html>
