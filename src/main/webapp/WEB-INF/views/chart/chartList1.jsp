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
    margin-top:100px;
    margin-bottom:100px;
}

ol {
    display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    list-style-type: none; /* 숫자 지우는 것 */
}
ul {
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
//review 를 select시키는것	    
	$.ajax({
		url:'/insertselectcomment',
		type:'post',
		data:{},
		dataType:'JSON',
		success:function(data){
			let str='';
			$('#commentList').empty();
			for(let i =0;i<data.length;i++){
				str +='<li><div><ul><li id="reviewWriter" value="'+data[i]['id']+'">'+data[i]['writer']+'</li><li>'+data[i]['created_at']+'</li></ul></div><div><p>'+data[i]['content']+'</p></div></li>'
			}
			$('#commentList').append(str);
		}
	})

$(document)
.on('click','#review',function(){//리뷰란
	
	let chartId = $('#addtextarea').data('id');
	console.log("chartList3Id",chartId)
	let str ='';
	$('#addtextarea').empty();
	str ='<input type=hidden id="moviechart" value='+chartId+'><input type=text id="idcheck"><input type=text id="recommendid"><input type=hidden id="nickname"><textarea id="reviewcomment" style=width:350px;height:100px;></textarea><button id="putcomment">리뷰등록</button>'
	$('#addtextarea').append(str);
	let nick = '${sessionScope.Nick}'
	$('#nickname').val(nick);
})
.on('click','#putcomment',function(){//리뷰 인서트
	
	let moviechart=$('#moviechart').val();
	let content=$('#reviewcomment').val();
	let writer=$('#nickname').val();
	if(writer==null||writer==""){
		alert('로그인이 필요합니다');
		$('#reviewcomment').val('');
		return false;
	}else{
	
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
	}
})
.on('click','#comment',function(){//리뷰 li에 셀렉트
	$.ajax({
		url:'/insertselectcomment',
		type:'post',
		data:{},
		dataType:'JSON',
		success:function(data){
			let str='';
			$('#commentList').empty();
			for(let i =0;i<data.length;i++){
				str +='<li><div><ul><li id="reviewWriter" value="'+data[i]['id']+'">'+data[i]['writer']+'</li><li>'+data[i]['created_at']+'</li></ul></div><div><p>'+data[i]['content']+'</p></div></li>'
			}
			$('#commentList').append(str);
		}
	})
})

//닉네임과 세션스코프의 닉네임이 일치하는지 확인하고 수정,삭제버튼 추가하는것
.on('click','#reviewWriter',function(){
	 let writer = $(this).text();
	 let click = $(this);
	 let clickid = $(this).val(); // 여기서 value 속성을 가져옵니다.
	 
	 console.log("writer",writer);
	 let nick='${sessionScope.Nick}'
		 console.log(writer.length, nick.length);
     if (writer ==nick ) {
         // 여기서 버튼을 수정하거나 삭제하는 로직을 추가할 수 있습니다.
         // 기존 리뷰등록 버튼을 숨깁니다.
         
         // 수정 및 삭제 버튼을 동적으로 생성하여 추가합니다.
         let text =$('<input type=hidden id=reviewupdeid>');
         let textarea=$('<textarea id="updetext"></textarea>');
         let editButton = $('<button id="editcomment">수정</button>');
         let deleteButton = $('<button id="deletecomment">삭제</button>');
         
         // 버튼을 원하는 위치에 추가합니다.
         click.after(deleteButton).after(editButton).after(text).after(textarea);
         $('#reviewupdeid').val(clickid);
     } else {
         alert('작성자와  닉네임이 일치하지 않습니다.');
         return false;
     }
})
.on('click','#editcomment',function(){
	$.ajax({
		url:'/updatereview',
		type:'post',
		data:{id:$('#reviewupdeid').val(),content:$('#updetext').val()},
		dataType:'text',
		success:function(data){
			console.log(data);
			loadreview();
			
		}
	})
})
.on('click','#deletecomment',function(){
	$.ajax({
		url:'/deletereview',
		type:'post',
		data:{id:$('#reviewupdeid').val()},
		dataType:'text',
		success:function(data){
			console.log(data);
			loadreview();
		}
	})
})
function loadreview(){
	$.ajax({
		url:'/insertselectcomment',
		type:'post',
		data:{},
		dataType:'JSON',
		success:function(data){
			let str='';
			$('#commentList').empty();
			for(let i =0;i<data.length;i++){
				str +='<li><div><ul><li id="reviewWriter" value="'+data[i]['id']+'">'+data[i]['writer']+'</li><li>'+data[i]['created_at']+'</li></ul></div><div><p>'+data[i]['content']+'</p></div></li>'
			}
			$('#commentList').append(str);
		}
	})
}
</script>
</html>