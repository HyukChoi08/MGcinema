<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/detail_css/chartdetail.css">
</head>
<style>
td {
 border:1px solid black;
}
</style>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div class="maincontainer">
	<div class="top">
		<table class="ftbl">
			<tr>
				<td class="imgcell" rowspan=6>1</td><td>2</td>
			</tr>
			<tr>
				<td>3</td>
			</tr>
			<tr>
				<td>5</td>
			</tr>
			<tr>
				<td>7</td>
			</tr>
			<tr>
				<td>9</td>
			</tr>
			<tr>
				<td>11</td>
			</tr>
		</table>
	</div>
	<div class="mid"></div>
	<div class="bot"></div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
let getmname = "트위스터스";
$(document).ready(function(){
	


	function loadMovied(){
		
	}
})
</script>
</html>