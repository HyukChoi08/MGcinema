<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>되나연</title>
</head>
<style>
.flex-container {
    display: flex;
    justify-content: space-around;
    list-style-type: none;
}

.vertical-container {
    display: flex;
    flex-direction: column; /* 세로 정렬 */
    align-items: center; /* 가운데 정렬 */
}
.vertical-container1 {
    display: flex;
    flex-direction: column; /* 세로 정렬 */
    align-items: center; /* 가운데 정렬 */
    width:1000px;
}

ol {
    display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    list-style-type: none; /* 숫자 지우는 것 */
}
</style>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<c:forEach items="${chartList3}" var="chartList3">
<div class="vertical-container1">
	
	<div class="vertical-container">
	
		<div class="flex-container"><img src="${chartList2}" height="400px"><div class="vertical-container"><div>${chartList3.mname}</div><div>예매율 ${chartList3.reservation} %</div><div><dl><dt>감독:&nbsp;${chartList3.director}</dt><dt>배우 :&nbsp;${chartList3.cast}</dt><dt>장르 : &nbsp;${chartList3.genre}/관람가:&nbsp;${chartList3.age}/상영시간:&nbsp;${chartList3.runningtime}</dt><dt>개봉일:&nbsp;${chartList3.releasedate}</dt></dl></div></div>
				
		</div>
		<div>
			<div>
				<ul class="flex-container">
					<li>상세정보|</li><li>감독/출연|</li><li>스틸컷|</li><li>평점/리뷰|</li><li>상영시간</li>
				</ul>
			</div>
			<div style="width:670px">${chartList3.movieinfo}</div>
			<div>평점/리뷰
				<ul id="putcomment">
				
				</ul>
			</div>
		</div>
	</div>
	
</div>
</c:forEach>
 <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
</html>