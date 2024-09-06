<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
html, body, div, applet, object, iframe, h2, h3, h4, h5, h6, blockquote, pre, 
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
body{
	background-color:black;
	color:white;
}
a:visited {
            color: black;
}
a:link{
	  color: black;
	  text-decoration: none;
	
	 }
span{
	font-size:13px;
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
	background-color:black;
	border:none;
	width:1000px;
	padding-bottom:20px;
	padding-top:10px;
	margin-right:20px;
	text-align:right;
	font-size:15px
	
}
.container a{
	 text-decoration: none;
	 display: block;
	 width: 100%;
     height: 100%;
     text-align:left;
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
		 opacity: 0.9;
		padding-left:10px;
		border-left:7px solid #475f77;
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
    /* width: 1000px; */
    margin: auto;
    margin-top: 180px; 
	margin-bottom:150px;
    height:100%;
}
.info {
	margin:auto;
	background-color:black;
	width:1500px;
	height:150px;
	color:white;
	border-bottom:1px solid #808080;
	/* position: absolute; */
}
.infoleft {
	position: relative;
    float: left;
    font-size: 15px;
    padding: 30px 20px 0 200px;
    width: 600px;
    color: white;
    text-overflow: initial;
    white-space: initial;
    text-align:left;
}
.inforight {
    position: relative;
    float: right;
    font-size: 15px;
    width: 500px;
    height: 98px;
    padding: 30px 0 0 30px;
    border-left: 1px solid rgba(255, 255, 255, 0.2);
    overflow: hidden;
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
    background-color:black;
}

#calendar-table {
    width: 100%;
    border-collapse: collapse;
}

#calendar-table th, #calendar-table td {
	color:white;
    width: 14;
    text-align: center;
    padding: 10px;
    border: 1px solid #ddd;
}
.td-link{
 cursor: pointer;
 width:70px;
 border:1px solid white;
}
.td-out{
 width:70px;
 border: 1px solid #ddd;
 background-color: #525355;
}
.td-link a{
 color:white;
}
.td-link:hover a{
	background-color:#475f77;
}
.td-link:hover {
    background-color:#475f77;
 }
#calendar-table thead th:hover {
	cursor: pointer;
	background-color:#475f77;
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
	border-top:1px solid #808080;
	margin-bottom:20px;
	color:white;
	
}
.ldiv{
	border-top:2px solid #808080;
	text-align:left;
	padding-top:15px;
}
.roomdiv {
	height:60px;
	border:none;
	margin-left:20px;
	margin-bottom:35px;
}
.timelistdiv a:visited{
	 	color:white;
}
.roomname {
	font-size:15px;
}
#hiddenDiv {
   width:550px;
   height:550px;		
   display: none;
   position: absolute;
   background-color: black; 
   padding: 20px;
   border: 5px solid #384963;
   z-index: 900; 
   margin-left:330px;
   margin-top:15px;
   
}

#hiddenDiv span{
	font-size:30px;
	 font-weight: bold;
}
.agetop{
	border-bottom:1px solid #808080;
	margin-bottom:25px;
	padding-bottom:20px;
}
#hiddenDiv table {
        margin: auto;
        border-collapse: collapse; 
        vertical-align:middle;
}
#hiddenDiv table thead {
	background-color:#575656;
	height:30px;
}
 #hiddenDiv thead th:nth-child(1) {
            width: 150px;
            text-align: left;
            padding: 0 0 0 10px;
            vertical-align: middle;
        }
 #hiddenDiv thead th:nth-child(2) {
            width: 350px;
            text-align: left;
            border-left:1px solid #808080;
            padding: 0 0 0 10px;
            vertical-align: middle;
        }
#hiddenDiv tbody td:nth-child(1) {
            width: 150px;
            text-align: left;
        }
 #hiddenDiv tbody td:nth-child(2) {
            width: 350px;
            text-align: left;
            border-left:1px solid #808080;
        }
 #hiddenDiv tbody td{
 	border-top:1px solid #808080;
 	border-bottom:1px solid #808080;
 	padding: 10px 10px 10px 10px;
 }
.imgt{
	 vertical-align: middle; /* 이미지의 수직 정렬을 중앙으로 설정 */
     padding-right: 5px;
}

</style>
<head>
<meta charset="UTF-8">
<title>극장정보</title>
  
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div id="contents">
	<div class="container" style="border: none;position: relative; width:1500px; height:700px;margin:auto;">
		<img src="room_image/로비5.jpg" class="background-image" id="backgroundImage" alt="zzzz">
	 	<div class="item" data-image="room_image/로비5.jpg"><a href="#"><i>Lobby</i></a></div>
	 	<div class="item" data-image="room_image/휴게소5.jpg"><a href="#"><i>Rest area</i></a></div>
        <div class="item" data-image="room_image/프리미엄관5.jpg"><a href="#"><i>Premium</i></a></div>
        <div class="item" data-image="room_image/판타지5.jpg"><a href="#"><i>Fantasy </i></a></div>
        <div class="item" data-image="room_image/입체음향5.jpg"><a href="#"><i>Stereo</i></a></div>
        <div class="item" data-image="room_image/스페이스5.jpg"><a href="#"><i>Space</i></a></div>
        <div class="item" data-image="room_image/야외가족관5.jpg"><a href="#"><i>Outdoor</i></a></div>
        <div class="item" data-image="room_image/수족관5.jpg"><a href="#"><i>Aqua</i></a></div>
        <div class="item" data-image="room_image/어린이5.jpg"><a href="#"><i>Child</i></a></div>        
	</div>
		<div class="info">
			<div class="infoleft">
				여러분의 상상력을 자극하는 다양한 테마관으로 가득 찬 특별한 영화관입니다.<br><br>
				주소: 화성시 목성구 태양로 29, 지구빌딩 1F<br>
				고객센터 1544-1234<br>
				총 15관 / 2726석 
			</div>
			<div class="inforight">
				위치 / 주차안내&nbsp;&nbsp;<img src="room_image/플러스2.png"  onclick="" class="imgt" style="cursor: pointer"><br>
				공지사항&nbsp;&nbsp;<a href="/news"><img src="room_image/플러스2.png" class="imgt" style="cursor: pointer"></a>
			</div>
		</div>
<div style="margin:auto; width:1000px">
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
	        	<div class="notice">
					<img src="room_image/플러스2.png"  onclick="showage()" class="imgt" style="cursor: pointer">관람등급안내
					<div id="hiddenDiv">
						<div class="agetop">
							<div style="text-align:right"><img src="room_image/엑스1.png" onclick="closeage()" style="cursor: pointer"></div>
								<span>관람등급안내</span>
						</div>
							<table>
								<thead>
									<tr><th>구분</th><th>설명</th></tr>
								</thead>
								<tbody>
									<tr><td><img src="room_image/all.png" class="imgt">전체 관람가</td><td>모든 연령의 고객님께서 관람하실 수 있습니다.</td></tr>
									<tr><td><img src="room_image/12.png" class="imgt">12세 관람가</td><td>만 12세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td></tr>
									<tr><td><img src="room_image/15.png" class="imgt">15세 관람가</td><td>만 15세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td></tr>
									<tr><td><img src="room_image/19.png" class="imgt">청소년관람불가</td><td>만 19세 미만(영/유아 포함)은 보호자가 동반하여도 관람이 불가합니다.<br>
													(단, 만19세가 되는 해의 1월 1일을 맞이한 사람은 제외)<br>
													- 입장 시 신분증을 꼭 지참하시기 바랍니다<br>
													- 신분증(사진/캡쳐 불가)<br>
													  주민등록증, 운전면허증, 여권, 모바일신분증(PASS, 정부24등)</td></tr>
									<tr><td><img src="room_image/미정.png" class="imgt">미정</td><td>등급 미정 영화입니다.</td></tr>
								</tbody>
							</table>
					</div>
				</div>
	    </div>
	    <div id="timelist">
	    	
	    </div>
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
function showage(){
	$('#hiddenDiv').show();
}
function closeage(){
	$('#hiddenDiv').hide();
}
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
	            url: '/getroom',
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
			timelist = '<div class=timelistdiv><table><tr><td><img src=room_image/'+x['age']+'.png>'+'</td><td><h1 class=mname>'+x['mname']+'</h1></td><td>'+x['runningtime']+' / </td><td>'+x['genre']+' / </td><td>'+x['releasedate']+' 개봉</td></tr></table></div>';
			$('#timelist').append(timelist);
	 		 console.log('Processing data 1:', data);
		}
		let lastdiv = '<div class=ldiv>[공지] 입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</div>'
		$('#timelist').append(lastdiv);
}
function processData2(data) {
	for(let i=0 ; i<$('#timelist div').length; i++){
		let id = $('#timelist div').eq(i).find('tr td:eq(1)').text();
		console.log(data); 
		for(let x of data){
			if(x['mname']==id){
			let room = '<div class=roomdiv><table><tr><td><h2 class=roomname><img src=room_image/관화살표.png>'+x['Sname']+'</h2></td><td style=width:65px>'+x['seatlevel']+'</td><td>총 '+x['allseat']+'석</td></tr></table></div>';
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
	            		if (x['mname'] == id && x['Sname'] == room) {
	            			let date = new Date();
	            			let hours = date.getHours();
	            	        let minutes = date.getMinutes();
	            	        
	            	        hours = hours.toString().padStart(2, '0');
	                        minutes = minutes.toString().padStart(2, '0');
	                        
	                        totalSeconds = (hours * 3600) + (minutes * 60);
	                        nowtime = totalSeconds * 1000;
	                        
	                        let btime = x['begintime'];
	                    	let [bhours, bminutes] = btime.split(':').map(Number);
	                    	let totalbSeconds = (bhours * 3600) + (bminutes * 60);
	                    	btime = totalbSeconds * 1000;
	                    	
	                    	console.log(nowtime,btime);
	                    	
	                    	if(btime<nowtime){
	                    		$(this).append('<td class=td-out>'+x['begintime']+'<br><span>마감</span></a></td>');	
	                    	}else{
			                        if (x['mname'].includes(' ')) {
			                        	mname = x['mname'].replace(/\s+/g,'%20');
			                        	console.log('last',mname);
			                        	$(this).append('<td class=td-link><a href=/ticket/?mname='+mname+'&date='+$('#hiddendate').val()+'&room='+x['Sname']+'&time='+x['begintime']+'>'+x['begintime']+'<br><span>'+x['lestseat']+'석</i></span></td>');
			                        }else{
			                        	$(this).append('<td class=td-link><a href=/ticket/?mname='+x['mname']+'&date='+$('#hiddendate').val()+'&room='+x['Sname']+'&time='+x['begintime']+'>'+x['begintime']+'<br><span>'+x['lestseat']+'석</span></a></td>');
			                        }
	                    	}
	                    }
	            	}  	
	        })
	})
    console.log('Processing data 3:', data);
}

</script>
</html>