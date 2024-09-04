<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cinema.mypage.CustomerDTO" %>
<%
    // 세션에서 cusrDTO 객체 가져오기
    CustomerDTO customer = (CustomerDTO) session.getAttribute("cusDTO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="/mypage_css/mypage.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴</title>
<style>

</style> 
</head>
<body>
	<%-- <%@ include file="/WEB-INF/views/header/header.jsp"%> --%>
	<!-- 헤더 포함 -->
	<!-- 프로필 섹션 -->
	<div class="profile-section">
		<img src="/mypage_image/OO.png" alt="프로필이미지" width="80" height="80">
		<div class="profile-info">
			<h2 id="nickname"><%= customer.getNickname() %>님</h2>
			<p>
				고객님은 <strong>일반</strong> 고객 입니다.
			</p>
		</div>
		<a href="#" class="button">닉네임 설정</a>
	</div>

	<!-- 메인 컨테이너 -->
	<div class="container">
		<!-- 사이드바 -->
		<div class="sidebar">
			<ul>
				<li><a href="/myhome">MY HOME</a></li>
				<li><a href="/reservation">나의 예매정보</a></li>
				<li><a href="/payment">결제 내역</a></li>
				<li><a href="/inquiry">1:1 문의</a></li>
				<li><a href="/profile">개인 정보 변경</a></li>
				<li><a href="/cancel">회원 탈퇴</a></li>

			</ul>
		</div>

		<!-- 메인 콘텐츠 -->
		<div class="main-content">
			<h2>회원 탈퇴</h2>

			<!-- 회원탈퇴 -->
			<!-- 문의 폼 -->
			<form action="/deleteCustomer" method="post"
				onsubmit="return passerror();">
				<table>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="passwd" id="passwd"
							placeholder="탈퇴할거야?" required></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="passwd1" id="passwd1"
							placeholder="진짜루?ㅠ" required></td>
					</tr>
					<tr>
						<td>탈퇴 사유</td>
						<td><textarea name="message" id="message" rows="6" required
								placeholder="탈퇴 사유를 기입해주세요."></textarea></td>
					</tr>
				</table>
				<input type="submit" value="탈퇴하기">
			</form>



		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>
function passerror() {
    // 비밀번호와 비밀번호 확인 입력 필드 가져오기
    var passwd = document.getElementById('passwd').value;
    var passwd1 = document.getElementById('passwd1').value;

    // 비밀번호가 일치하지 않으면 얼럿을 띄우고 false를 반환
    if (passwd !== passwd1) {
        alert('비밀번호가 일치하지 않습니다. 다시 입력해 주세요.');
        return false;
    }
    // 비밀번호가 일치하면 true를 반환하여 폼 제출을 허용
    return true;
}
</script>
</html>

