<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 생성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header, footer {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            text-align: center;
        }
        h1 {
            margin: 0;
        }
        a {
            color: #fff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <header>
        <h1>FAQ 생성</h1>
        <!-- FAQ 목록으로 돌아가기 링크 -->
        <a href="<c:url value='/faq' />">목록으로 돌아가기</a>
    </header>
    
    <form action="<c:url value='/FAQcreate' />" method="post">
        <label for="selected">구분:</label>
        <select id="selected" name="selected" required>
            <option value="" disabled selected>목록을 선택하세요</option>
            <option value="예매/매표">예매/매표</option>
            <option value="결제수단">결제수단</option>
            <option value="영화관이용">영화관이용</option>
            <option value="특별관">특별관</option>
            <option value="홈페이지/모바일">홈페이지/모바일</option>
        </select>
        
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" value="${faqDTO.title}" required>

        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="4" required>${faqDTO.content}</textarea>

        <button type="submit">저장</button>
    </form>
    
    <footer>
        <p>&copy; 2024 Cinema Service</p>
    </footer>
</body>
</html>
