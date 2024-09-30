<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화상세페이지</title>
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
    flex-grow: 1; /* 남은 공간을 모두 차지하도록 설정 */
    display: flex;
    flex-direction: column; /* 세로 방향으로 배치 */
    align-items: center; /* 가운데 정렬 */
    justify-content: flex-start; /* 상단 정렬 */
    width: 1000px; /* 전체 너비 */
    
}
.vertical-container4 {
    display: flex; /* 플렉스 컨테이너로 설정 */
    flex-direction: column; /* 세로 방향으로 배치 */
    align-items: center; /* 가운데 정렬 */
    justify-content: flex-start; /* 상단 정렬 */
    min-height: 100vh; /* 최소 높이를 뷰포트 높이로 설정 */
    margin-top:80px;
    box-sizing: border-box; /* 패딩 포함 전체 높이 계산 */
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
    width: 750px;
    color: #c7b199;
    border-top: 2px solid #c7b199;
    border-bottom: 2px solid #c7b199;
    margin: 0px;
    height:25px;
}
.flex-container3 li {
	width:90px;
    margin-right: 20px;
    font-size: 18px;
}

.flex-container3 li:last-child {
    margin-right: 0;    /* 마지막 <li> 요소의 오른쪽 간격 제거 */
}
ol, ul {
     display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
     padding: 0; /* 기본 패딩 제거 */
     margin: 0; /* 기본 마진 제거 */
     list-style-type: none; /* 숫자 지우는 것 */
     margin-block-start: 1em;
     margin-block-end: 1em;
     margin-inline-start: 0px;
     margin-inline-end: 0px;
     padding-inline-start: 40px;
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
#buyMovieTicket a {
	color: #BE2E22;
}
#buyMovieTicket a:hover{
    background-color: #555;
    color: #F808080;
}

.title {
  margin-bottom: 10px; /* 원하는 만큼 상단으로 이동 */
}
.reviewupdete {
  background-color: black;
  border: none;
  float: left; /* 버튼을 왼쪽으로 붙임 */
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

#rate{
    background-color: #444; /* 배경 색상 (어두운 회색) */
    color: #ddd;            /* 글자 색상 (밝은 회색) */
    border: 1px solid #666; /* 테두리 색상 */
    border-radius: 5px;     /* 모서리 둥글게 */
    padding: 5px;           /* 내부 여백 */
    width: 55px;            /* 너비 100%로 설정 */
    height: 35px;
    appearance: none;       /* 기본 스타일 제거 (브라우저에 따라 다를 수 있음) */
}
#rateSelectBox {
    background-color: #444; /* 배경 색상 (어두운 회색) */
    color: #ddd;            /* 글자 색상 (밝은 회색) */
    border: 1px solid #666; /* 테두리 색상 */
    border-radius: 5px;     /* 모서리 둥글게 */
    padding: 5px;           /* 내부 여백 */
    width: 60px;            /* 너비 100%로 설정 */
    appearance: none;       /* 기본 스타일 제거 (브라우저에 따라 다를 수 있음) */
}

#rateSelectBox {
    padding: 5px;           /* 내부 여백 추가 */
}

/* 호버 시 스타일 */
#rate:hover,
#rateSelectBox:hover {
    background-color: #555; /* 호버 시 배경 색상 */
    color: #fff;            /* 호버 시 글자 색상 */
}
#editcomment, #deletecomment {
    background-color: #444; /* 배경 색상 (어두운 회색) */
    color: #ddd; /* 텍스트 색상 (밝은 회색) */
    border: 1px solid #666; /* 테두리 색상 */
    border-radius: 5px; /* 모서리 둥글게 */
    padding: 8px 16px; /* 버튼 여백 */
    cursor: pointer; /* 클릭 시 커서 변경 */
    margin-left: 10px; /* 버튼 간 간격 */
}

#editcomment:hover, #deletecomment:hover {
    background-color: #555; /* 호버 시 배경 색상 */
    color: #fff; /* 호버 시 텍스트 색상 */
}
#updetext{
    background-color: #222; /* 배경 색상 (어두운 회색) */
    color: #ddd;            /* 텍스트 색상 (밝은 회색) */
    border: 1px solid #555; /* 테두리 색상 */
    padding: 10px;          /* 여백 추가 */
    border-radius: 5px;    /* 모서리 둥글게 */
    width:300px;
    height:100px;
    resize: none;      /* 사용자가 세로 방향으로 크기를 조절할 수 있도록 설정 */
}
.textPosition {
    margin-right: 100px; /* 상단 마진을 줄이기 */
}
.left-aligned {
    text-align: left;
	width: 480px;

}
.text-size {
    font-size: 24px; /* 원하는 글씨 크기로 설정 */
    border-top: 2px solid #c7b199; /* 위쪽 경계선 */
    border-bottom: 2px solid #c7b199; /* 아래쪽 경계선 */
    padding: 10px 0; /* 상하 여백 추가 */
    text-align: center; /* 텍스트 중앙 정렬 */
}
#putcomment {
    padding: 8px 20px; /* 여백 설정 */
    background-color: #E6E6FA; /* 배경색 설정 */
    color: greyblue; /* 글자색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥글게 설정 */
}
.comment-input-container {
    display: flex; /* 수평으로 배치 */
    align-items: flex-end; /* 아래쪽으로 정렬 */
}
.rate-button-container {
    display: flex; /* 수평으로 배치 */
    align-items: flex-end; /* 아래쪽 정렬 */
}
.flex-container3 li:hover {
    background-color: #555; /* 원하는 배경색으로 설정 */
    cursor: pointer; /* 마우스 커서 변경 */
}
.reviewStatus {
    text-align: center; /* 가운데 정렬 */
    display: flex; /* 플렉스 박스로 변경 */
    justify-content: center; /* 수평 가운데 정렬 */
}
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    <div class="vertical-container4">
			<input type=hidden id="hid" value="${sessionScope.id}">
        <div class="vertical-container1">
            <div class="vertical-container">
                <div class="flex-container">
                    <img src="${chartList2}" height="400px" class="movieImage">
                    <div class="vertical-container">
                        <div class="title"><h1 id="getmname" data-mname="${chartList3.mname}">${chartList3.mname}</h1></div><input type="hidden" id="mnameSave" value="${chartList3.mname}">
                        <div class="left-aligned">
                            <dl  class="textPosition">
                            	<dt>예매율:&nbsp;${chartList3.reservation} %</dt><br>
                                <dt>감독:&nbsp;${chartList3.director}</dt><br>
                                <dt>배우 :&nbsp;${chartList3.cast}</dt><br>
                                <dt>장르 :&nbsp;${chartList3.genre}/관람이용가:&nbsp;${chartList3.age}/상영시간:&nbsp;${chartList3.runningtime}</dt><br>
                                <dt>개봉일:&nbsp;${chartList3.releasedate}</dt><br>
                                <div id="movieAverageRate"></div><br>
                                <div id="buyMovieTicket"><a href="/ticket?mname=${chartList3.mname}">예매하기</a></div>
                            </dl>
                        </div>
                    </div>
                </div>
                <div>
                <br><br><br>
                    <div>
                        <ul class="flex-container3">
                            <li><a href="#movieAverageRate">상세정보</a></li>
                            <li id="apinfo"><a href="/chartdetail?id=${sessionScope.dataId}">감독/출연</a></li>
                            <li><a href="/chartcut?id=${sessionScope.dataId}">스틸컷</a></li>
                            <li><a href="#commentList">평점/리뷰</a></li>
                            <li><a href="/cinema">상영시간</a></li>
                        </ul>
                    </div>
                    <br><br><br>
                    <div style="width:800px" id="movieinfo">${chartList3.movieinfo}</div><br><br>
                    <div><div class="text-size">리뷰</div>
                        <span>
                            <div>
                                <p>
                                    <span>
                                        <em>"${countreview} 명의 실관람객이 리뷰를 남겨주셨습니다."</em>
                                    </span>
                                </p>
                                <div>
                                     <c:if test="${movieReview == null}">
                                        <!--   <button id="review">리뷰작성</button> -->
                                        <ul id="addtextarea" data-id="${chartList3.id}">
                                            <li>
                                                <input type="hidden" id="moviechart" value="'+chartId+'">
                                                <input type="hidden" id="idcheck"><input type="hidden" id="recommendid">
                                                <input type="hidden" id="idname">
												 <div class="comment-input-container">
												    <textarea id="reviewcomment" style="width: 630px; height: 100px;"></textarea>
												    <div class="rate-button-container">
												        <select id="rate" name="rate">
												            <option value="1">평점: 1</option>
												            <option value="2">평점: 2</option>
												            <option value="3">평점: 3</option>
												            <option value="4">평점: 4</option>
												            <option value="5">평점: 5</option>
												            <option value="6">평점: 6</option>
												            <option value="7">평점: 7</option>
												            <option value="8">평점: 8</option>
												            <option value="9">평점: 9</option>
												            <option value="10">평점: 10</option>
												        </select>
												        <button id="putcomment">리뷰등록</button>
												    </div>
												</div>
                                            </li>
                                        </ul>
                                    </c:if>
                                    <c:if test="${movieReview != null}">
                                    	<ul class="reviewStatus">
                                    		<li> ${sessionScope.Nick}님은 작성해 주신 리뷰가 있습니다.</li>
                                    	</ul>	
                                    </c:if> 
                                </div>
                            </div>
                            <br><br>
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

    </div>
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->


</body>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script>
    let getmname = $("#getmname").data("mname");
    

    $.ajax({
    	url:'/updatereservation',
    	type:'post',
    	data:{getmname:getmname},
    	success: function(data){
    		console.log("update",data)
    	}
    })
        $(document)
             .on('click', '#putcomment', function() { //리뷰 인서트
                let chartId = $('#addtextarea').data('id');
                console.log("chartList3Id", chartId);
                $('#moviechart').val(chartId);
                let moviechart = $('#moviechart').val();
                let content = $('#reviewcomment').val();
                let uid = '${sessionScope.uid}';
                let id = '${sessionScope.id}';
                let nick = '${sessionScope.Nick}';
                let rate = $("[name='rate']").val();
                console.log("uid",uid);
               $('#idname').val(uid);
               
               
         		 if (uid==null||uid==='') {
                     alert('로그인이 필요합니다');
                     $('#reviewcomment').val('');
                     return false;
                 } else{
                	  $.ajax({
                   	   url:'/reviewCheck',
                   	   type:'post',
                   	   data:{id:id,uid:uid,moviename:$('#mnameSave').val()},
                      	   success: function(data){
                      		   console.log(data)
                      		   if(data==0){
                      			   alert('영화를 보신 후 리뷰등록이 가능합니다');
                      			   return false;
                      		   }else{
                      			   
                      			   if($('#reviewcomment').val()===""){
                      				   alert('내용을 입력해주세요')
                      			   }else{
                             	  $.ajax({
                                      url: '/putcomment',
                                      type: 'post',
                                      data: {moviechart: moviechart, content: content, writer: nick ,uid:uid, rate:rate,customer_id: $('#hid').val() },
                                      success: function(data) {
                                          console.log(data);
                                          $('#moviechart').val('');
                                          $('#reviewcomment').val('');
                                          $('#idname').val('');
                                          location.reload();
                                          loadreview();
                                          AverageRate();
                                          
                                          
                                      }
                                  });
                      			   }
                       
                           } 
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
            
            if($('#updetext').val()===""){
            	alert('내용을 입력해주세요')
            }else{
                $.ajax({
                    url: '/updatereview',
                    type: 'post',
                    data: {id:updeId, content: $('#updetext').val(), rate: $("[name='rate']").val()},
                    dataType: 'text',
                    success: function(data) {
                        console.log(data);
                        loadreview();
                        AverageRate();
                    }
                });
            }
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
                        location.reload();
                        loadreview();
                        AverageRate();
                    }
                });
            });
        $(document).on('click', '.reviewupdete', function() {
            let reviewId = $(this).siblings('div').find('#reviewWriter').attr('value');

            
            // 기존에 추가된 요소 제거
            $(this).parent().find('#updetext, #editcomment, #deletecomment,#rateSelectBox').remove();
            let rate = $(this).data("rate");
            let textarea = '<textarea id="updetext">' + $(this).data("content") + '</textarea>';
            let editButton = '<button data-review-id="' + reviewId + '" id="editcomment">수정</button>';
            let deleteButton = '<button data-review-id="' + reviewId + '" id="deletecomment">삭제</button>';


            let rateSelectBox = '<select id="rateSelectBox" name="rate"><option value="1">평점:1</option><option value="2">평점:2</option><option value="3">평점:3</option><option value="4">평점:4</option><option value="5">평점:5</option><option value="6">평점:6</option><option value="7">평점:7</option><option value="8">평점:8</option><option value="9">평점:9</option><option value="10">평점:10</option></select>';
            for(let i = 1; i <= 10; i++) {
                if(i == rate) {
                    rateSelectBox = rateSelectBox.replace('value="' + i + '"', 'value="' + i + '" selected');
                }
            }
            
            $(this).parent().append(textarea + rateSelectBox + editButton + deleteButton);
        });
        
        function AverageRate(){
            $.ajax({
            	url:'/AverageRate',
            	type:'get',
            	data:{id:'${chartList3.id}'},
            	success:function(data){
            		$('#movieAverageRate').empty();
            		let str = '평점:'+ parseFloat(data);
            		console.log("rate",str);
            		$('#movieAverageRate').append(str);
            	}
            });
        }
        function loadreview(page = 1) {
        	console.log($('#hmid').val());
        	console.log(${sessionScope.dataId});
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
    				let customer_id = '${sessionScope.id}'
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
                        console.log("pageData[i]['customer_id']"+pageData[i]['customer_id'])
                        if ((uid == pageData[i]['customer_uid'] && customer_id==pageData[i]['customer_id'])) {
                            str += '<li><div><ul><li id="reviewWriter" value="' + pageData[i]['id'] + '">' + pageData[i]['writer'] + '</li><li>평점:'+pageData[i]['rate']+'</li><li>' + pageData[i]['created_at'] + '</li></ul></div><div>' +
                                '<p>' + pageData[i]['content'] + '</p></div><button class="reviewupdete" data-content="' + pageData[i]['content'] + '" data-rate="' + pageData[i]['rate'] + '"><img src="/chartImage/더보기3.jpg"></button>';
                        } else {
                            str += '<li><div><ul><li id="reviewWriter" value="' + pageData[i]['id'] + '">' + pageData[i]['writer'] + '</li><li>평점:'+pageData[i]['rate']+'</li><li>' + pageData[i]['created_at'] + '</li></ul></div><div><p>' + pageData[i]['content'] + '</p></div>';
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
        	AverageRate();
        });
        
    </script>
</html>
