<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/CSS/manager.css">
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<div class="manager-page">
<button id="schebtn" class="mainbutton">상영정보</button>
<button id="moviebtn" class="mainbutton">영화</button>
<button id="itembtn" class="mainbutton">스토어</button>
<button id="answerbtn" class="mainbutton">1:1문의</button>
<button id="newsbtn" class="mainbutton">공지</button>
<button id="roombtn" class="mainbutton">상영관</button>
<button id="salesbtn" class="mainbutton">매출현황</button>

<div class="container" id="s">
	<div class="movieinsert1">
		<h2>영화 상영정보 추가</h2>
			<table>
				<tr><td>영화선택</td><td><select class="mselect" id="movienum"></select></td></tr>
				<tr><td>관선택</td><td><select class="mselect" id="roomnum"></select></td></tr>
				<tr><td>상영일</td><td><input type="date" id="date"></td></tr>
				<tr><td>시작시간</td><td><input type="time" id="stime"></td></tr>
				<tr><td><input type="hidden" id="totalrun"></td><td id="runnigtime"></td></tr>
				<tr><td>종료시간</td><td><input type="time" id="etime"></td></tr>
				<tr><td>좌석</td><td><input type="number" id="seat" readonly></td></tr>
				<tr><td>성인요금</td><td><input type="number" id="aprice" readonly></td></tr>
				<tr><td>청소년요금</td><td><input type="number" id="yprice" readonly></td></tr>
				<tr><td>요금타입</td><td><input type="text" id="ptype" readonly></td></tr>
				<tr><td colspan="2"><input type="button" id="sbtn" value="상영정보추가"></td></tr>
			</table>
	</div>
	<div class="movieinsert2">
		<table id="schedules">
			<caption><h3>상영리스트</h3></caption>
			<thead>
				<tr><td>상영일</td><td>영화제목</td><td>러닝타임</td><td>상영시간</td><td>종료시간</td><td>관이름</td><td>관등급</td><td>잔여좌석</td><td>연령</td><td>일반요금</td><td>청소년요금</td><td>요금타입</td><td>삭제</td></tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
<div class="container" id="m">
	<div class="movieinsert3">
		<h2>영화추가</h2>
			<table>
				<tr><td>영화제목</td><td><input type="text" id="mname"></td></tr>
				<tr><td>연령</td><td><select class="mselect" id="age">
										<option value="all">all</option>
										<option value="12">12</option>
										<option value="15">15</option>
										<option value="19">19</option>
										<option value="미정">미정</option>
									</select></td></tr>
				<tr><td>러닝타임</td><td><input type="text" id="runningtime"></td></tr>
				<tr><td>이미지경로</td><td><input type="text" id="image" value="/chartImage/.jpg"></td></tr>
				<tr><td>감독</td><td><input type="text" id="director"></td></tr>
				<tr><td>출연배우</td><td><input type="text" id="cast"></td></tr>
				<tr><td>장르</td><td><input type="text" id="genre"></td></tr>
				<tr><td>개봉일</td><td><input type="date" id="rdate"></td></tr>
				<tr><td>영화소개</td><td><textarea rows="4" cols="28" id="minfo"></textarea></td></tr>
				<tr><td colspan="2"><input type="button" id="mbtn" value="영화추가"></td></tr>
				<tr><td colspan="2"><h3>영화이미지추가</h3></td></tr>
				    <tr><td>이미지</td><td><input type="file" id="moviefile" style="width:200px"></td></tr>
				    <tr><td colspan="2"><input type="button" id="mimgbtn" value="이미지추가">
			</table>
	</div>
	<div class="movieinsert4">
		<table id="movieinfo">
			<caption><h3>영화리스트</h3></caption>
				<thead>
					<tr><td>영화제목</td><td>연령</td><td>예매율</td><td>러닝타임</td><td>이미지경로</td><td>감독</td><td>출연배우</td><td>장르</td><td>개봉일</td><td>영화소개</td><td>삭제</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
</div>
<div class="container" id="i">
	<input type="hidden" id="itemid" readonly>
		<div class="iteminfo">
			<h2>상품추가/수정</h2>
				<table>
					<tr><td>상품명</td><td><input type="text" id="itemname"></td></tr>
					<tr><td>타입</td><td><input type="text" id="itemtype"></td></tr>
					<tr><td>가격</td><td><input type="text" id="itemprice"></td></tr>
					<tr><td>할인가격</td><td><input type="text" id="disprice"></td></tr>
					<tr><td>구성</td><td><input type="text" id="conposition"></td></tr>
					<tr><td>원산지</td><td><input type="text" id="origin"></td></tr>
					<tr><td>유효기간</td><td><textarea rows="5" cols="25" id="period"></textarea></td></tr>
					<tr><td>이미지경로</td><td><input type="text" id="itemimage" value="/store_Images/.jpg"></td></tr>
					<tr><td colspan="2"><input type="button" id="ibtn" value="상품추가">
										<input type="button" id="iubtn" value="상품수정" disabled></td></tr>
					<tr><td colspan="2"><h3>상품이미지추가</h3></td></tr>
				    <tr><td>이미지</td><td><input type="file" id="itemfile" style="width:200px"></td></tr>
				    <tr><td colspan="2"><input type="button" id="iimgbtn" value="이미지추가">
				</table>
		</div>
	<div class="itembox">
		<table id="itemlist">
			<caption><h3>상품리스트</h3></caption>
				<thead>
					<tr><td>상품명</td><td>타입</td><td>가격</td><td>할인가격</td><td>구성</td><td>원산지</td><td>이미지경로</td><td>유효기간</td><td>삭제</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
	<div class="bestbox">
		<table id="bestlist">
				<thead>
					<tr><td colspan="3"><h3>베스트상품변경</h3></td></tr>
				</thead>
				<tbody><tr><td><select id="best1"></select></td><td><select id="best2"></select></td><td><select id="best3"></select></td></tr>
					   <tr><td><select id="best4"></select></td><td><select id="best5"></select></td><td><select id="best6"></select></td></tr>
					   <tr><td><select id="best7"></select></td><td><select id="best8"></select></td><td><select id="best9"></select></td></tr>
					   <tr><td colspan="3"><input type="button" id="bestbtn" value="적용"></td></tr></tbody>
		</table>
	</div>

</div>

<div class="container" id="a">
	<input type="hidden" id="anid" readonly>
		<div class="answerbox">
			<h2>1:1문의답변</h2>
				<table>
					<tr><td>작성자</td><td class="tdleft"><input type="text" id="writer" readonly></td></tr>
					<tr><td>제목</td><td class="tdleft"><input type="text" id="title" size="50" readonly></td></tr>
					<tr><td>문의내용</td><td><textarea rows="8" cols="80" id="content" readonly></textarea></td></tr>
					<tr><td>답변</td><td><textarea rows="8" cols="80" id="answer"></textarea></tr>
					<tr><td>문의일시</td><td class="tdleft"><input type="text" id="createt" readonly></td></tr>
					<tr><td>답변일시</td><td class="tdleft"><input type="text" id="answert" readonly></td></tr>
					<tr><td colspan="2"><input type="button" id="abtn" value="답변등록"></td></tr>
				</table>
</div>
	<div class="inquirybox">
		<table id="inquirylist">
			<caption><h3>1:1문의목록</h3></caption>
				<thead>
					<tr><td>작성자</td><td>제목</td><td>답변여부</td><td>등록일시</td><td>답변일시</td><td>삭제</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
</div>
<div class="container" id="n">
	<input type="hidden" id="newsid" readonly>
		<div class="newsupbox">
			<h2>공지등록/수정</h2>
				<table>
					<tr><td>구분</td><td class="tdleft"><select id="newskat" style="width:150px">
										<option value="시스템점검">시스템점검</option>
										<option value="극장">극장</option>
										<option value="기타">기타</option>
										</select></tr>
					<tr><td>제목</td><td class="tdleft"><input type="text" id="newstitle" size="60"></td></tr>
					<tr><td>공지내용</td><td><textarea rows="27" cols="80" id="newscontent"></textarea></td></tr>
					<tr><td colspan="2"><input type="button" id="nbtn" value="공지등록">
										<input type="button" id="nubtn" value="공지수정" disabled></td></tr>
				</table>
	</div>
	<div class="newsbox">
		<table id="newslist">
			<caption><h3>공지목록</h3></caption>
				<thead>
					<tr><td>구분</td><td>제목</td><td>등록일시</td><td>조회수</td><td>삭제</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
</div>
<div class="container" id="r">
	<input type="hidden" id="roomid" readonly>
		<div class="roomupbox">
			<h2>상영관정보수정</h2>
				<table>
					<tr><td>관이름</td><td><input type="text" id="rname" readonly></td></tr>
					<tr><td>구분</td><td><input type="text" id="rlevel"></td></tr>
					<tr><td>일반요금</td><td><input type="number" id="adprice"></td></tr>
					<tr><td>청소년요금</td><td><input type="number" id="yoprice"></td></tr>
					<tr><td colspan="2" class="tdcenter"><input type="button" id="roomupbtn" value="정보수정"></td></tr>
										
				</table>
	</div>
	<div class="roombox">
		<table id="roomlist">
			<caption><h3>상영관</h3></caption>
				<thead>
					<tr><td>관이름</td><td>구분</td><td>일반요금</td><td>청소년요금</td><td>총좌석</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
</div>
</div>
<div class="container" id="l">
	<div class="sales">
		<table id="mpaylist" style="margin:auto;">
			<caption><h3>영화매출</h3></caption>
				<thead>
					<tr><td>결제번호</td><td>사용자아이디</td><td>금액</td><td>일시</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
	<div class="sales">
		<table id="spaylist" style="margin:auto;">
			<caption><h3>스토어매출</h3></caption>
				<thead>
					<tr><td>결제번호</td><td>사용자아이디</td><td>금액</td><td>일시</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
	<div class="salesbox">
		<table id="totallist">
				<tbody>
				   <tr><td style="white-space: nowrap;"><input type="month" id="smonth">&nbsp;<input type="button" value="조회" id="ssalesbtn"></td><td>영화매출</td><td id="mpay"></td><td></td></tr>
				   <tr><td><input type="button" value="전체기간조회" id="tsalesbtn"></td><td>스토어매출</td><td id="spay"></td></tr>
				   <tr><td></td><td>합계</td><td id="tpay"></td></tr>
			    </tbody>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	mlist();
	rlist();
	schedules();
	showmovie();
	showitem();
	showinquiry();
	shownews();
})
.on('click','#sbtn',function(){
	let rid = $('#roomnum').val().split(',');
	let mid = $('#movienum').val().split(',');
	
	let movienum = mid[0];
	let roomnum = rid[0];
	let date = $('#date').val();
	let stime = $('#stime').val();
	let etime = $('#etime').val();
	let seat = $('#seat').val();
	let aprice = $('#aprice').val();
	let yprice = $('#yprice').val();
	let ptype = $('#ptype').val();
	
	clear();
	
	$.post('/playlistin',{movienum:movienum,roomnum:roomnum,date:date,stime:stime,etime:etime,seat:seat,
							aprice:aprice,yprice:yprice,ptype:ptype},
							function(data){
								schedules();
								alert('상영일정이 추가되었습니다')
	})
	
})
.on('click','#mbtn',function(){
	if($('#mname').val()=='' || $('#age').val()=='' || $('#runningtime').val()=='' || $('#minfo').val()=='' || $('#director').val()==''||$('#cast').val()==''|| $('#genre').val()==''|| $('#rdate').val()==''){
		alert("제대로")
	}else{
		let mname = $('#mname').val();
		let age = $('#age').val();
		let runningtime = $('#runningtime').val();
		let image = $('#image').val();
		let director = $('#director').val();
		let cast = $('#cast').val();
		let genre = $('#genre').val();
		let rdate = $('#rdate').val();
		let minfo = $('#minfo').val();
		
        clear();
        $.post('/moviein',{mname:mname,age:age,runningtime:runningtime,image:image,director:director,cast:cast,genre:genre,rdate:rdate,minfo:minfo},
    			function(data){
    				showmovie();
    				alert("영화가 추가되었습니다")
    		})
	}
})
.on('click','#mimgbtn',function(){
	if($('#moviefile').val()==''){
		alert("업로드할 이미지를 선택해주세요")
	}else{
		let formData = new FormData();
	    formData.append('moviefile', $('#moviefile')[0].files[0]); // Add the file
	    clear();
	    $.ajax({
	        url: '/movieimage',
	        type: 'POST',
	        data: formData,
	        contentType: false,
	        processData: false,
	        success: function(data) {
	        	 alert("이미지 업로드가 완료되었습니다")
	        }
	    });
	}
})
.on('click','#ibtn',function(){
	if($('#itemname').val()=='' || $('#itemprice').val()=='' || $('#disprice').val()=='' || $('#conposition').val()==''
		|| $('#origin').val()==''|| $('#itemtype').val()==''){
		alert("빈 칸이 없는지 확인 좀 해주세요")
	}else{
	
        let itemname = $('#itemname').val();
		let itemtype = $('#itemtype').val();
		let itemprice = $('#itemprice').val();
		let disprice = $('#disprice').val();
		let conposition = $('#conposition').val();
		let origin = $('#origin').val();
		let period = $('#period').val();
		let itemimage = $('#itemimage').val();
		clear();

		$.post('/itemin',{itemname:itemname,itemtype:itemtype,itemprice:itemprice,disprice:disprice,conposition:conposition,origin:origin,period:period,itemimage:itemimage},
			function(data){
				showitem();
				alert("상품이 추가되었습니다")
		})
		
	}
})
.on('click','#iimgbtn',function(){
	if($('#itemfile').val()==''){
		alert("업로드할 이미지를 선택해주세요")
	}else{
		let formData = new FormData();
		formData.append('itemfile', $('#itemfile')[0].files[0]);
		clear();
		  $.ajax({
	          url: '/itemimage',
	          type: 'POST',
	          data: formData,
	          contentType: false,
	          processData: false,
	          success: function(data) {
	            alert("이미지 업로드가 완료되었습니다")
	          }
	      });
	}
})
      
.on('click','#nbtn',function(){
	if($('#newstitle').val()=='' || $('#newscontent').val()==''){
		alert("제대로")
	}else{
		let newstitle = $('#newstitle').val();
		let newscontent = $('#newscontent').val();
		let newskat = $('#newskat').val();
	
		clear();
		
			$.post('/newsin',{newstitle:newstitle,newscontent:newscontent,newskat:newskat},
				function(data){
					shownews();
			})
	}
 
}) 
.on('change','#roomnum',function(){
	let aseat = $(this).val().split(',');
	$('#seat').val(aseat[1]);
	$('#aprice').val(aseat[2]);
	$('#yprice').val(aseat[3]);
})
.on('change','#movienum',function(){
	let runtime = $(this).val().split(',');
	let runminutes = parseInt(runtime[1].replace('분', ''));
	$('#runnigtime').text('러닝타임: '+runtime[1]+' + 광고 10분');
	$('#totalrun').val(runminutes+10);
})
.on('change','#stime',function(){
	let stime = $('#stime').val();
	let [hours, minutes] = stime.split(':').map(Number);
	let totalSeconds = (hours * 3600) + (minutes * 60);
	stime = totalSeconds * 1000;
	
	let jtime = "10:00";	
	[hours, minutes] = jtime.split(':').map(Number);
	totalSeconds = (hours * 3600) + (minutes * 60);
	jtime = totalSeconds * 1000;
	
	let ntime = "22:00";
	[hours, minutes] = ntime.split(':').map(Number);
	totalSeconds = (hours * 3600) + (minutes * 60);
	ntime = totalSeconds * 1000;
	
	roomprice = $('#roomnum').val().split(',');
	
	if(stime<jtime){
		$('#aprice').val(roomprice[2]-3000);
		$('#yprice').val(roomprice[3]-3000);
		$('#ptype').val("조조");
	}else if(ntime<stime){
		$('#aprice').val(roomprice[2]-3000);
		$('#yprice').val(roomprice[3]-3000);
		$('#ptype').val("심야");
	}else{
		$('#aprice').val(roomprice[2]);
		$('#yprice').val(roomprice[3]);
		$('#ptype').val("일반");
	}
	
	
	let srtime = $('#stime').val();
	let [endhour, endminute] = srtime.split(':').map(Number);
	endminute += parseInt($('#totalrun').val());
	
	if (endminute >= 60) {
		endhour += Math.floor(endminute / 60);
		endminute %= 60; 
	}
	if (endhour >= 24) {
		endhour %= 24; 
	}
	
	let formattedHour = endhour.toString().padStart(2, '0');
	let formattedMinute = endminute.toString().padStart(2, '0');
	
	
	$('#etime').val(formattedHour+':'+formattedMinute); 
	
})
.on('click','#schedel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	
	if(window.confirm("정말 삭제하시겠습니까?")){
		$.post('/schedel',{delid:delid},function(data){
				schedules();
		})
	}
	
})
.on('click','#moviedel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	
	if(window.confirm("정말 삭제하시겠습니까?")){
		$.post('/moviedel',{delid:delid},function(data){
			showmovie();
		})
	}
})
.on('click','#itemdel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();

	if(window.confirm("정말 삭제하시겠습니까?")){
		$.post('/itemdel',{delid:delid},function(data){
			showitem();
			clear();
		})
	}
})
.on('click','#inquirydel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	
	if(window.confirm("정말 삭제하시겠습니까?")){	
		$.post('/inquirydel',{delid:delid},function(data){
			showinquiry();
			clear();
		})	
	}
})
.on('click','#newsdel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
		
	if(window.confirm("정말 삭제하시겠습니까?")){
		$.post('/newsdel',{delid:delid},function(data){
			shownews();
			clear();
		})	
	}
})
.on('click','#roomlist tbody tr',function(){
	let roomid = $(this).find('td:eq(0)').text();
	let rname = $(this).find('td:eq(1)').text();
	let rlevel = $(this).find('td:eq(2)').text();
	let adprice = $(this).find('td:eq(3)').text();
	let yoprice = $(this).find('td:eq(4)').text();
	
	$('#roomid').val(roomid);
	$('#rname').val(rname);
	$('#rlevel').val(rlevel);
	$('#adprice').val(adprice);
	$('#yoprice').val(yoprice);
	
})
.on('click','#inquirylist tbody tr',function(){
	let anid = $(this).find('td:eq(0)').text();
	let content = $(this).find('td:eq(1)').text();
	let answer = $(this).find('td:eq(2)').text();
	let nickname = $(this).find('td:eq(3)').text();
	let title = $(this).find('td:eq(4)').text();
	let current = $(this).find('td:eq(5)').text();
	let created = $(this).find('td:eq(6)').text();
	let ancreated = $(this).find('td:eq(7)').text();
	
	
	$('#anid').val(anid);
	$('#writer').val(nickname);
	$('#title').val(title);
	$('#content').val(content);
	$('#answer').val(answer);
	$('#createt').val(created);
	$('#answert').val(ancreated);
})
.on('click','#itemlist tbody tr',function(){
	let itemid = $(this).find('td:eq(0)').text();
	let itemname = $(this).find('td:eq(1)').text();
	let itemtype = $(this).find('td:eq(2)').text();
	let itemprice = $(this).find('td:eq(3)').text();
	let disprice = $(this).find('td:eq(4)').text();
	let conposition = $(this).find('td:eq(5)').text();
	let origin = $(this).find('td:eq(6)').text();
	let itemimage = $(this).find('td:eq(7)').text();
	let period = $(this).find('td:eq(8)').text();
	
	
	$('#ibtn').prop('disabled', true);
	$('#iubtn').prop('disabled', false);
	
	
	$('#itemid').val(itemid);
	$('#itemname').val(itemname);
	$('#itemprice').val(itemprice);
	$('#disprice').val(disprice);
	$('#conposition').val(conposition);
	$('#origin').val(origin);
	$('#itemimage').val(itemimage);
	$('#itemtype').val(itemtype);
	$('#period').val(period);
})
.on('click','#iubtn',function(){
	if($('#itemname').val()=='' || $('#itemtype').val()=='' || $('#itemprice').val()=='' || $('#disprice').val()=='' || $('#conposition').val()==''||$('#origin').val()==''|| $('#itemimage').val()==''|| $('#period').val()==''){
		alert("비어있는 항목이 있습니다")
	}else{
		let itemid = $('#itemid').val();
		let itemname = $('#itemname').val();
		let itemtype = $('#itemtype').val();
		let itemprice = $('#itemprice').val();
		let disprice = $('#disprice').val();
		let conposition = $('#conposition').val();
		let origin = $('#origin').val();
		let itemimage = $('#itemimage').val();
		let period = $('#period').val();
		
		
		clear();
		$.post('/itemup',{itemid:itemid,itemname:itemname,itemtype:itemtype,itemprice:itemprice,disprice:disprice,conposition:conposition,origin:origin,
							itemimage:itemimage,period:period},function(data){
			showitem();
			alert("상품수정이 완료되었습니다")
		})
	}
})
.on('click','#newslist tbody tr',function(){
	let newsid = $(this).find('td:eq(0)').text();
	let newscontent = $(this).find('td:eq(1)').text();
	let newstitle = $(this).find('td:eq(3)').text();
	$('#newskat').val($(this).find('td:eq(2)').text());
	
	$('#nbtn').prop('disabled', true);
	$('#nubtn').prop('disabled', false);
	
	
	$('#newsid').val(newsid);
	$('#newstitle').val(newstitle);
	$('#newscontent').val(newscontent);
})
.on('click','#nubtn',function(){
	let newsid = $('#newsid').val();
	let newstitle = $('#newstitle').val();
	let newscontent = $('#newscontent').val();
	let newskat = $('#newskat').val();
	
	clear();
	$.post('/newsup',{newsid:newsid,newstitle:newstitle,newscontent:newscontent,newskat:newskat},function(data){
		shownews();
	})
})
.on('click','#bestbtn',function(){
	let bestitems = [];
	
	for (let i = 1; i <= 9; i++) {	   
	    let value = $('#best'+i).val();
	    bestitems.push(value);
	}
	 let uniqueItems = new Set(bestitems);
	    if (uniqueItems.size !== bestitems.length) {
	        alert("중복된 상품이 있습니다.");
	    } else {
			$.ajax({
			    url: '/bestitem',type: 'POST',contentType: 'application/json; charset=utf-8',data: JSON.stringify(bestitems),
			    success: function(response) {
			        alert("베스트 아이템이 적용되었습니다");
			    }   
			});
	    }
	
})
.on('click','#roomupbtn',function(){
	let roomid = $('#roomid').val();
	let rlevel = $('#rlevel').val();
	let adprice = $('#adprice').val();
	let yoprice = $('#yoprice').val();
	
	clear();
	$.post('/roomup',{roomid:roomid,rlevel:rlevel,adprice:adprice,yoprice:yoprice},function(data){
		rlist();
	})
})
.on('click','#abtn',function(){
	if($('#content').val()==''){
		alert("문의를 선택해주세요")
	}else{
		let answer = $('#answer').val();
		let anid = $('#anid').val();
		clear();
		
		$.post('/inquiryup',{answer:answer,anid:anid},function(data){
			showinquiry();
		})
	}
})
.on('click','#schebtn',function(){
	$('#s').addClass('visible');
	$('#m,#i,#a,#n,#r,#l').removeClass('visible').addClass('container');
	clear();
})
.on('click','#moviebtn',function(){
	$('#m').addClass('visible');
	$('#s,#i,#a,#n,#r,#l').removeClass('visible').addClass('container');
	clear();
})
.on('click','#itembtn',function(){
	$('#i').addClass('visible');
	$('#m,#s,#a,#n,#r,#l').removeClass('visible').addClass('container');
	clear();
})
.on('click','#answerbtn',function(){
	$('#a').addClass('visible');
	$('#m,#i,#s,#n,#r,#l').removeClass('visible').addClass('container');
	clear();
})
.on('click','#newsbtn',function(){
	$('#n').addClass('visible');
	$('#m,#i,#a,#s,#r,#l').removeClass('visible').addClass('container');
	clear();
})
.on('click','#roombtn',function(){
	$('#r').addClass('visible');
	$('#m,#i,#a,#s,#n,#l').removeClass('visible').addClass('container');
	clear();
})
.on('click','#salesbtn',function(){
	$('#l').addClass('visible');
	$('#m,#i,#a,#s,#n,#r').removeClass('visible').addClass('container');
	clear();
	showmpay();
	showspay();
})
.on('click','#ssalesbtn',function(){
	if($('#smonth').val()==''){
		alert("조회기간을 선택해주세요")
	}else{
		showmpay();
		showspay();
		totalsales();
	}
	
})
.on('click','#tsalesbtn',function(){
	clear();
	showmpay();
	showspay();
})
function mlist(){
	$.post('/mlist',{},function(data){
		$('#movienum').empty();
		for( let x of data){
			let str ='<option value='+x['id']+','+x['runningtime']+'>'+x['id']+', '+x['mname']+', '+x['runningtime']+'</option>';
			$('#movienum').append(str);
		}
		let runt = $('#movienum').val().split(',');
		let runminutes = parseInt(runt[1].replace('분', ''));
		$('#runnigtime').text('러닝타임: '+runt[1]+' + 광고 10분');
		$('#totalrun').val(runminutes+10);
	},'json')
}
function rlist(){
	$.post('/rlist',{},function(data){
		$('#roomnum').empty();
		$('#roomlist tbody').empty();
		for(let x of data){
			let str ='<option value='+x['id']+','+x['allseat']+','+x['adult_price']+','+x['young_price']+'>'+x['id']+', '+x['Sname']+', '+x['seatlevel']+', '+x['allseat']+'석</option>';
			$('#roomnum').append(str);

			let rstr ='<tr><td style=display:none>'+x['id']+'</td><td>'+x['Sname']+'</td><td>'+x['seatlevel']+'</td><td>'+x['adult_price']+'</td><td>'+x['young_price']+'</td><td>'+x['allseat']+'</td></tr>'
			$('#roomlist tbody').append(rstr);
			}
		
		fseat = $('#roomnum').val().split(',');
		$('#seat').val(fseat[1]);
		$('#aprice').val(fseat[2]);
		$('#yprice').val(fseat[3]);
	},'json')
}

function schedules(){
	$.post('/schedules',{},function(data){
		$('#schedules tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td>'+x['moviedate']+'</td><td>'+x['mname']+'</td><td>'+x['runningtime']+'</td><td>'+x['begintime']+'</td><td>'+
						x['endtime']+'</td><td>'+x['Sname']+'</td><td>'+x['seatlevel']+'</td><td>'+x['lestseat']+'</td><td>'+x['age']+'</td><td>'+x['a_price']+'</td><td>'+
						x['y_price']+'</td><td>'+x['timetype']+'</td><td><input type=button id=schedel value=삭제></td></tr>'
			$('#schedules tbody').append(str);
		}
	
	},'json')
}
function clear(){
	$('#date,#stime,#etime,#mname,#runningtime,#director,#cast,#genre,#minfo,#rdate,#itemname,#itemprice,'
		+'#disprice,#conposition,#origin,#itemimage,#period,#anid,#writer,#title,#newsid,'
		+'#content,#answer,#createt,#answert,#newstitle,#newscontent,#itemfile,#moviefile,#roomid,'
		+'#rname,#rlevel,#adprice,#yoprice,#itemtype,#smonth').val('');
	$('#image').val('/chartImage/.jpg');
	$('#itemimage').val('/store_Images/.jpg');
	$('#nubtn,#iubtn').prop('disabled', true);
	$('#nbtn,#ibtn').prop('disabled', false);
}
function showmovie(){
	$.post('/showmovie',{},function(data){
		$('#movieinfo tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td>'+x['mname']+'</td><td>'+x['age']+'</td><td>'+x['reservation']+'</td><td>'+x['runningtime']+'</td><td>'+
						x['imagepath']+'</td><td>'+x['director']+'</td><td>'+x['cast']+'</td><td>'+x['genre']+'</td><td>'+x['releasedate']+'</td><td class=movietext>'+
						x['movieinfo']+'</td><td><input type=button id=moviedel value=삭제></td></tr>'
			$('#movieinfo tbody').append(str);
		}
		
	},'json')
}
function showitem(){
	$.post('/showitem',{},function(data){
		$('#itemlist tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td>'+x['item_name']+'</td><td>'+x['item_type']+'</td><td>'+x['price']+'</td><td>'+x['discount_price']+'</td><td>'+x['composition']+'</td><td>'+
						x['origin']+'</td><td>'+x['image_path']+'</td><td>'+x['period']+'</td><td><input type=button id=itemdel value=삭제></td></tr>'
			$('#itemlist tbody').append(str);
			
			let beststr = '<option value='+x['id']+'>'+x['item_name']+', '+x['price']+', '+x['item_type']+'</option>';
			$('#bestlist tbody select').append(beststr);
		}
		
	},'json')
}
function showinquiry(){
	$.post('/showinquiry',{},function(data){
		$('#inquirylist tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td style=display:none>'+x['content']+'</td><td style=display:none>'+x['answer']+'</td><td>'+x['nickname']+'</td><td>'+x['title']+'</td><td>'+
			x['current']+'</td><td>'+x['created']+'</td><td>'+x['ancreated']+'</td><td><input type=button id=inquirydel value=삭제></td></tr>'
			$('#inquirylist tbody').append(str);
		}
		
	},'json')
}
function shownews(){
	$.post('/shownews',{},function(data){
		$('#newslist tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td style=display:none>'+x['content']+'</td><td>'+x['selected']+'</td><td>'+x['title']+'</td><td>'+x['create']+'</td><td>'+x['hit']+'</td><td><input type=button id=newsdel value=삭제></td></tr>'
			$('#newslist tbody').append(str);
		}
		
	},'json')
}
function showmpay(){
	let smonth = $('#smonth').val();
	smonth += '%';
	
	
	$.post('/showmpay',{smonth:smonth},function(data){
		$('#mpaylist tbody').empty();
		for( let x of data){
			let str ='<tr><td>'+x['random_id']+'</td><td>'+x['customer_id']+'</td><td>'+x['totalprice']+'</td><td>'+x['created']+'</td></tr>'
			$('#mpaylist tbody').append(str);
		}
		totalsales();
	},'json')
}
function showspay(){
	let smonth = $('#smonth').val();
	smonth += '%';
	
	$.post('/showspay',{smonth:smonth},function(data){
		$('#spaylist tbody').empty();
		for( let x of data){
			let str ='<tr><td>'+x['random_id']+'</td><td>'+x['customer_id']+'</td><td>'+x['totalprice']+'</td><td>'+x['created']+'</td></tr>'
			$('#spaylist tbody').append(str);
		}
		totalsales();
	},'json')
}
function totalsales(){
	let mtotal = 0;
	let stotal = 0;

    $('#mpaylist tbody tr').each(function() {
        let mvalue = parseInt($(this).find('td:eq(2)').text());
        mtotal += mvalue;
    });
    let formTotal = mtotal.toLocaleString('en-US', { style: 'decimal', minimumFractionDigits: 0 });
    $('#mpay').text(formTotal+"  원  ");
    
    
    $('#spaylist tbody tr').each(function() {
        let svalue = parseInt($(this).find('td:eq(2)').text());
        stotal += svalue;
    });
    let forsTotal = stotal.toLocaleString('en-US', { style: 'decimal', minimumFractionDigits: 0 });
    $('#spay').text(forsTotal+"  원  ");
    
    let ftotal = mtotal+stotal;
    let fortTotal = ftotal.toLocaleString('en-US', { style: 'decimal', minimumFractionDigits: 0 });
    $('#tpay').text(fortTotal+"  원  ");
}


</script>
</html>