<%--  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="findId_css/findId.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
	
	
	<div class="findId-page">
		<h2>아이디 찾기</h2>
		<form action="/doFindId" method="post">
			<div class="form-group">
                <label for="realname">실명</label>
                <input type="text" id="realname" name="realname" value="${formData.realname}" placeholder="이름을 입력해주세요." required>  
            </div>
            <div class="form-group">
            	<label for="birthday">생년월일</label>
                <input type="text" id="birthday" name="birthday" value="${formData.birthday}" placeholder="YYYY-MM-DD 형식으로 입력해주세요" required maxlength="10" pattern="\d{4}-\d{2}-\d{2}">
            </div>
            <div class="form-group">
                <label for="mobile">전화번호</label>
                <input type="text" id="mobile" name="mobile" value="${formData.mobile}" placeholder="01012345678 형식으로 작성해주세요" required maxlength="11">
           </div>
            <button type="submit">아이디 찾기</button>
            <c:if test="${not empty errorMessage}">
        		 <p class="error-message">${error}</p>
    		</c:if>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->	
</body>
</html>
 --%>
 
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="findId_css/findId.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
    
    <div class="findId-page">
        <h2>아이디 찾기</h2>
        <form action="/doFindId" method="post">
            <div class="form-group">
                <label for="realname">실명</label>
                <input type="text" id="realname" name="realname" placeholder="이름을 입력해주세요." required>  
            </div>
            <div class="form-group">
                <label for="birthday">생년월일</label>
                <input type="text" id="birthday" name="birthday" placeholder="YYYY-MM-DD 형식으로 입력해주세요" required maxlength="10" pattern="\d{4}-\d{2}-\d{2}">
            </div>
            <div class="form-group">
                <label for="mobile">전화번호</label>
                <input type="text" id="mobile" name="mobile" placeholder="01012345678 형식으로 작성해주세요" required maxlength="11">
            </div>
            <button type="submit">아이디 찾기</button>

            <!-- Display error message if available -->
            <c:if test="${not empty errorMessage}">
                <p class="error-message">${errorMessage}</p>
                <%-- console.log(${errorMessage}); --%>
            </c:if>
            
            <!-- Display success message if available -->
            <c:if test="${not empty successMessage}">
                <p class="success-message">${successMessage}</p>
          <%--       console.log(${successMessage}); --%>
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
