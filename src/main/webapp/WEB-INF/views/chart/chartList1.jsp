<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

ol {
    display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    list-style-type: none; /* 숫자 지우는 것 */
}
</style>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div>
	
	<div class="vertical-container">
	
		<div class="flex-container"><img src="${chartList2}" height="400px"><div class="vertical-container">설명 위에서 아래로 나오게</div>
				
		</div>
		<div>
			<div>
				<ul class="flex-container">
					<li>상세정보|</li><li>감독/출연|</li><li>스틸컷|</li><li>평점/리뷰|</li><li>상영시간</li>
				</ul>
			</div>
			<div>설명창</div>
			<div>평점/리뷰
				<ul id="putcomment">
				
				</ul>
			</div>
		</div>
	</div>
	
</div>
 <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>