<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 이메일 문의</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .banner {
            width: 100%;
            background-color: #e50914;
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 1.2em;
            font-weight: bold;
        }

        #container {
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #contents {
            width: 100%;
            display: flex;
        }

        .sidebar {
            width: 20%;
            padding: 15px;
            background-color: #f7f7f7;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: fit-content;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .sidebar ul li a:hover {
            color: #e50914;
        }

        .sidebar ul li.on a {
            font-weight: bold;
        }

        .col-detail {
            width: 75%;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .tbl_area {
            margin-bottom: 20px;
        }

        .tbl_notice_list {
            width: 100%;
            border-collapse: collapse;
        }

        .tbl_notice_list th,
        .tbl_notice_list td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .tbl_notice_list th {
            background-color: #f4f4f4;
        }

        .btn_area {
            margin: 20px 0;
            text-align: center;
        }

        .btn_area button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin: 0 5px;
        }

        .btn_area button.btn_cancel {
            background-color: #6c757d;
        }

        .btn_area button:hover {
            opacity: 0.8;
        }

        .btn_area button:focus {
            outline: none;
        }

        .search_area {
            margin-bottom: 20px;
        }

        .search_area input[type="text"] {
            padding: 5px;
            width: 185px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .search_area button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search_area button:hover {
            background-color: #0056b3;
        }

        .paging {
            margin-top: 20px;
        }

        .paging ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .paging li {
            display: inline;
            margin-right: 5px;
        }

        .paging li a {
            text-decoration: none;
            color: #007bff;
        }

        .paging li a:hover {
            text-decoration: underline;
        }

        .paging .btn-paging {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .paging .btn-paging:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: white;
            text-align: center;
            padding: 10px 0;
            border-top: 1px solid #ddd;
        }

        /* 추가적인 스타일 */
        select[disabled] {
            background-color: #e9ecef;
        }

        .type_list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .type_list li {
            margin-bottom: 10px;
        }

        .type_list input[type="radio"] {
            margin-right: 5px;
        }
    </style>
  
</head>

<body>
<%--<%@ include file="/WEB-INF/views/header/header.jsp" %> --%>
    
    <!--<header class="header">
        <nav class="navbar">
            <h1><a href="/">MG Cinema</a></h1>
            <ul class="nav-links">
                <li><a href="/login">로그인</a></li>
                <li><a href="/signup">회원가입</a></li>
                <li><a href="/myhome">My페이지</a></li>
                <li><a href="/serviceHome">고객센터</a></li>
            </ul>
        </nav>
    </header> -->

<div id="container">
    <div id="contents">
        <div class="sidebar">
            <div class="snb">
                <ul>
                    <li><a href="serviceHome">고객센터 메인<i></i></a></li>
                    <li><a href="faq">자주찾는 질문<i></i></a></li>
                    <li><a href="news">공지/뉴스<i></i></a></li>
                    <li class="on"><a href="eaq">이메일 문의<i></i></a></li>
                </ul>
            </div>
        </div>

        <div class="col-detail">
            <form id="form1" name="form1" method="post" novalidate="novalidate" enctype="multipart/form-data">
                <fieldset>
                    <legend>이메일 문의</legend>
                    <div class="tbl_area">
                        <p class="tbl_info_txt">빈 항목은 필수 입력 사항입니다.</p>
                        <br>
                        <table cellspacing="0" cellpadding="0" class="tbl_notice_list">
                            <colgroup>
                                <col style="width: 96px;">
                                <col style="width: 303px;">
                                <col style="width: 96px;">
                                <col style="width: 303px;">
                            </colgroup>
                            <tbody>
                                <!-- 사용자 정보 -->
                                <tr>
                                    <th scope="row"><label for="inp_name">이름</label></th>
                                    <td colspan="3"><strong>이름</strong></td>
                                    <input type="hidden" id="HiddenUserID" name="HiddenUserID" value="a8b75bbf0c34770853ba25093f97aa19">
                                    <input type="hidden" id="HiddenUserName" name="HiddenUserName" value="65273b16994ae5a6">
                                </tr>
                                <tr>
                                    <th scope="row">휴대전화</th>
                                    <td><strong>010-****-1234</strong></td>
                                    <th scope="row">이메일</th>
                                    <td><span>1111111@hhhh.com</span></td>
                                </tr>
                                <!-- 문의 유형 
                                <tr>
                                    <th scope="row">문의유형</th>
                                    <td colspan="3">
                                        <ul class="type_list">
                                            <li id="li_ra_1" class="on"><input type="radio" checked="checked" id="inp_type01" name="sel_qnatype" value="1249"><label for="inp_type01">문의</label></li>
                                            <li id="li_ra_2"><input type="radio" id="inp_type02" name="sel_qnatype" value="1250"><label for="inp_type02">불만</label></li>
                                            <li id="li_ra_3"><input type="radio" id="inp_type03" name="sel_qnatype" value="1251"><label for="inp_type03">칭찬</label></li>
                                            <li id="li_ra_4"><input type="radio" id="inp_type04" name="sel_qnatype" value="1252"><label for="inp_type04">제안</label></li>
                                            <li id="li_ra_5"><input type="radio" id="inp_type05" name="sel_qnatype" value="1253"><label for="inp_type05">기타</label></li>
                                        </ul>
                                    </td>
                                </tr> -->
                                <!-- 문의 제목 및 내용 -->
                                <tr>
                                    <th scope="row"><label for="inp_title">제목</label></th>
                                    <td colspan="3"><input type="text" name="txt_title" id="inp_title" maxlength="100" value=""></td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="inp_content">내용</label></th>
                                    <td colspan="3"><textarea name="txt_content" id="inp_content" cols="70" rows="10"></textarea></td>
                                </tr>	
                                <tr>
                                    <th scope="row">첨부파일</th>
                                    <td colspan="3"><input type="file" name="file_attachment" id="file_attachment"></td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- 추가 버튼 및 폼 버튼 -->
                        <div class="btn_area">
                            <button type="submit" class="btn_submit">제출</button>
                            <button type="button" class="btn_cancel" onclick="eaq">취소</button>
                        </div>
                    </div>
                </fieldset>
            </form>

            <!-- 페이지네이션 -->
            <!--<div class="paging">
                <ul>
                    <li><a href="#" class="btn-paging">이전</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#" class="btn-paging">다음</a></li>
                </ul>
            </div>-->
        </div>
    </div>
</div>

<footer>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</footer>
</body>
</html>
