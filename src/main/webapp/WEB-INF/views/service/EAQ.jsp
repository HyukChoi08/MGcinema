<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 이메일 문의</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        #container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #contents {
            display: flex;
        }

        .col-aside {
            width: 250px;
            background-color: #f9f9f9;
            padding: 20px;
            border-right: 1px solid #ddd;
        }

        .col-aside ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .col-aside ul li {
            margin-bottom: 10px;
        }

        .col-aside ul li a {
            text-decoration: none;
            color: black;	
            font-size: 1em;
        }

        .col-aside ul li a:hover {
            text-decoration: underline;
        }
        
        .col-aside ul li.on a {
        	font-weight : bold;
        }

        .tbl_area {
            margin: 20px 0;
        }

        .tbl_info_txt {
            margin: 0;
            font-size: 14px;
            color: #333;
        }

        table.tbl_notice_list {
            width: 100%;
            border-collapse: collapse;
        }

        table.tbl_notice_list th,
        table.tbl_notice_list td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table.tbl_notice_list th {
            background-color: #f5f5f5;
            font-weight: bold;
        }

        table.tbl_notice_list .tbl_left {
            width: 100%;
        }

        table.tbl_notice_list input[type="text"],
        table.tbl_notice_list input[type="file"],
        table.tbl_notice_list textarea,
        table.tbl_notice_list select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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

        .byte_info {
            font-size: 12px;
            color: #666;
        }

        .file_info {
            font-size: 12px;
            color: #666;
        }
    </style>
</head>

<body>
    <div id="container">
        <div id="contents">
            <!-- 고객 서비스 메뉴 -->
            <aside class="col-aside">
                <ul>
                        <li><a href="serviceHome">고객센터 메인</a></li>
                        <li><a href="faq">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li class="on"><a href="eaq" title="현재선택">이메일 문의</a></li>
                    </ul>
            </aside>

            <!-- 광고 영역 -->
            <!-- 여기에는 광고 관련 콘텐츠가 들어갑니다. -->

            <!-- 이메일 문의 폼 -->
            <form id="form1" name="form1" method="post" novalidate="novalidate" enctype="multipart/form-data">
                <fieldset>
                    <legend>이메일 문의</legend>
                    <div class="tbl_area">
                        <p class="tbl_info_txt">체크된 항목은 필수 입력 사항입니다.</p>
						<br>
                        <table cellspacing="0" cellpadding="0" class="tbl_notice_list tbl_left">
                            <caption></caption>
                            <colgroup>
                                <col style="width:96px">
                                <col style="width:303px">
                                <col style="width:96px">
                                <col style="width:303px">
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
                                <!-- 문의 유형 -->
                                <tr>
                                    <th scope="row">문의유형</th>
                                    <td colspan="3">
                                        <ul class="type_list">
                                            <li id="li_ra_1" class="on"><input type="radio" checked="checked" id="inp_type01" name="sel_qnatype" value="1249"><label for="inp_type01">문의</label></li>
                                            <li id="li_ra_2"><input type="radio" id="inp_type02" name="sel_qnatype" value="1250"><label for="inp_type02">불만</label></li>
                                            <li id="li_ra_3"><input type="radio" id="inp_type03" name="sel_qnatype" value="1251"><label for="inp_type03">칭찬</label></li>
                                            <li id="li_ra_4"><input type="radio" id="inp_type04" name="sel_qnatype" value="1252"><label for="inp_type04">제안</label></li>
                                            <li id="li_ra_5"><input type="radio" id="inp_type05" name="sel_qnatype" value="2991"><label for="inp_type05">분실물</label></li>
                                        </ul>
                                    </td>
                                </tr>
                                <!-- 영화관 선택 -->
                                <tr>
                                    <th scope="row">영화관 선택</th>
                                    <td colspan="3">
                                        <ul class="type_list">
                                            <li class="on"><input type="radio" id="no_sel" name="sel_theaterchoise" checked="checked" value="0"><label for="no_sel">선택하지 않음</label></li>
                                            <li><input type="radio" id="sel" name="sel_theaterchoise" value="1"><label for="sel">선택함</label></li>
                                        </ul>
                                        <label for="sel_t_group" class="hidden">국내,국외 선택</label>
                                        <select title="국내,국외 선택" class="sel01" id="sel_t_group" name="sel_t_group" disabled="disabled" style="width: 96px;">
                                            <option value="dm">국내</option>
                                            <option value="oc">국외</option>
                                        </select>
                                        <label for="sel_regioncode" class="hidden">지역 선택</label>
                                        <select title="지역 선택" class="sel01" id="sel_regioncode" name="sel_regioncode" disabled="disabled" style="width: 114px;">
                                            <option value="" selected="selected">지역 선택</option>
                                            <!-- 동적으로 채워지는 옵션 -->
                                        </select>
                                        <label for="sel_theatercode" class="hidden">영화관 선택</label>
                                        <select title="영화관 선택" class="sel01" id="sel_theatercode" name="sel_theatercode" disabled="disabled" style="width: 114px;">
                                            <option value="" selected="selected">영화관 선택</option>
                                            <!-- 동적으로 채워지는 옵션 -->
                                        </select>
                                    </td>
                                </tr>
                                <!-- 제목 -->
                                <tr>
                                    <th scope="row"><label for="inp_title">제목 </em></label></th>
                                    <td colspan="3">
                                        <input type="text" id="inp_title" name="inp_title" class="inp01" style="width: 672px;">
                                    </td>
                                </tr>
                                <!-- 내용 -->
                                <tr>
                                    <th scope="row"><label for="inp_textbox">내용</label></th>
                                    <td colspan="3">
                                        <textarea cols="60" rows="5" id="inp_textbox" name="inp_textbox" class="inp_txtbox01" style="height:94px !important;" placeholder="※문의 내용 및 첨부파일 내에 개인정보(신용카드번호, 계좌번호, 주민번호 등)가 포함되지 않도록 유의하시기 바랍니다."></textarea>
                                        <p class="byte_info"><span id="sp_ad_content_size_1">0</span>/5000BYTE <span>(<span id="sp_ad_content_size_2">0</span>/2500자)</span></p>
                                    </td>
                                </tr>
                                <!-- 파일 업로드 -->
                                <tr>
                                    <th scope="row"><label for="voc_upload_file">첨부파일</label></th>
                                    <td colspan="3">
                                        <input type="file" id="voc_upload_file" name="voc_upload_file" class="uploadfile" title="첨부파일" accept="image/*, .pdf, .zip, .hwp, .doc, .docx, .xls, .xlsx">
                                        <p class="file_info">※파일은 최대 10MB까지 첨부 가능합니다.</p>
                                        <p class="file_info">※파일형식: 이미지, PDF, ZIP, 한글문서, 워드문서, 엑셀문서</p>
                                    </td>
                                </tr>
                                <!-- 유의사항 확인 -->
                                <tr>
                                    <th scope="row"><label for="chk_conform" class="regulation">유의사항 확인</label></th>
                                    <td colspan="3">
                                        <input type="checkbox" id="chk_conform" name="chk_conform" value="Y" onclick="conformCheck()">
                                        <label for="chk_conform">유의사항을 확인하였으며, 동의합니다.</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </fieldset>

                <!-- 제출 버튼 -->
                <div class="btn_area">
                    <button type="button" id="btnSubmit" class="btn_submit">제출</button>
                    <button type="button" id="btnCancel" class="btn_cancel">취소</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
