<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/CSS/cinema.css">
<head>
<meta charset="UTF-8">
<title>극장정보</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<!-- <h1 class="title">극장</h1> -->
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
        <div id="hiddenDivp">
			<div class="parktop">
				<div style="text-align:right"><img src="room_image/엑스s.png" onclick="closepark()" style="cursor: pointer"></div>
					주차 및 위치안내
			</div>
			<div id="parktext">
			■ 건물 주차장 이용 시 (발렛)<br>
			- 요금 : 3시간 12,000원 (발렛비 포함), 초과 시간 10분 당 1,000원<br>
			- 결제 방식 : HIII CINEMA 1층 무인 정산기 이용 (카드만 가능)<br>
			- 결제 시 자동 출차 요청 (사전 정산 불가)<br>
			- 주변 교통 상황에 따라 입/출차가 지연될 수 있습니다.<br>
			<br>
			■ 외부(우주정거장) 주차장 이용 시 (셀프)<br>
			- 요금 : 4시간 6,000원 (당일 티켓 지참 必), 초과 시간 10분 당 1,000원<br>
			- 결제 방식 : CGV 8층 매표소 사전 할인 정산 必 (무인 정산기 할인 적용 불가)<br>
			- 할인 적용 가능 시간 (입차 기준) : 주중 18 ~ 23시 / 주말(공휴일) 08 ~ 23시 (25시 30분 이후 출차 불가)<br>
			- 원활한 운영을 위해 지하 4층을 이용해 주세요.
			</div>
			■ 주소: 화성시 목성구 태양로 29, 지구빌딩 1F
			<div id="addresslink"><a id="adda" href="https://map.naver.com/p/directions/-/-/-/transit?c=15.00,0,0,0,dh" target="_black">실시간 빠른길 찾기</a></div>
		</div>      
	</div>
		<div class="info">
			<div class="infoleft">
				여러분의 상상력을 자극하는 다양한 테마관으로 가득 찬 특별한 영화관입니다.<br><br>
				주소: 화성시 목성구 태양로 29, 지구빌딩 1F<br>
				고객센터 1544-1234<br>
				총 15관 / 2726석 
			</div>
			<div class="inforight">
				<img src="room_image/플러스2.png"  onclick="showpark()" class="imgt" style="cursor: pointer">&nbsp;위치 / 주차안내<br>
				<a href="/news"><img src="room_image/플러스2.png" class="imgt" style="cursor: pointer"></a>&nbsp;공지사항
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
	                    	<td><button id="prev-month" style="color:white;">&lt;</button></td>
	                        <th></th>
	                       	<th></th>
	                        <th></th>
	                        <th></th>
	                       	<th></th>
	                       	<th></th>
	                       	<th></th>
	                        <td><button id="next-month" style="color:white;">&gt;</button></td>
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
													- 입장 시 신분증을 꼭 지참하시기 바랍니다.<br>
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
<%-- <%@ include file="/WEB-INF/views/footer/footer.jsp" %> --%> <!-- 푸터 포함 -->
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
	
	let daystr = month+'월'+day+'일'+'  '+dow;
	/* console.log(year+'-'+month+'-'+day); */
	movied.push(year+'-'+month+'-'+day)
	$('#calendar-table thead th:eq('+j+')').text(daystr)
	$('#calendar-table thead th:eq('+j+')').data('dbdate',movied[j])
	}
	$('#hiddendate').val(movied[0]);
		
	movielist();
})
.on('click','#calendar-table thead tr th',function(){
	$('#hiddendate').val($(this).data('dbdate'));
	clear();
	movielist();
	
})
.on('click','.container .item', function() {
        
        var img = $(this).data('image');
        
        $('#backgroundImage').attr('src', img);
    })
function showage(){
	$('#hiddenDiv').show();
}
function closeage(){
	$('#hiddenDiv').hide();
}
function showpark(){
	$('#hiddenDivp').show();
}
function closepark(){
	$('#hiddenDivp').hide();
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
	        /* console.log('Request 1 succeeded:', response1); */
	        processData1(response1);
	        
	        let response2 = await $.ajax({
	            url: '/getroom',
	            method: 'POST',
	            data: { mdate: mdate },
	            dataType: 'json'
	        });
	        /* console.log('Request 2 succeeded:', response2); */
	        processData2(response2);
	        
	        let response3 = await $.ajax({
	            url: '/gettime',
	            method: 'POST',
	            data: { mdate: mdate },
	            dataType: 'json'
	        });
	        /* console.log('Request 3 succeeded:', response3); */
	        processData3(response3);
	        
	    } catch (error) {
	        console.log('One or more requests failed:', error);
	    }
	

}
function processData1(data) {
	 let timelist = '';
		for(x of data){	
			/* console.log("영화이름",x['mname']); */
			timelist = '<div class=timelistdiv><table><tr><td><img src=room_image/'+x['age']+'.png>'+'</td><td><h1 class=mname>'+x['mname']+'</h1></td><td>'+x['runningtime']+' / </td><td>'+x['genre']+' / </td><td>'+x['releasedate']+' 개봉</td></tr></table></div>';
			$('#timelist').append(timelist);
	 		 /* console.log('Processing data 1:', data); */
		}
		let lastdiv = '<div class=ldiv>[공지] 입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</div>'
		$('#timelist').append(lastdiv);
}
function processData2(data) {
	for(let i=0 ; i<$('#timelist div').length; i++){
		let id = $('#timelist div').eq(i).find('tr td:eq(1)').text();
		/* console.log(data);  */
		for(let x of data){
			if(x['mname']==id){
			let room = '<div class=roomdiv><table><tr><td><h2 class=roomname><img src=room_image/관화살표.png>'+x['Sname']+'</h2></td><td style=width:65px>'+x['seatlevel']+'</td><td>총 '+x['allseat']+'석</td></tr></table></div>';
			$('#timelist div').eq(i).append(room);
			}
		}
	}
    /* console.log('Processing data 2:', data); */
}

function processData3(data) {
	$('.timelistdiv').each(function() {
		/* console.log('테스트',$(this).find('tr').find('td').eq(1).text()); */
		id = $(this).find('tr').find('td').eq(1).text();
			
	        $(this).find('table').each(function() {
	            let room = $(this).find('tr').find('td').eq(0).text();
	            /* console.log('관이름', room); */
	            	for(let x of data){
	            		if (x['mname'] == id && x['Sname'] == room) {
	            			let date = new Date();
	            			let year = date.getFullYear();
	            			let month = date.getMonth() + 1;
	            			let day = date.getDate(); 
	            			let hour = date.getHours();
	            	        let minute = date.getMinutes();
	            	        let dt = new Date(year, month, day, hour, minute);
	            	        let nowtime = dt.getTime(); 
	            	        /* console.log(nowtime); */
	                        
	                        let bdate = $('#hiddendate').val();
	                        let [byear, bmonth, bday] = bdate.split('-').map(Number);
	                        let btime = x['begintime'];
	                    	let [bhour, bminute] = btime.split(':').map(Number);
	                    	let bdt = new Date(byear, bmonth, bday, bhour, bminute);
	            	        let betime = bdt.getTime(); 
	            	        /* console.log(betime); */
	                    	
	                    	/* console.log('현재밀리초',nowtime,'선택밀리초',betime); */
	                    	
	                    	
	                    	if(betime<nowtime){
	                    		$(this).append('<td class=td-out>'+x['begintime']+'<br><span>마감</span></a></td>');	
	                    	}else{
			                        if (x['mname'].includes(' ')) {
			                        	mname = x['mname'].replace(/\s+/g,'%20');
			                        	/* console.log('last',mname); */
			                        	$(this).append('<td class=td-link><a href=/ticket/?mname='+mname+'&date='+$('#hiddendate').val()+'&room='+x['Sname']+'&time='+x['begintime']+'>'+x['begintime']+'<br><span>'+x['lestseat']+'석</i></span></td>');
			                        }else{
			                        	$(this).append('<td class=td-link><a href=/ticket/?mname='+x['mname']+'&date='+$('#hiddendate').val()+'&room='+x['Sname']+'&time='+x['begintime']+'>'+x['begintime']+'<br><span>'+x['lestseat']+'석</span></a></td>');
			                        }
	                    	}
	                    }
	            	}  	
	        })
	})
    /* console.log('Processing data 3:', data); */
}

</script>
</html>