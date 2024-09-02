<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>되나연</title>
</head>
<style>
.flex-container {
    display: flex;
    justify-content: space-around;
    list-style-type: none;
}

.vertical-container {
    display: flex;
    flex-direction: column; /* 세로 정렬 */
    align-items: center; /* 가운데 정렬 */
}
.vertical-container1 {
    display: flex;
    flex-direction: column; /* 세로 정렬 */
    align-items: center; /* 가운데 정렬 */
    width:1000px;
}

ol {
    display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    list-style-type: none; /* 숫자 지우는 것 */
}
.comment-list-container {
    display: flex; /* 플렉스 레이아웃 활성화 */
    flex-wrap: wrap; /* 아이템이 다음 줄로 넘어가도록 설정 */
    gap: 16px; /* 각 아이템 사이의 간격 설정 */
}

.comment-list-container li {
    flex: 1 1 calc(50% - 16px); /* 각 아이템의 너비를 50%로 설정 */
    box-sizing: border-box; /* 패딩과 테두리를 포함하여 전체 너비를 계산 */
    background-color: #f9f9f9; /* 배경색 설정 */
    padding: 16px; /* 내부 여백 추가 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* 그림자 추가 */
}
</style>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<c:forEach items="${chartList3}" var="chartList3">
<div class="vertical-container1">
	
	<div class="vertical-container">
	
		<div class="flex-container"><img src="${chartList2}" height="400px"><div class="vertical-container"><div>${chartList3.mname}</div><div>예매율 ${chartList3.reservation} %</div><div><dl><dt>감독:&nbsp;${chartList3.director}</dt><dt>배우 :&nbsp;${chartList3.cast}</dt><dt>장르 : &nbsp;${chartList3.genre}/관람가:&nbsp;${chartList3.age}/상영시간:&nbsp;${chartList3.runningtime}</dt><dt>개봉일:&nbsp;${chartList3.releasedate}</dt></dl></div></div>
				
		</div>
		<div>
			<div>
				<ul class="flex-container">
					<li>상세정보|</li><li>감독/출연|</li><li>스틸컷|</li><li>평점/리뷰|</li><li>상영시간</li>
				</ul>
			</div>
			<div style="width:670px">${chartList3.movieinfo}</div>
			<div>평점/리뷰
				<span>
					<div>
						<p>
							<span>
								<em>평가자수"명의 실관람객이 평가해주셨습니다."</em>
							</span>
						</p>
						<div><button id="review">리뷰작성</button>
							 <ul id="addtextarea" data-id="${chartList3.id}"></ul>
						</div>
					</div>
						<select size="1" style="width:100px;height:30px;" id="commentArray"></select>
						<button  id="comment">Go</button>
					<div>
						<ul id="commentList" class="comment-list-container"></ul>
					</div>
				</span>
			</div>
		</div>
	</div>
	
</div>
</c:forEach>
 <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
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
	    let str=''
	    for(let i = 0;i<data.length;i++){
	    str += '<option value="'+data[i]['id']+'">'+data[i]['text']+'</option>'	
	    }
	    $('#commentArray').append(str);
	    }
	        
	    })

$(document)
.on('click','#review',function(){
	
	let chartId = $('#addtextarea').data('id');
	console.log("chartList3Id",chartId)
	let str ='';
	$('#addtextarea').empty();
	str ='<input type=hidden id="moviechart" value='+chartId+'><input type=text id="idcheck"><input type=hidden id="nickname"><textarea id="reviewcomment" style=width:350px;height:100px;></textarea><button id="putcomment">리뷰등록</button>'
	$('#addtextarea').append(str);
	let nick = '${sessionScope.Nick}'
	$('#nickname').val(nick);
})
.on('click','#putcomment',function(){
	let moviechart=$('#moviechart').val();
	let content=$('#reviewcomment').val();
	let writer=$('#nickname').val();
	$.ajax({
		url:'/putcomment',
		type:'post',
		data:{moviechart:moviechart,content:content,writer:writer},
		success:function(data){
			console.log(data);
			$('#moviechart').val('');
			$('#reviewcomment').val('');
			$('#nickname').val('');
		}
	})
})
</script>
</html>