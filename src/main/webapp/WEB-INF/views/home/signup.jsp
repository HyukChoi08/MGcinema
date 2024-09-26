<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="signup_css/signup.css">

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                        <input type="text" id="mobile" name="mobile" value="${formData.mobile}" placeholder="(필수) 01012345678 형식으로 작성해주세요" required maxlength="11">
                    </div>
                    
                    <%-- 주소 검색 api --%>
                    <div class="addr-wrap">
            			<label for="userAddr1">주소</label>
            			<button type="button" onclick="searchAddr();">주소찾기</button>
            			<input type="text" id="userPostCode" name="userPostCode" placeholder="우편번호" readonly>
            			
            			<input type="text" id="userAddr1" name="userAddr1" placeholder="주소" readonly>
            			<input type="text" id="userAddr2" name="userAddr2" placeholder="상세 주소 입력" required>
       				</div>

                    <div class="form-group">
                        <label for="nickname">닉네임</label>
                        <input type="text" id="nickname" name="nickname" value="${formData.nickname}" placeholder="(필수)" required maxlength="10">
                    </div>
                    <div class="form-group">
                        <label>관심분야</label> <br />
                        <div class="favorite-group">
                            <div class="favorite-group-top">
                                <label>
                                    <input type="checkbox" name="favorite" value="액션" ${formData.favorite.contains('액션') ? 'checked' : ''}>
                                    액션
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="스릴러" ${formData.favorite.contains('스릴러') ? 'checked' : ''}>
                                    스릴러
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="SF" ${formData.favorite.contains('SF') ? 'checked' : ''}>
                                    SF
                                </label>
                            </div>
                            <div class="favorite-group-bottom">
                                <label>
                                    <input type="checkbox" name="favorite" value="코미디" ${formData.favorite.contains('코미디') ? 'checked' : ''}>
                                    코미디
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="로맨스" ${formData.favorite.contains('로맨스') ? 'checked' : ''}>
                                    로맨스
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="판타지" ${formData.favorite.contains('판타지') ? 'checked' : ''}>
                                    판타지
                                </label>
                            </div>
                            <div class="favorite-group-bottom">
                                <label>
                                    <input type="checkbox" name="favorite" value="애니메이션" ${formData.favorite.contains('애니메이션') ? 'checked' : ''}>
                                    애니메이션
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="가족" ${formData.favorite.contains('가족') ? 'checked' : ''}>
                                    가족
                                </label>
                                <label>
                                    <input type="checkbox" name="favorite" value="기타" ${formData.favorite.contains('기타') ? 'checked' : ''}>
                                    기타
                                </label>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="currentStep" value="3">
                    <button type="submit" id="signup" name="signup">회원가입</button>
                    <c:if test="${not empty error}">
            			<div class="error-message">${error}</div>
        			</c:if>
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
 

//kakad map api
 function searchAddr() {
     new daum.Postcode({
     oncomplete: function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성

         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var addr = ''; // 주소 변수

         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { 
             // 사용자가 도로명 주소를 선택했을 경우
             addr = data.roadAddress;
         } else { 
             // 사용자가 지번 주소를 선택했을 경우(J)
             addr = data.jibunAddress;
         }
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         $("#userPostCode").val(data.zonecode);
         $("#userAddr1").val(addr);
         // 커서를 상세주소 필드로 이동한다.
         $("#userAddr2").focus();
     }
     }).open();
 }

</script>   
</html>