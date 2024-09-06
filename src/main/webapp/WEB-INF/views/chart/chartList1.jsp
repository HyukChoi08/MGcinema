<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>되나연</title>
    <style>

.vertical-container1 {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100vh; /* 또는 필요한 높이 설정 */
    padding: 20px; /* 필요에 따라 패딩 추가 */
    box-sizing: border-box;
    margin-top:400px;
    margin-bottom:335px;
}

.vertical-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    width: 800px;
    max-width: 1000px; /* 필요에 따라 최대 너비 설정 */
}

.flex-container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    width: 800px;
}
ol, ul {
     display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
     padding: 0; /* 기본 패딩 제거 */
     margin: 0; /* 기본 마진 제거 */
     list-style-type: none; /* 숫자 지우는 것 */
}
#appearinfo{
	display:none;
	}
.comment-list-container {
    display: flex; /* 플렉스 레이아웃 활성화 */
    flex-direction: column; /* 아이템을 세로로 정렬 */
    gap: 16px; /* 각 아이템 사이의 간격 설정 */
}

.comment-list-container li {
    width: 100%; /* 각 아이템의 너비를 100%로 설정 */
    box-sizing: border-box; /* 패딩과 테두리를 포함하여 전체 너비를 계산 */
    background-color: #f9f9f9; /* 배경색 설정 */
    padding: 16px; /* 내부 여백 추가 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* 그림자 추가 */
}

/* 최대 4개의 아이템만 표시 */
.comment-list-container li:nth-child(n+5) {
    display: none;
}
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    <c:forEach items="${chartList3}" var="chartList3">
        <div class="vertical-container1">
            <div class="vertical-container">
                <div class="flex-container">
                    <img src="${chartList2}" height="400px">
                    <div class="vertical-container">
                        <div>${chartList3.mname}</div>
                        <div>예매율 ${chartList3.reservation} %</div>
                        <div>
                            <dl>
                                <dt>감독:&nbsp;${chartList3.director}</dt>
                                <dt>배우 :&nbsp;${chartList3.cast}</dt>
                                <dt>장르 : &nbsp;${chartList3.genre}/관람가:&nbsp;${chartList3.age}/상영시간:&nbsp;${chartList3.runningtime}</dt>
                                <dt>개봉일:&nbsp;${chartList3.releasedate}</dt>
                            </dl>
                        </div>
                    </div>
                </div>
                <div>
                    <div>
                        <ul class="flex-container">
                            <li>상세정보|</li>
                            <li id="apinfo"><a href="/chartList1?id=${sessionScope.dataId}#menu">감독/출연|</a></li>
                            <li>스틸컷|</li>
                            <li>평점/리뷰|</li>
                            <li>상영시간</li>
                        </ul>
                    </div>
                    <div style="width:800px" id="movieinfo">${chartList3.movieinfo}</div>
                    <div>평점/리뷰
                        <span>
                            <div>
                                <p>
                                    <span>
                                        <em>평가자수"명의 실관람객이 평가해주셨습니다."</em>
                                    </span>
                                </p>
                                <div>
                                    <button id="review">리뷰작성</button>
                                    <ul id="addtextarea" data-id="${chartList3.id}"></ul>
                                </div>
                            </div>
                            <select size="1" style="width:100px;height:30px;" id="commentArray"></select>
                            <button id="comment">Go</button>
                            <div>
                                <ul id="commentList" class="comment-list-container"></ul>
                            </div>
                        </span>
                    </div>
                    <div>
                        <ul id="paging"></ul>
                    </div>

                </div>
            </div>
        </div>
    </c:forEach>
    <div id="appearinfo">
    <div style="display:flex;">
    <c:forEach items="${cainfo}" var="cainfo">
                        <div>
                    	감독:${cainfo.prod}배우:${cainfo.actor}<img src=${cainfo.image_path}>
                    </div>
    </c:forEach>
    
    </div>
    </div>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script>
    
    
    
        //commentArray select에 넣는것
        $.ajax({
            url: '/commentArray',
            type: 'post',
            data: {},
            dataType: "json",
            success: function(data) {
                console.log(data);
                let str = '';
                for(let i = 0; i < data.length; i++) {
                    str += '<option value="'+data[i]['id']+'">'+data[i]['text']+'</option>';
                }
                $('#commentArray').append(str);
            }
        });
        //review를 select시키는 것
        $.ajax({
            url: '/insertselectcomment',
            type: 'post',
            data: {id1:${sessionScope.dataId}},
            dataType: 'JSON',
            success: function(data) {
                let str = '';
                $('#commentList').empty();
                for(let i = 0; i < data.length; i++) {
                    str += '<li><div><ul><li id="reviewWriter" value="'+data[i]['id']+'">'+data[i]['writer']+'</li><li>'+data[i]['created_at']+'</li></ul></div><div><p>'+data[i]['content']+'</p></div></li>';
                }
                $('#commentList').append(str);
              
            }
        });

        $(document)
            .on('click', '#review', function() { //리뷰란
                let chartId = $('#addtextarea').data('id');
                console.log("chartList3Id", chartId);
                let str = '';
                $('#addtextarea').empty();
                str = '<input type="hidden" id="moviechart" value="'+chartId+'"><input type="hidden" id="idcheck"><input type="hidden" id="recommendid"><input type="hidden" id="nickname"><textarea id="reviewcomment" style="width:350px;height:100px;"></textarea><button id="putcomment">리뷰등록</button>';
                $('#addtextarea').append(str);
                let nick = '${sessionScope.Nick}';
                $('#nickname').val(nick);
            })
            .on('click', '#putcomment', function() { //리뷰 인서트
                let moviechart = $('#moviechart').val();
                let content = $('#reviewcomment').val();
                let writer = $('#nickname').val();
                if (!writer) {
                    alert('로그인이 필요합니다');
                    $('#reviewcomment').val('');
                    return false;
                } else {
                    $.ajax({
                        url: '/putcomment',
                        type: 'post',
                        data: {moviechart: moviechart, content: content, writer: writer},
                        success: function(data) {
                            console.log(data);
                            $('#moviechart').val('');
                            $('#reviewcomment').val('');
                            $('#nickname').val('');
                           
                        }
                    });
                }
            })
            .on('click', '#comment', function() { //리뷰 li에 셀렉트
                $.ajax({
                    url: '/insertselectcomment',
                    type: 'post',
                    data: {id1:${sessionScope.dataId}},
                    dataType: 'JSON',
                    success: function(data) {
                        let str = '';
                        $('#commentList').empty();
                        for(let i = 0; i < data.length; i++) {
                            str += '<li><div><ul><li id="reviewWriter" value="'+data[i]['id']+'">'+data[i]['writer']+'</li><li>'+data[i]['created_at']+'</li></ul></div><div><p>'+data[i]['content']+'</p></div></li>';
                        }
                        $('#commentList').append(str);
                        loadreview();
                    }
                });
            })
            .on('click', '#reviewWriter', function() {
                let writer = $(this).text();
                let click = $(this);
                let clickid = $(this).val(); // 여기서 value 속성을 가져옵니다.
                console.log("writer", writer);
                let nick = '${sessionScope.Nick}';
                if (writer === nick) {
                    let text = $('<input type="hidden" id="reviewupdeid">');
                    let textarea = $('<textarea id="updetext"></textarea>');
                    let editButton = $('<button id="editcomment">수정</button>');
                    let deleteButton = $('<button id="deletecomment">삭제</button>');
                    click.after(deleteButton).after(editButton).after(text).after(textarea);
                    $('#reviewupdeid').val(clickid);
                } else {
                    alert('작성자와 닉네임이 일치하지 않습니다.');
                    return false;
                }
            })
            .on('click', '#editcomment', function() { //리뷰수정
                $.ajax({
                    url: '/updatereview',
                    type: 'post',
                    data: {id: $('#reviewupdeid').val(), content: $('#updetext').val()},
                    dataType: 'text',
                    success: function(data) {
                        console.log(data);
                        loadreview();
                    }
                });
            })
            .on('click', '#deletecomment', function() { //리뷰삭제
                $.ajax({
                    url: '/deletereview',
                    type: 'post',
                    data: {id: $('#reviewupdeid').val()},
                    dataType: 'text',
                    success: function(data) {
                        console.log(data);
                        loadreview();
                    }
                });
            });
        
        $(document).on('click', '#apinfo', function() {
            $('#review').hide();
            $('#paging').hide();
            $('#comment').hide();
            $('#commentList').hide();
            $('#commentArray').hide();
            $('#movieinfo').hide();
            $('#appearinfo').show();
        });
        function loadreview(page = 1) {
            $.ajax({
                url: '/insertselectcomment',
                type: 'post',
                data: {id1:${sessionScope.dataId}},
                dataType: 'JSON',
                success: function(data) {
                    let itemsPerPage = 4; // 한 페이지에 표시할 댓글 수
                    let totalPages = Math.ceil(data.length / itemsPerPage);
                    let pagesPerGroup = 10; // 한 그룹에 표시할 페이지 수
                    let currentGroup = Math.ceil(page / pagesPerGroup);
                    let startPage = (currentGroup - 1) * pagesPerGroup + 1;
                    let endPage = Math.min(currentGroup * pagesPerGroup, totalPages);

                    let str = '';
                    $('#commentList').empty();

                    // 현재 페이지에 해당하는 댓글만 표시
                    let start = (page - 1) * itemsPerPage;
                    let end = start + itemsPerPage;
                    let pageData = data.slice(start, end);

                    for (let i = 0; i < pageData.length; i++) {
                        str += '<li><div><ul><li id="reviewWriter" value="'+pageData[i]['id']+'">'+pageData[i]['writer']+'</li><li>'+pageData[i]['created_at']+'</li></ul></div><div><p>'+pageData[i]['content']+'</p></div></li>';
                    }
                    $('#commentList').append(str);

                    // 페이징 버튼 생성
                    let pagingStr = '';
                    if (currentGroup > 1) {
                        pagingStr += '<li><button onclick="loadreview(' + (startPage - 1) + ')">Previous</button></li>';
                    }
                    for (let i = startPage; i <= endPage; i++) {
                        pagingStr += '<li><button onclick="loadreview(' + i + ')">' + i + '</button></li>';
                    }
                    if (endPage < totalPages) {
                        pagingStr += '<li><button onclick="loadreview(' + (endPage + 1) + ')">Next</button></li>';
                    }
                    $('#paging').html(pagingStr);
                }
            });
        }

        // 페이지 로드 시 첫 페이지 댓글 로드
        $(document).ready(function() {
            loadreview();
        });
        
    </script>
</body>
</html>
