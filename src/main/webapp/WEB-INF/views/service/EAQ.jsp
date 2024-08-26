<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 문의</title>
    <style>
        /* 기본적인 스타일 설정 */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }
        #container {
            display: flex;
            margin: 0 auto;
            max-width: 1200px;
        }
        #contents {
            flex: 1;
            padding: 20px;
        }
        .col-aside {
            width: 200px;
            padding: 20px;
            border-right: 1px solid #ddd;
        }
        
        }
        .col-detail {
            flex: 3;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="container">
        <div class="col-aside">
            <ul>
                <li><a href="#">고객센터 메인</a></li>
                <li><a href="#">자주 찾는 질문</a></li>
                <li><a href="#">공지/뉴스</a></li>
                <li><a href="#" class="active">이메일 문의</a></li>
            </ul>
        </div>
        <div id="contents">
            <div class="col-detail">
                <h2>이메일 문의</h2>
                <form id="form1">
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">휴대전화</label>
                        <input type="tel" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="inquiry-type">문의 유형</label>
                        <select id="inquiry-type" name="inquiry-type">
                            <option value="general">일반 문의</option>
                            <option value="complaint">불만</option>
                            <option value="praise">칭찬</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="theater">영화관 선택</label>
                        <select id="theater" name="theater">
                            <option value="">선택하지 않음</option>
                            <option value="theater1">영화관 1</option>
                            <option value="theater2">영화관 2</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea id="content" name="content" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="attachment">첨부파일</label>
                        <input type="file" id="attachment" name="attachment">
                    </div>
                    <div class="form-group">
                        <button type="button" id="emailsubmit">제출</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
