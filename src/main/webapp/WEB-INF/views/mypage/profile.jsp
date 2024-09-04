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
<title>회원 정보 수정</title>
<style>

</style> 
</head>
<body>
	<%-- <%@ include file="/WEB-INF/views/header/header.jsp"%> --%>
	<!-- 헤더 포함 -->
	<!-- DB 작업 실패 시 에러메세지 출력 -->
	<c:if test="${not empty errorMessage}">
		<script>
			alert('${errorMessage}');
		</script>
	</c:if>

	<!-- 프로필 섹션 -->
	<div class="profile-section">
		<img src="/mypage_image/OO.png" alt="프로필이미지" alt="프로필이미지" width="80" height="80">
		<div class="profile-info">
			<h2 id="nickname"><%= customer.getNickname() %>님</h2>
			<p>
				고객님은 <strong>일반</strong> 고객 입니다.
			</p>
		</div>
		<a href="/profile" class="button">닉네임 설정</a>
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
			<div>
				<div>
					<h3>회원 정보 수정</h3>
				</div>
				<div>
					<form method=post action='/profileUpdate'>
						<table>
							<tr>
								<td></td>
								<td><input type=hidden name=id id=id></td>
							</tr>
							<tr>
								<td><h4>아이디</h4></td>
								<td><input type=text name=uid id=uid readonly></td>
							</tr>
							<tr>
								<td><h4>비밀번호</h4></td>
								<td><input type=password name=passwd id=passwd></td>
							</tr>
							<!-- <tr><td>비밀번호확인</td><td><input type=password name=passwd1></td></tr> -->
							<tr>
								<td><h4>실명</h4></td>
								<td><input type=text name=realname id=realname readonly></td>
							</tr>
							<tr>
								<td><h4>닉네임</h4></td>
								<td><input type="text" name="nickname" id=inputNickname></td>
							</tr>
							<tr>
								<td><h4>e-mail</h4></td>
								<td><input type=text name=email id=email></td>
							</tr>
							<tr>
								<td><h4>주소</h4></td>
								<td><input type=text name=region id=region></td>
							</tr>
							<tr>
								<td><h4>생년월일</h4></td>
								<td><input type="date" name=birthday id=birthday></td>
							</tr>
							<tr>
								<td><h4>통신사</h4></td>
								<td><input type=radio name=tellecom value="LG U+" id="radioLG">LG U+
									<input type=radio name=tellecom value=KT id="radioKT">KT 
									<input type=radio name=tellecom value=SKT id="radioSKT">SKT<br>
									<input type=radio name=tellecom value=SKT-MVNO id="radioSKT-MVNO">SKT알뜰폰
									<input type=radio name=tellecom value=KT-MVNO id="radioKT-MVNO">KT알뜰폰
									<input type=radio name=tellecom value=LG-MVNO id="radioLG-MVNO">U+알뜰폰
									<br></td>
							</tr>
							<tr>
								<td><h4>휴대폰 번호</h4></td>
								<td><input type=text name=mobile id=mobile></td>
							</tr>


							<tr>
								<td><h4>관심분야</h4></td>
								<td><input type="checkbox" name="favorite"
									id="favoriteAction" value="액션">액션 <input
									type="checkbox" name="favorite" id="favoriteComedy" value="코미디">코미디
									<input type="checkbox" name="favorite" id="favoriteDrama"
									value="드라마">드라마<br> <input type="checkbox"
									name="favorite" id="favoriteSF" value="SF">SF <input
									type="checkbox" name="favorite" id="favoriteRomance"
									value="로맨스">로맨스 <input type="checkbox" name="favorite"
									id="favoriteThriller" value="스릴러">스릴러<br> <input
									type="checkbox" name="favorite" id="favoriteHorror" value="공포">공포
									<input type="checkbox" name="favorite" id="favoriteAnimation"
									value="애니메이션">애니메이션 <input type="checkbox"
									name="favorite" id="favoriteFantasy" value="판타지">판타지<br>
									<input type="checkbox" name="favorite" id="favoriteFamily"
									value="가족">가족 <input type="checkbox" name="favorite"
									id="favoriteAdventure" value="모험">모험 <input
									type="checkbox" name="favorite" id="favoriteWar" value="전쟁">전쟁
									<input type="checkbox" name="favorite" id="favoriteMusic"
									value="음악">음악</td>
							</tr>
							<tr>
								<td colspan=2 style='text-align: center'><input
									type="submit" value="수정" class="button">
									<button class="button" onClick="location.href='/myhome'">취소</button>
								</td>
							</tr>
						</table>
					</form>

				</div>

			</div>
		</div>
	</div>
	<%-- <%@ include file="/WEB-INF/views/footer/footer.jsp"%> --%>
	<!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function() {

    $.ajax({
        url: "/customerInfo",
        method: "POST",
        success: function(data) {
            // 서버에서 받아온 데이터로 프로필 섹션 업데이트
            console.log("받아온 데이터 id: " + data.id);
            $('#id').val(data.id);
            $('#uid').val(data.uid);
            $('#passwd').val(data.passwd);
            $('#realname').val(data.realname);
            $('#inputNickname').val(data.nickname);
            $('#email').val(data.email);
            $('#region').val(data.region);
            $('#birthday').val(data.birthday);
            
            // tellecom radio 체크 설정
            if (data.tellecom === "LG U+") {
            $('#radioLG').prop('checked', true);
            } else if (data.tellecom === "KT") {
            $('#radioKT').prop('checked', true);
            } else if (data.tellecom === "SKT") {
            $('#radioSKT').prop('checked', true);
            } else if (data.tellecom === "SKT-MVNO") {
            $('#radioSKT-MVNO').prop('checked', true);
            } else if (data.tellecom === "KT-MVNO") {
            $('#radioKT-MVNO').prop('checked', true);
            }else if (data.tellecom === "LG-MVNO") {
            $('#radioLG-MVNO').prop('checked', true);
            }
            
            $('#mobile').val(data.mobile);
            
            // favorite checkbox 설정
            var favorites = data.favorite.split(',');
            
            favorites.forEach(function(fav) {
                fav = fav.trim(); // 공백 제거
                // value 속성에 해당하는 checkbox를 찾아서 체크
                $('input[name="favorite"][value="' + fav + '"]').prop('checked', true);
            });
        },
        error: function() {
            $('#nickname').text("알수없음");
            console.log("AJAX Error:", textStatus, errorThrown);
        }
    });
});

</script>
</html>