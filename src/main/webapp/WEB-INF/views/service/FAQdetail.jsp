<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${faqDetail.title}</title>
    <style>
    
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4; /* 페이지 배경색 */
	}

	/* 상단 배너 스타일 */
	.banner {
    width: 100%;
    background-color: #e50914; /* 배너 배경색 */
    color: white;
    text-align: center;
    padding: 10px 0;
    font-size: 1.2em;
    font-weight: bold;
	}

	/* 메인 컨테이너 스타일 */
	#container {
    max-width: 1200px;
    margin: 20px auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top:150px;
	}

	/* 컨텐츠 영역 스타일 */
	#contents {
    width: 100%;
    display: flex;
	}

	/* 사이드바 스타일 */
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
             text-align: left;
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

	/* 메인 콘텐츠 스타일 */
	.col-detail {
    width: 75%;
    padding: 15px;
    background-color: white;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	}

	/* 고객센터 타이틀 스타일 */
	.customer_top {
    margin-bottom: 20px;
	}
	.customer_top .tit {
    font-size: 1.5em;
    font-weight: bold;
    margin: 0;
     text-align: left;
	}
	.customer_top .stit {
    color: #777;
    font-size: 0.9em;
	}

	/* FAQ 내용 스타일 */
	.view_area {
    margin-top: 20px;
    text-align: left; 
	}
	.view_area pre {
	display: block; /* 기본 블록 레벨 요소로 설정 */
    white-space: pre-wrap; /* 공백과 줄 바꿈 유지 */
	}
	
	.view_area p {
    line-height: 1.6;
    text-align: left; /* 텍스트 왼쪽 정렬 */
	}

/* 조회수 스타일 */
.col-detail p {
    text-align: left; /* 조회수 왼쪽 정렬 */
}

/* 버튼 그룹 스타일 */
.btn-group {
    text-align: center; /* 버튼 그룹을 중앙 정렬 */
    margin-top: 20px;
}
.btn-group button {
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9em;
    margin: 0 10px; /* 좌우 마진 추가 */
}
.btn-edit {
    background-color: #4CAF50; /* 수정 버튼 배경색 (초록색) */
    color: white;
}
.btn-delete {
    background-color: #f44336; /* 삭제 버튼 배경색 (빨간색) */
    color: white;
}
.btn-list {
    background-color: #2196F3; /* 목록 버튼 배경색 (파란색) */
    color: white;
}
.btn-group button:hover {
    opacity: 0.9;
}

/* 푸터 스타일 */
footer {
    background-color: white;
    text-align: center;
    padding: 10px 0;
    border-top: 1px solid #ddd;
}



    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
    <div id="container">
        <div id="contents">
            <!-- 사이드바 -->
            <div class="sidebar">
                <div class="snb">
                    <ul>
                        <li><a href="serviceHome">고객센터 메인</a></li>
                        <li><a href="faq">자주찾는 질문</a></li>
                        <li><a href="news">공지/뉴스</a></li>
                        <li><a href="inquiry">이메일 문의</a></li>
                    </ul>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="col-detail">
                <div class="customer_top">
                    <h2 class="tit">${faqDetail.title}</h2>
                    <p class="stit">작성일: ${formattedDate}</p>
                </div>  
                <div class="view_area">
                    <pre>${faqDetail.content}</pre>
                </div>
                <p>조회수: ${faqDetail.views}</p>

                <!-- 버튼 그룹 -->
                <div class="btn-group">
                    <button class="btn-list" onclick="location.href='faq'">목록</button>
                    <button class="btn-edit" onclick="location.href='FAQedit?id=${faqDetail.id}'">수정</button>
                    <button class="btn-delete" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='FAQdelete?id=${faqDetail.id}'">삭제</button> 
                </div>
            </div>
        </div>
    </div>

    <footer>
        <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
    </footer>
</body>
</html>