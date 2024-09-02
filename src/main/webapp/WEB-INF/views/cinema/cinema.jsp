<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
html, body, div, span, applet, object, iframe, h2, h3, h4, h5, h6, blockquote, pre, 
a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, 
small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label,
 legend, table, caption, tbody, tfoot, thead, tr, th{
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
    text-align:center;
    
}
.mname{
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
    text-align:center;
    font-size:23px
}
.container {
            display: flex;
            flex-direction: column; /* 수직으로 쌓기 */
            align-items: flex-start; /* 왼쪽으로 붙이기 */
            gap: 0px; /* 요소 간 간격 */
            padding: 0px; /* 패딩 */
            border: 1px solid black; /* 테두리 */
            
           
}
.notice{
	background-color:white;
	border:none;
	width:1000px;
	padding-bottom:20px;
	
}
.container a{
	 text-decoration: none;
	 display: block;
	 width: 100%;
     height: 100%;
}
.container a:visited {
            color: white; /* 방문한 링크 색상 */
        }
.background-image {
            position: absolute; /* 절대 위치로 배치 */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1; /* 다른 요소들보다 뒤로 위치 */
            object-fit: cover; /* 이미지 비율 유지 및 컨테이너 크기에 맞게 조정 */
            
        }
.item {		
			line-height: 50px;
			color: white;
            width: 100px;
            height: 50px;
            background-color: black;
           
            transition: background-color 0.3s ease, transform 0.3s ease;
             position: relative; /* 기본 위치 설정 */
            z-index: 2; /* 배경 이미지보다 위로 위치 */
          
            
        }
 .item:hover {
            background-color: black; /* 호버 시 배경색 변경 */
            transform: scale(1.1); /* 호버 시 크기 확대 */
        }    
#contents {
	clear: both;
    padding-bottom: 50px;

    position: relative;
    width: 1000px;
    margin: 0 auto;
    border:1px solid black;
    height:100%;
}
.info {
	background-color:black;
	width:1000px;
	height:200px;
	color:white;
	/* position: absolute; */
}
.infoleft .title {
	position: relative;
    float: left;
    font-size: 15px;
    padding: 10px 0 0 20px;
    width: 400px;
    color: white;
    text-overflow: initial;
    white-space: initial;
    text-align:left;
}
.inforight {
    position: relative;
    float: right;
    width: 280px;
    height: 98px;
    padding: 10px 0 0 20px;
    border-left: 1px solid rgba(255, 255, 255, 0.2);
    overflow: hidden;
    }
.inforight h5 {
	text-align:left;
	}
.link-more {
    display: inline-block;
    width: 20px;
    height: 19px;
    background: url(https://img.cgv.co.kr/R2014/images/sprite/sprite_btn.png) -50px -62px no-repeat;
    vertical-align: middle;
    font: 0 / 0 a;
    zoom: 1;
}
.sect-schedule .slider {
    overflow: visible;
    position: relative;
    height: 48px;
    padding: 12px 0;
}
.slider {
    z-index: 1;
    width: 100%;
}
.showtimes-wrap .sect-schedule {
    width: 100%;
    height: 111px;
    border-top: 3px solid #241d1e;
}
.calendar-container {
    width:1000px;
    background-color: white;
    border: none;
    overflow: hidden;
    
}



.calendar-body {
    padding: 10px;
}

#calendar-table {
    width: 100%;
    border-collapse: collapse;
}

#calendar-table th, #calendar-table td {
    width: 14;
    text-align: center;
    padding: 10px;
    border: 1px solid #ddd;
}



button {
    background: none;
    border: none;
    color: black;
    font-size: 18px;
    cursor: pointer;
}

button:focus {
    outline: none;
}
.timelistdiv {

	border-bottom:1px solid black;
	border-top:1px solid black;
	margin-bottom:20px;
}
.roomdiv {
	height:60px;
	border:none;
	margin-left:20px;
}
.timelistdiv a:visited{
	 	color:black;
}
.roomname {
	font-size:15px;
}
</style>
<head>
<meta charset="UTF-8">
<title>극장정보</title>
  
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div id="contents">
	혹시나 다른거 들어갈 자리<input type="button" value="test" id="tsetbtn">
	<div><h3><img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif"></h3></div>
	<div class="container" style="border: none;position: relative; width:1000px; height:500px;margin:auto;">
		<img src="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/main_chungdam.jpg" class="background-image" id="backgroundImage" alt="zzzz">
	 	<div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/main_chungdam.jpg"><a href="#">8F 일반</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f10_02.jpg"><a href="#">7F 스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f12_01.jpg"><a href="#">스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f12_02.jpg"><a href="#">스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f12_03.jpg"><a href="#">스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f09_01.jpg"><a href="#">스위트</a></div>
        <div class="item" data-image="https://img.cgv.co.kr/R2014/images/sub/specialtheater/chungdam/f09_02.jpg"><a href="#">스위트</a></div>        
	</div>
	<div class="info">
		<div class="infoleft">
			<strong class="title">주소를 적어주세여</strong>
		</div>
		<div class="inforight">
			<h5>위치/주차안내</h5><a class="link-more" href="/park" target="_blank" title="새창 열림"></a>
		</div>
	</div>
	<div class="notice">
		<h4>공지사항</h4><a class="link-more" href="/park" target="_blank" title="새창 열림"></a>
		<h4><a href="#" onclick="openPopup(); return false;">관람등급안내</a></h4>
	</div>
<div class="sect-schedule">
	<div class="calendar-container">
        <div class="calendar-body">
            <table id="calendar-table">
            	<input type="hidden" id="hiddendate">
                <thead>
                    <tr>
                    	<td><button id="prev-month">&lt;</button></td>
                        <th></th>
                       	<th></th>
                        <th></th>
                        <th></th>
                       	<th></th>
                       	<th></th>
                       	<th></th>
                        <td><button id="next-month">&gt;</button></td>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <div id="timelist">
    	
    </div>
</div>

</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	let now = new Date();
	let movied = [];
	for(let j = 0;j < 7;j++){
	let date = new Date(now);
	date.setDate(now.getDate()+j);
	let year = date.getFullYear();
	let month = date.getMonth() + 1;
	let day = date.getDate();
	month = month <10 ? '0' + month : month;
	day = day < 10 ? '0' + day : day;
	let days = ['일','월','화','수','목','금','토'];
	let dow = days[date.getDay()];
	
	//console.log(now,year,month,dow,day);
	let daystr = month+'월'+day+'일'+'  '+dow;
	console.log(year+'-'+month+'-'+day);
	movied.push(year+'-'+month+'-'+day)
	$('#calendar-table thead th:eq('+j+')').text(daystr)
	$('#calendar-table thead th:eq('+j+')').data('dbdate',movied[j])
	}
	console.log(movied[0]);
	$('#hiddendate').val(movied[0]);
		
	movielist();
})
.on('click','#calendar-table thead tr th',function(){
	$('#hiddendate').val($(this).data('dbdate'));
	clear();
	movielist();
})
.on('click','.container .item', function() {
        // 클릭된 div의 data-image 속성에서 이미지 URL을 가져옴
        var img = $(this).data('image');
        console.log(img);
        // 이미지 요소의 src 속성을 새 URL로 업데이트
        $('#backgroundImage').attr('src', img);
    })
function clear(){
	$('#timelist').empty();
	$('#moviename').text('');
}

async function movielist(){
	let mdate= $('#hiddendate').val();
	    try {
	        let mdate = $('#hiddendate').val();
	        let response1 = await $.ajax({
	            url: '/getmoviename',
	            method: 'POST',
	            data: { mdate: mdate },
	            dataType: 'json'
	        });
	        console.log('Request 1 succeeded:', response1);
	        processData1(response1);
	        
	        let response2 = await $.ajax({
	            url: '/getroom2',
	            method: 'POST',
	            data: { mdate: mdate },
	            dataType: 'json'
	        });
	        console.log('Request 2 succeeded:', response2);
	        processData2(response2);
	        
	        let response3 = await $.ajax({
	            url: '/gettime',
	            method: 'POST',
	            data: { mdate: mdate },
	            dataType: 'json'
	        });
	        console.log('Request 3 succeeded:', response3);
	        processData3(response3);
	        
	    } catch (error) {
	        console.log('One or more requests failed:', error);
	    }
	

}
function processData1(data) {
	 let timelist = '';
		for(x of data){	
			console.log("영화이름",x['mname']);
			timelist = '<div class=timelistdiv><table><tr><td>'+x['age']+'</td><td><h1 class=mname>'+x['mname']+'</h1></td><td>'+x['runningtime']+'</td></tr></table></div>';
			$('#timelist').append(timelist);
	 		 console.log('Processing data 1:', data);
		}
}
function processData2(data) {
	for(let i=0 ; i<$('#timelist div').length; i++){
		let id = $('#timelist div').eq(i).find('tr td:eq(1)').text();
		console.log(data); 
		for(let x of data){
			if(x['mname']==id){
			let room = '<div class=roomdiv><table><tr><td><h2 class=roomname>'+x['Sname']+'</h2></td><td style=width:65px>'+x['seatlevel']+'</td></tr></table></div>';
			$('#timelist div').eq(i).append(room);
			}
		}
	}
    console.log('Processing data 2:', data);
}

function processData3(data) {
	$('.timelistdiv').each(function() {
		console.log('테스트',$(this).find('tr').find('td').eq(1).text());
		id = $(this).find('tr').find('td').eq(1).text();
			
	        $(this).find('table').each(function() {
	            let room = $(this).find('tr').find('td').eq(0).text();
	            console.log('관이름', room);
	            	for(let x of data){
	            		if (x['mname'] === id && x['Sname'] === room) {
	                        console.log('최종', x['begintime']);
	                        $(this).append('<td><a href=/ticket/?mname='+x['mname']+'&date='+$('#hiddendate').val()+'&room='+x['Sname']+'&time='+x['begintime']+'>'+x['begintime']+'</a></td>');
	                    }
	            	}  	
	        })
	})
    console.log('Processing data 3:', data);
}
function openPopup(){
	 window.open('/ageinfo', 'popupWindow', 'width=600,height=400');
}

</script>
</html>