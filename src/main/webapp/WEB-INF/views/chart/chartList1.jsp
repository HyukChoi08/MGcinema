<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>되나연</title>
    <style>

body {
    flex-direction: column; /* 세로 방향으로 배치 */
    justify-content: space-between; /* 푸터를 아래쪽으로 이동 */
    align-items: center; /* 가운데 정렬 */
    height: 100vh; /* 뷰포트 높이와 같게 설정 */
    background-color: black;
    color: white;
}
.vertical-container1 {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 1000px;
    height: 100vh; /* 또는 필요한 높이 설정 */
    padding: 20px; /* 필요에 따라 패딩 추가 */
    box-sizing: border-box;
    margin-top:150px;
    margin-bottom:100px;
}
.vertical-container4 {
    display: flex;
    flex-direction: column;
    align-items: center; /* 가운데 정렬 */
    justify-content: center; /* 수직 중앙 정렬 */
    height: 150vh; /* 전체 뷰포트 높이 */
    width: 100%; /* 전체 너비 */
    padding: 20px; /* 적절한 여백 추가 */
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
    align-items: flex-start;
    width: 800px;
}
.flex-container3 {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;
    width: 800px;
    color:#c7b199;
}
.flex-container3 li {
    margin-right: 20px; /* 각 <li> 요소 사이의 간격 설정 */
    font-size: 18px;    /* 글씨 크기 설정 */
}

.flex-container3 li:last-child {
    margin-right: 0;    /* 마지막 <li> 요소의 오른쪽 간격 제거 */
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
    background-color: #000000; /* 배경색 설정 */
    padding: 16px; /* 내부 여백 추가 */
    border-radius: 8px; /* 모서리 둥글게 */ 
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* 그림자 추가 */
    color:white;
    border:1px solid #808080;
}
a {
    text-decoration-line: none;
    color:#c7b199;
}
.title {
  margin-bottom: 10px; /* 원하는 만큼 상단으로 이동 */
}
.reviewupdete {
  background-color: black;
  border: none;
  float: left; /* 버튼을 왼쪽으로 붙임 */
}
.left-aligned {
    text-align: left;
    margin: 0; /* 여백 제거 */
    padding: 0; /* 패딩 제거 */
    width: 55%; /* 부모 요소의 너비를 가득 채우게 설정 */
}


#reviewcomment {
    background-color: #222; /* 배경 색상 (어두운 회색) */
    color: #ddd;            /* 텍스트 색상 (밝은 회색) */
    border: 1px solid #555; /* 테두리 색상 */
    padding: 10px;          /* 여백 추가 */
    border-radius: 5px;    /* 모서리 둥글게 */
    width: 700px;
    height: 100px;
    resize: none;      /* 사용자가 세로 방향으로 크기를 조절할 수 있도록 설정 */
}

#putcomment {
    background-color: #444; /* 버튼 배경 색상 (어두운 회색) */
    color: #f808080;            /* 버튼 텍스트 색상 (밝은 회색) */
    border: 1px solid #666; /* 버튼 테두리 색상 */
    padding: 8px 20px;     /* 버튼 여백 */
    border-radius: 5px;    /* 버튼 모서리 둥글게 */
    cursor: pointer;        /* 클릭 시 커서 변경 */
    float:right;
}

#putcomment:hover {
    background-color: #555; /* 버튼 호버 시 배경 색상 */
    color: #f808080;            /* 버튼 호버 시 텍스트 색상 */
}
/* 최대 4개의 아이템만 표시 */
.comment-list-container li:nth-child(n+5) {
    display: none;
   
}
#commentList{
color:black;
}
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    <div class="vertical-container4">
<%--     <c:forEach items="${chartList3}" var="chartList3"> --%>
        <div class="vertical-container1">
            <div class="vertical-container">
                <div class="flex-container">
                    <img src="${chartList2}" height="400px">
                    <div class="vertical-container">
                        <div class="title"><h1 id="getmname" data-mname="${chartList3.mname}">${chartList3.mname}</h1></div>
                       <div class="left-aligned" id="reservation">예매율 ${chartList3.reservation} %</div>
                        <div>
                            <dl style="text-align: left;">
                                <dt>감독:&nbsp;${chartList3.director}</dt>
                                <dt>배우 :&nbsp;${chartList3.cast}</dt>
                                <dt>장르 :&nbsp;${chartList3.genre}/관람가:&nbsp;${chartList3.age}/상영시간:&nbsp;${chartList3.runningtime}</dt>
                                <dt>개봉일:&nbsp;${chartList3.releasedate}</dt>
                                <dt>평점:&nbsp;${movieAverageRate}</dt>
                            </dl>
                        </div>
                    </div>
                </div>
                <div>
                <br><br><br>
                    <div>
                        <ul class="flex-container3">
                            <li>상세정보|</li>
                            <li id="apinfo"><a href="/chartdetail?id=${sessionScope.dataId}">감독/출연|</a></li>
                            <li>스틸컷|</li>
                            <li>평점/리뷰|</li>
                            <li>상영시간</li>
                        </ul>
                    </div>
                    <br><br><br>
                    <div style="width:800px" id="movieinfo">${chartList3.movieinfo}</div><br><br>
                    <div>리뷰
                        <span>
                            <div>
                                <p>
                                    <span>
                                        <em>${countreview} 명의 실관람객이 글을 남겨주셨습니다."</em>
                                    </span>
                                </p>
                                <div>
                                    <c:if test="${movieReview == null}">
                                        <!--   <button id="review">리뷰작성</button> -->
                                        <ul id="addtextarea" data-id="${chartList3.id}">
                                            <li>
                                                <input type="hidden" id="moviechart" value="'+chartId+'">
                                                <input type="hidden" id="idcheck"><input type="hidden" id="recommendid">
                                                <input type="hidden" id="idname"><textarea id="reviewcomment" style="width:700px;height:100px;"></textarea>
                                                <select name="rate">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                </select>
                                                <button id="putcomment" style="width: auto; padding: 8px 20px; background-color:#E6E6FA; color: greyblue; border: none; border-radius: 5px;">리뷰등록</button>
                                            </li>
                                        </ul>
                                    </c:if>
                                </div>
                            </div>
                            <select size="1" style="width:100px;height:30px;" id="commentArray">
                                <option value="releasedate desc">최신순</option>
                                <option value="rating desc">평점순</option>
                            </select>
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
    <%-- </c:forEach> --%>
    <div id="appearinfo">
    <div style="display:flex;">
    <ul class="vertical-container">
    <li>
    <c:forEach items="${cainfoprod}" var="cainfoprod">
                        <div>
                    	감독:${cainfoprod.prod}<img src=${cainfoprod.image_path}>
                    </div>
    </c:forEach>
    </li>
    <li class="flex-container">
    <c:forEach items="${cainfoactor}" var="cainfoactor">
                        <div>
                    	배우:${cainfoactor.actor}<img src=${cainfoactor.image_path}>
                    </div>
    </c:forEach>
    </li>
    </ul>
    </div>
    </div>
    </div>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->


</body>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script>
    
    let getmname = $("#getmname").data("mname");
    
/*     $.ajax({
    	url:'/putreservation',
    	type:'post',
    	data:{getmname:getmname},
        success: function(data) {
        	console.log(data)
        	let str = ''
        	$('#reservation').empty();
			str="예매율:"+data;
			console.log(str);
        	
            $('#reservation').append(str);
        }
    }) */
    $.ajax({
    	url:'/updatereservation',
    	type:'post',
    	data:{getmname:getmname},
    	success: function(data){
    		console.log("update",data)
    	}
    })
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

        $(document)
            .on('click', '#putcomment', function() { //리뷰 인서트
                let chartId = $('#addtextarea').data('id');
                console.log("chartList3Id", chartId);
                $('#moviechart').val(chartId);
                let moviechart = $('#moviechart').val();
                let content = $('#reviewcomment').val();
                let uid = '${sessionScope.uid}';
                let nick = '${sessionScope.Nick}';
                let rate = $("[name='rate']").val();
                console.log("uid",uid);
               $('#idname').val(uid);
                if (uid==null||uid==='') {
                    alert('로그인이 필요합니다');
                    $('#reviewcomment').val('');
                    return false;
                } else {
                    $.ajax({
                        url: '/putcomment',
                        type: 'post',
                        data: {moviechart: moviechart, content: content, writer: nick ,uid:uid, rate:rate},
                        success: function(data) {
                            console.log(data);
                            $('#moviechart').val('');
                            $('#reviewcomment').val('');
                            $('#idname').val('');
                            loadreview();
                            
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
        				let uid = '${sessionScope.uid}'
        				console.log(uid);

                        $('#commentList').empty();
                        for(let i = 0; i < data.length; i++) {
                            
                        	console.log("uid = " + uid)
                        	console.log("data[i]['customer_uid'] = " + data[i]['customer_uid'])
                        	str += '<li><div><ul><li id="reviewWriter" value="'+data[i]['id']+'">'+data[i]['writer']+'</li><li>'+data[i]['created_at']+'</li></ul></div><div><p>'+data[i]['content']+'</p></div>';
                        	if(uid == data[i]['customer_uid']){
                        		
                        		console.log("123");
                        		
                        		str+='<textarea id="updetext"></textarea><button data-review-id="'+data[i]['id']+'"id="editcomment">수정</button><button id="deletecomment">삭제</button>';
                        	}
                        	str+= '</li>';
                        }
                        console.log(str)
                        $('#commentList').append(str);
                    }
                });
            })

            .on('click', '#editcomment', function() { //리뷰수정
            	let updeId=$(this).data('review-id');
                $.ajax({
                    url: '/updatereview',
                    type: 'post',
                    data: {id:updeId, content: $('#updetext').val(), rate: $("[name='rate']").val()},
                    dataType: 'text',
                    success: function(data) {
                        console.log(data);
                        loadreview();
                    }
                });
            })
            .on('click', '#deletecomment', function() { //리뷰삭제
            	let updeId=$(this).data('review-id');
                $.ajax({
                    url: '/deletereview',
                    type: 'post',
                    data: {id:updeId},
                    dataType: 'text',
                    success: function(data) {
                        console.log(data);
                        loadreview();
                    }
                });
            });
        $(document).on('click', '.reviewupdete', function() {
            let reviewId = $(this).siblings('div').find('#reviewWriter').attr('value');

            
            // 기존에 추가된 요소 제거
            $(this).parent().find('#updetext, #editcomment, #deletecomment').remove();
            let rate = $(this).data("rate");
            let textarea = '<textarea id="updetext">' + $(this).data("content") + '</textarea>';
            let editButton = '<button data-review-id="' + reviewId + '" id="editcomment">수정</button>';
            let deleteButton = '<button data-review-id="' + reviewId + '" id="deletecomment">삭제</button>';


            let rateSelectBox = '<select name="rate"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select>';
            for(let i = 1; i <= 10; i++) {
                if(i == rate) {
                    rateSelectBox = rateSelectBox.replace('value="' + i + '"', 'value="' + i + '" selected');
                }
            }
            
            $(this).parent().append(textarea + rateSelectBox + editButton + deleteButton);
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
    				let uid = '${sessionScope.uid}'
    					console.log(uid);
    	                let textarea = $('<textarea id="updetext"></textarea>');
    	                let editButton = $('<button id="editcomment">수정</button>');
    	                let deleteButton = $('<button id="deletecomment">삭제</button>')
                    $('#commentList').empty();

                    // 현재 페이지에 해당하는 댓글만 표시
                    let start = (page - 1) * itemsPerPage;
                    let end = start + itemsPerPage;
                    let pageData = data.slice(start, end);

                     for (let i = 0; i < pageData.length; i++) {
                        console.log("uid = " + uid);
                        console.log("pageData[i]['customer_uid'] = " + pageData[i]['customer_uid']);
                        if (uid == pageData[i]['customer_uid']) {
                            str += '<li><div><ul><li id="reviewWriter" value="' + pageData[i]['id'] + '">' + pageData[i]['writer'] + '</li><li>' + pageData[i]['created_at'] + '</li></ul></div><div>' +
                                '<p>' + pageData[i]['content'] + '</p></div><button class="reviewupdete" data-content="' + pageData[i]['content'] + '" data-rate="' + pageData[i]['rate'] + '"><img src="/chartImage/더보기3.jpg"></button>';
                        } else {
                            str += '<li><div><ul><li id="reviewWriter" value="' + pageData[i]['id'] + '">' + pageData[i]['writer'] + '</li><li>' + pageData[i]['created_at'] + '</li></ul></div><div><p>' + pageData[i]['content'] + '</p></div>';
                        }

                        str += '</li>';
                    }
                    console.log(str);
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
</html>
