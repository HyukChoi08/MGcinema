<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="signup_css/signup.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    <div class="signup-page">
        <h2>회원가입</h2>
        <div class="step-indicator">
            <div class="step ${currentStep == 1 ? 'active' : ''}">STEP 1</div>
            <div class="step ${currentStep == 2 ? 'active' : ''}">STEP 2</div>
            <div class="step ${currentStep == 3 ? 'active' : ''}">완료</div>
        </div>

        <c:choose>
            <c:when test="${currentStep == 1}">
                <div class="privacy-policy">
                    <h3>개인정보 수집 및 이용 목적</h3>
                    <p>서비스 이용에 따른 본인식별 및 실명인증, 가입의사 확인, 연령제한 서비스 (VOD) 이용 기관정보 안내를 위한 <br />
                    뉴스레터 발송, 정보 확보, 접속빈도 파악, 회원의 서비스 이용에 대한 통계 집계, 이벤트 참여 기회 제공.</p>

                    <h3>수집하는 개인정보의 항목</h3>
                    <p>회원가입 과정에서 필수항목 (이름, 생년월일, 아이디, 주소, 휴대폰, 이메일) 서비스 이용과정에서 <br />
                    자동으로 생성되는 정보 (쿠키, 방문 일시, 서비스 이용 기록).</p>

                    <h3>개인정보의 보유 및 이용기간</h3>
                    <p>홈페이지 회원 가입 및 관리: 2년. <br />
                    다만, 전자상거래에서의 소비자보호에 관한 법률 등 <br />
                    타법률에 의해 보존할 필요가 있는 경우에는 일정기간 보존 (최대 5년).</p>

                    <h3>동의 거부 권리</h3>
                    <p>이용자는 개인정보 수집 및 이용에 대해 동의를 거부할 권리가 있으나, <br />
                    동의 거부 시 회원가입 및 회원전용서비스 (VOD) 이용이 제한됩니다.</p>
                    
                    <div class="agree-checkbox">
                        <input type="checkbox" id="agree" name="agree">
                            ${agreed ? 'checked' : ''}
                        <label for="agree">위 약관에 동의합니다.</label>
                    </div>
                    
                    <form class="form" action="/signupPost" method="post">
                    <input type="hidden" name="currentStep" value="2">
                        <button id="agreed" type="submit">다음 단계</button>
                    </form>
                </div>
            </c:when>
            <c:when test="${currentStep == 2}">
                <form action="/signupPost" method="post">
                    <div class="form-group">
                        <label for="realname">실명</label>
                        <input type="text" id="realname" name="realname" value="${formData.realname}" placeholder="(필수)" required>
                    </div>
                    <div class="form-group">
                        <label for="email">e-mail</label>
                        <input type="email" id="email" name="email" value="${formData.email}" placeholder="(필수)" required autocomplete="email">
                    </div>
                    <div class="form-group">
                        <label for="uid">아이디</label>
                        <input type="text" id="uid" name="uid" value="${formData.uid}" placeholder="(필수)" required>
                    </div>
                    <div class="form-group">
                        <label for="passwd">비밀번호</label>
                        <input type="password" id="passwd" name="passwd" value="${formData.passwd}" placeholder="(필수)" required autocomplete="new-password">
                    </div>
                    <div class="form-group">
                        <label for="passwd2">비밀번호 확인</label>
                        <input type="password" id="passwd2" name="passwd2" value="${formData.passwd2}" placeholder="(필수)" required autocomplete="new-password">
                    </div>
                    <div class="form-group">
                        <label for="birthday">생년월일</label>
                        <input type="date" id="birthday" name="birthday" value="${formData.birthday}" placeholder="생년월일 (필수)" required>
                    </div>
                    <div class="form-group">
                        <label>통신사</label><br />
                        <div class="tellecom-group">
                            <div class="tellecom-group-top">
                                <label>
                                    <input type="radio" id="tellecom-skt" name="tellecom" value="SKT" ${formData.tellecom == 'SKT' ? 'checked' : ''}>
                                    SKT
                                </label>
                                <label>
                                    <input type="radio" id="tellecom-kt" name="tellecom" value="KT" ${formData.tellecom == 'KT' ? 'checked' : ''}>
                                    KT
                                </label>
                                <label>
                                    <input type="radio" id="tellecom-lg" name="tellecom" value="LG U+" ${formData.tellecom == 'LG U+' ? 'checked' : ''}>
                                    LG U+
                                </label>
                            </div>
                            <div class="tellecom-group-bottom">
                                <label>
                                    <input type="radio" id="tellecom-sm" name="tellecom" value="SM" ${formData.tellecom == 'SM' ? 'checked' : ''}>
                                    SKT 알뜰폰
                                </label>
                                <label>
                                    <input type="radio" id="tellecom-km" name="tellecom" value="KM" ${formData.tellecom == 'KM' ? 'checked' : ''}>
                                    KT 알뜰폰
                                </label>
                                <label>
                                    <input type="radio" id="tellecom-um" name="tellecom" value="UM" ${formData.tellecom == 'UM' ? 'checked' : ''}>
                                    LG U+ 알뜰폰
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mobile">전화번호</label>
                        <input
                            type="text" id="mobile" name="mobile" value="${formData.mobile}" placeholder="(필수) 01012345678 형식으로 작성해주세요" required maxlength="11">
                    </div>
                    <div class="form-group">
                        <label for="region">주소</label>
                        <input
                            type="text" id="region" name="region" value="${formData.region}" placeholder="(선택)">
                    </div>
                    <div class="form-group">
                        <label for="nickname">닉네임</label>
                        <input type="text" id="nickname" name="nickname" value="${formData.nickname}" placeholder="(필수)" required>
                    </div>
                    <div class="form-group">
                        <label>관심분야</label> <br />
                        <div class="favorite-group">
                            <div class="favorite-group-top">
                                <label>
                                    <input type="checkbox" name="favorite" value="Action" ${formData.favorite.contains('Action') ? 'checked' : ''}>
                                    액션
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="Thriller" ${formData.favorite.contains('Thriller') ? 'checked' : ''}>
                                    스릴러
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="Science Fiction" ${formData.favorite.contains('Science Fiction') ? 'checked' : ''}>
                                    SF
                                </label>
                            </div>
                            <div class="favorite-group-bottom">
                                <label>
                                    <input type="checkbox" name="favorite" value="Comedy" ${formData.favorite.contains('Comedy') ? 'checked' : ''}>
                                    코미디
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="Romance" ${formData.favorite.contains('Romance') ? 'checked' : ''}>
                                    멜로
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="Fantasy" ${formData.favorite.contains('Fantasy') ? 'checked' : ''}>
                                    판타지
                                </label>
                            </div>
                            <div class="favorite-group-bottom">
                                <label>
                                    <input type="checkbox" name="favorite" value="Animation" ${formData.favorite.contains('Animation') ? 'checked' : ''}>
                                    애니메이션
                                </label>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="currentStep" value="3">
                    <button type="submit" id="signup" name="signup">회원가입</button>
                </form>     
            </c:when>
         
            <c:when test="${currentStep == 3}">
                <div style="height:700px;">
                    회원가입이 성공적으로 완료되었습니다. <br />
                    <form class="form" action="/login">
                        <button type="submit">로그인 페이지로 이동</button>
                    </form>
                </div>
            </c:when>
          
        </c:choose>
	
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
    </div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
 $(document)
.on('click','#agreed',function(){
	if($('#agree').prop('checked')){
	}else{
		alert("약관에 동의를 해주세요")
		event.preventDefault();
	}
})

$(function() {
    var today = new Date().toISOString().split('T')[0];
    $('#birthday').attr('max', today);
});
 </script>   
</html>