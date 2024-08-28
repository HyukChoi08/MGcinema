<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴</title>
<style>
/* 전체 body 스타일 설정 */
body {
   font-family: Arial, sans-serif;
   margin: 0;
   padding: 0;
   background-color: #f4f4f4; /* 페이지 배경색 */
}

/* 프로필 섹션 스타일 */
.profile-section {
   display: flex; /* 이미지와 텍스트를 옆으로 배치 */
   align-items: center; /* 수직 중앙 정렬 */
   padding: 20px;
   background-color: white; /* 프로필 섹션 배경색 */
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 프로필 섹션 그림자 효과 */
   width: 80%; /* 프로필 섹션의 너비 조정 */
   margin: 20px auto;
   border-radius: 10px; /* 모서리 둥글게 */
}

.profile-section img {
   border-radius: 50%; /* 이미지 원형으로 만들기 */
   margin-right: 15px; /* 이미지와 텍스트 사이 간격 */
}

.profile-section .profile-info {
   flex-grow: 1; /* 프로필 정보의 너비를 남은 공간에 맞추기 */
}

.button {
   background-color: #e50914; /* 버튼 배경색 */
   color: white;
   padding: 5px 20px;
   text-align: center; /* 텍스트 중앙 정렬 */
   border-radius: 5px; /* 모서리 둥글게 */
   text-decoration: none; /* 링크 밑줄 제거 */
   display: inline-block;
   margin-top: 10px;
}

.button:hover {
   background-color: #d10813; /* 버튼에 마우스 올렸을 때 색상 */
}

/* 메인 컨테이너 스타일 */
.container {
   display: flex; /* 사이드바와 메인 콘텐츠를 옆으로 배치 */
   max-width: 1200px;
   margin: 20px auto;
}

/* 사이드바 스타일 */
.sidebar {
   width: 25%; /* 사이드바 너비 */
   padding: 15px;
   background-color: #f7f7f7; /* 사이드바 배경색 */
   box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* 사이드바 그림자 효과 */
   height: fit-content; /* 사이드바의 높이를 내용에 맞추기 */
   border-radius: 10px; /* 모서리 둥글게 */
}

/* 사이드바 내 리스트 스타일 */
.sidebar ul {
   list-style-type: none;
   padding: 0; /* 기본 패딩 제거 */
}

.sidebar ul li {
   margin-bottom: 15px; /* 리스트 간 간격 */
}

.sidebar ul li a {
   text-decoration: none; /* 링크 밑줄 제거 */
   color: #333; /* 텍스트 색상 */
   font-weight: bold; /* 텍스트 굵게 */
   transition: color 0.3s ease; /* 텍스트 색상 변경 시 애니메이션 추가 */
}

.sidebar ul li a:hover {
   color: #e50914; /* 링크에 마우스 올렸을 때 색상 */
}

/* 메인 콘텐츠 스타일 */
.main-content {
   width: 75%;
   padding: 20px;
   background-color: white; /* 메인 콘텐츠 배경색 */
   margin-left: 20px; /* 사이드바와 메인 콘텐츠 사이 간격 */
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 메인 콘텐츠 섹션 그림자 효과 */
   border-radius: 10px; /* 모서리 둥글게 */
}

/* 폼 스타일 */
form {
   display: flex;
   flex-direction: column; /* 폼 요소들을 세로로 정렬 */
}

form label {
   margin-bottom: 5px;
   font-weight: bold;
}

form input, form textarea {
   padding: 10px;
   margin-bottom: 20px;
   border: 1px solid #ddd;
   border-radius: 5px;
   font-size: 16px;
   box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
   transition: border-color 0.3s ease; /* 경계선 색상 변경 시 애니메이션 추가 */
   width: 250px; /* 가로 길이 설정 */
}

form input:focus, form textarea:focus {
   border-color: #e50914; /* 포커스 시 경계선 색상 변경 */
   outline: none; /* 기본 아웃라인 제거 */
}

form input[type="submit"] {
   background-color: #e50914;
   color: white;
   border: none;
   cursor: pointer;
   transition: background-color 0.3s ease; /* 배경색 변경 시 애니메이션 추가 */
   width: 150px; /* 가로 길이 설정 */
}

form input[type="submit"]:hover {
   background-color: #d10813; /* 마우스 올렸을 때 색상 */
}

/* 관리자 응답 스타일 */
.response {
   margin-top: 40px;
   padding: 20px;
   background-color: #f7f7f7;
   border: 1px solid #ddd;
   border-radius: 10px;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 응답 섹션 그림자 효과 */
}

.response h2 {
   margin-top: 0;
   color: #e50914; /* 제목 색상 */
}

.response p {
   line-height: 1.6;
}

/* 문의 내역 테이블 스타일 */
.inquiry-table {
   width: 100%;
   border-collapse: collapse; /* 테이블 경계선 겹치기 */
   margin-top: 40px;
}

.inquiry-table th, .inquiry-table td {
   padding: 12px 15px;
   text-align: left;
   border: 1px solid #ddd;
}

.inquiry-table th {
   background-color: #f7f7f7;
   font-weight: bold;
}

.inquiry-table tr:nth-child(even) {
   background-color: #f9f9f9;
}

.status-complete {
   color: green;
   font-weight: bold;
}

.status-pending {
   color: red;
   font-weight: bold;
}
</style>
</head>
<body>
 
   <!-- 프로필 섹션 -->
   <div class="profile-section">
      <img src="profile-placeholder.png" width="80" height="80">
      <div class="profile-info">
         <h2 id="nickname">Hi_Movie님</h2>
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
    <form action="/deleteCustomer" method="post" onsubmit="return passerror();">
        <table>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="passwd" id="passwd" placeholder="탈퇴할거야?" required></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="passwd1" id="passwd1" placeholder="진짜루?ㅠ" required></td>
            </tr>
            <tr>
                <td>탈퇴 사유</td>
                <td><textarea name="message" id="message" rows="6" required placeholder="탈퇴 사유를 기입해주세요."></textarea></td>
            </tr>
        </table>
        <input type="submit" value="탈퇴하기">
    </form>



      </div>
   </div>
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
 
