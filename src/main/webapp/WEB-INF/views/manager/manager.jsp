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
<div class="container">
	<div class="movieinsert1">
		<h2>영화 상영정보 추가</h2>
			<table>
				<tr><td>영화선택</td><td><select class="mselect" id="movienum"></select></td></tr>
				<tr><td>관선택</td><td><select class="mselect" id="roomnum"></select></td></tr>
				<tr><td>상영일</td><td><input type="date" id="date"></td></tr>
				<tr><td>시작시간</td><td><input type="time" id="stime"></td></tr>
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
			<h3>상영리스트</h3>
				<thead>
					<tr><td>상영일</td><td>영화제목</td><td>러닝타임</td><td>상영시간</td><td>종료시간</td><td>관이름</td><td>관등급</td><td>잔여좌석</td><td>연령</td><td>일반요금</td><td>청소년요금</td><td>요금타입</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
</div>
<div class="container">
	<div class="movieinsert3">
		<h2>영화추가</h2>
			<table>
				<tr><td>영화제목</td><td><input type="text" id="mname"></td></tr>
				<tr><td>연령</td><td><select class="mselect" id="age">
										<option value="all">all</option>
										<option value="12">12</option>
										<option value="15">15</option>
										<option value="19">19</option>
									</select></td></tr>
				<tr><td>러닝타임</td><td><input type="text" id="runtime"></td></tr>
				<tr><td>이미지경로</td><td><input type="text" id="image" value="/chartImage/.jpg"></td></tr>
				<tr><td>감독</td><td><input type="text" id="director"></td></tr>
				<tr><td>출연배우</td><td><input type="text" id="cast"></td></tr>
				<tr><td>장르</td><td><input type="text" id="genre"></td></tr>
				<tr><td>개봉일</td><td><input type="date" id="rdate"></td></tr>
				<tr><td>영화소개</td><td><textarea rows="10" cols="25" id="minfo"></textarea></td></tr>
				<tr><td colspan="2"><input type="button" id="mbtn" value="영화추가"></td></tr>
			</table>
	</div>
	<div class="movieinsert4">
		<table id="movieinfo">
			<h3>영화리스트</h3>
				<thead>
					<tr><td>영화제목</td><td>연령</td><td>예매율</td><td>러닝타임</td><td>이미지경로</td><td>감독</td><td>출연배우</td><td>장르</td><td>개봉일</td><td>영화소개</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
</div>
<div class="container">
	<div class="iteminfo">
		<h2>상품추가</h2>
			<table>
				<tr><td>상품명</td><td><input type="text" id="itemname"></td></tr>
				<tr><td>가격</td><td><input type="text" id="itemprice"></td></tr>
				<tr><td>할인가격</td><td><input type="text" id="disprice"></td></tr>
				<tr><td>구성</td><td><input type="text" id="conposition"></td></tr>
				<tr><td>원산지</td><td><input type="text" id="origin"></td></tr>
				<tr><td>이미지경로</td><td><input type="text" id="itemimage" value="/store_Images/.jpg"></td></tr>
				<tr><td colspan="2"><input type="button" id="ibtn" value="상품추가"></td></tr>
			</table>
			<h2>상품상세</h2>
			<table>
				<tr><td>상품선택</td><td><select class="mselect" id="deitemid"></select></td></tr>
				<tr><td>이름</td><td><input type="text" id="detname"></td></tr>
				<tr><td>유효기간</td><td><input type="text" id="period"></td></tr>
				<tr><td colspan="2"><input type="button" id="dbtn" value="상세정보추가"></td></tr>
			</table>
	</div>
	<div class="itembox">
		<table id="itemlist">
			<h3>상품리스트</h3>
				<thead>
					<tr><td>상품명</td><td>가격</td><td>할인가격</td><td>구성</td><td>원산지</td><td>이미지경로</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
	<div class="detailbox">
		<table id="detaillist">
			<h3>상품상세리스트</h3>
				<thead>
					<tr><td>상품번호</td><td>이름</td><td>유효기간</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
</div>
<div class="container">
	<div class="answerbox">
		<h2>1:1문의답변</h2>
			<table>
				<tr><td><input type="hidden" id="anid" readonly></td></tr>
				<tr><td>작성자</td><td><input type="text" id="writer" readonly></td></tr>
				<tr><td>제목</td><td><input type="text" id="title" readonly></td></tr>
				<tr><td>문의내용</td><td><textarea rows="10" cols="80" id="content" readonly></textarea></td></tr>
				<tr><td>답변</td><td><textarea rows="10" cols="80" id="answer"></textarea></tr>
				<tr><td>문의일시</td><td><input type="text" id="createt" readonly></td></tr>
				<tr><td>답변일시</td><td><input type="text" id="answert" readonly></td></tr>
				<tr><td colspan="2"><input type="button" id="abtn" value="답변등록"></td></tr>
			</table>
</div>
	<div class="inquirybox">
		<table id="inquirylist">
			<h3>1:1문의목록</h3>
				<thead>
					<tr><td>작성자</td><td>제목</td><td>답변여부</td><td>등록일시</td><td>답변일시</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
</div>
<div class="container">
	<div class="newsupbox">
		<h2>공지등록</h2>
			<table>
				<tr><td><input type="hidden" id="newsid" readonly></td></tr>
				<tr><td>제목</td><td><input type="text" id="newstitle" size="60"></td></tr>
				<tr><td>공지내용</td><td><textarea rows="27" cols="80" id="newscontent"></textarea></td></tr>
				<tr><td colspan="2"><input type="button" id="nbtn" value="공지등록">
									<input type="button" id="nubtn" value="공지수정" disabled></td></tr>
			</table>
	</div>
	<div class="newsbox">
		<table id="newslist">
			<h3>공지목록</h3>
				<thead>
					<tr><td>제목</td><td>등록일시</td><td>조회수</td></tr>
				</thead>
				<tbody></tbody>
		</table>
	</div>
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
	deitemid();
	schedules();
	showmovie();
	showitem();
	showdetail();
	showinquiry();
	shownews();
})
.on('click','#sbtn',function(){
	let rid = $('#roomnum').val().split(',');
	
	let movienum = $('#movienum').val();
	let roomnum = rid[0];
	let date = $('#date').val();
	let stime = $('#stime').val();
	let etime = $('#etime').val();
	let seat = $('#seat').val();
	let aprice = $('#aprice').val();
	let yprice = $('#yprice').val();
	let ptype = $('#ptype').val();
	console.log(movienum,roomnum,date,stime,etime,seat,aprice,yprice,ptype);
	clear();
	
	$.post('/playlistin',{movienum:movienum,roomnum:roomnum,date:date,stime:stime,etime:etime,seat:seat,
							aprice:aprice,yprice:yprice,ptype:ptype},
							function(data){
								schedules();
	})
	
})
.on('click','#mbtn',function(){
	if($('#mname').val()=='' || $('#age').val()=='' || $('#runtime').val()=='' || $('#minfo').val()==''
		|| $('#director').val()==''|| $('#cast').val()==''|| $('#genre').val()==''|| $('#rdate').val()==''){
		alert("제대로")
	}else{
		let mname = $('#mname').val();
		let age = $('#age').val();
		let runtime = $('#runtime').val();
		let image = $('#image').val();
		let director = $('#director').val();
		let cast = $('#cast').val();
		let genre = $('#genre').val();
		let rdate = $('#rdate').val();
		let minfo = $('#minfo').val();
		console.log(mname,age,runtime,image,director,cast,genre,rdate,minfo);
		clear();
		
			$.post('/moviein',{mname:mname,age:age,runtime:runtime,image:image,director:director,cast:cast,
				genre:genre,rdate:rdate,minfo:minfo},
				function(data){
					showmovie();
			})
	}

})
.on('click','#ibtn',function(){
	if($('#itemname').val()=='' || $('#itemprice').val()=='' || $('#disprice').val()=='' || $('#conposition').val()==''
		|| $('#origin').val()==''){
		alert("제대로")
	}else{
		let itemname = $('#itemname').val();
		let itemprice = $('#itemprice').val();
		let disprice = $('#disprice').val();
		let conposition = $('#conposition').val();
		let origin = $('#origin').val();
		let itemimage = $('#itemimage').val();
	
		console.log(itemname,itemprice,disprice,conposition,origin,itemimage);
		clear();
	
			$.post('/itemin',{itemname:itemname,itemprice:itemprice,disprice:disprice,conposition:conposition,
				origin:origin,itemimage:itemimage},
				function(data){
					showitem();
			})
	}
})
.on('click','#dbtn',function(){
	if($('#deitemid').val()=='' || $('#detname').val()=='' || $('#period').val()==''){
		alert("제대로")
	}else{
		let deitemid = $('#deitemid').val();
		let detname = $('#detname').val();
		let period = $('#period').val();
	
	
		console.log(deitemid,detname,period);
		clear();
	
			$.post('/detailin',{deitemid:deitemid,detname:detname,period:period},
				function(data){
					showdetail();
			})
	}
})
.on('click','#nbtn',function(){
	if($('#newstitle').val()=='' || $('#newscontent').val()==''){
		alert("제대로")
	}else{
		let newstitle = $('#newstitle').val();
		let newscontent = $('#newscontent').val();
	
	
		console.log(deitemid,detname,period);
		clear();
		
			$.post('/newsin',{newstitle:newstitle,newscontent:newscontent},
				function(data){
					shownews();
			})
	}
 
}) 
.on('change','#roomnum',function(){
	aseat = $(this).val().split(',');
	$('#seat').val(aseat[1]);
	$('#aprice').val(aseat[2]);
	$('#yprice').val(aseat[3]);
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
	
	console.log(stime,jtime,ntime);
	if(stime<jtime){
		let a = $('#aprice').val();
		let y = $('#yprice').val();
		$('#aprice').val(fseat[2]-3000);
		$('#yprice').val(fseat[3]-3000);
		$('#ptype').val("조조");
	}else if(ntime<stime){
		let a = $('#aprice').val();
		let y = $('#yprice').val();
		$('#aprice').val(fseat[2]-3000);
		$('#yprice').val(fseat[3]-3000);
		$('#ptype').val("심야");
	}else{
		$('#aprice').val(fseat[2]);
		$('#yprice').val(fseat[3]);
		$('#ptype').val("일반");
	}
	
})
.on('click','#schedel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	console.log($(this).closest('tr').find('td:eq(0)').text());
	
	$.post('/schedel',{delid:delid},function(data){
			schedules();
	})
	
})
.on('click','#moviedel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	console.log($(this).closest('tr').find('td:eq(0)').text());
	
	$.post('/moviedel',{delid:delid},function(data){
		showmovie();
	})
	
})
.on('click','#itemdel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	console.log($(this).closest('tr').find('td:eq(0)').text());
	
	$.post('/itemdel',{delid:delid},function(data){
		showitem();
	})
	
})
.on('click','#detaildel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	console.log($(this).closest('tr').find('td:eq(0)').text());
	
	$.post('/detaildel',{delid:delid},function(data){
		showdetail();
	})
})
.on('click','#inquirydel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	console.log($(this).closest('tr').find('td:eq(0)').text());
	
	
	$.post('/inquirydel',{delid:delid},function(data){
		showinquiry();
		clear();
	})	
})
.on('click','#newsdel',function(){
	let delid = $(this).closest('tr').find('td:eq(0)').text();
	console.log($(this).closest('tr').find('td:eq(0)').text());
		
	$.post('/newsdel',{delid:delid},function(data){
		shownews();
		clear();
	})	
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
	
	console.log(anid,content,answer,nickname,title,current,created,ancreated);
	
	$('#anid').val(anid);
	$('#writer').val(nickname);
	$('#title').val(title);
	$('#content').val(content);
	$('#answer').val(answer);
	$('#createt').val(created);
	$('#answert').val(ancreated);
})
.on('click','#newslist tbody tr',function(){
	let newsid = $(this).find('td:eq(0)').text();
	let newscontent = $(this).find('td:eq(1)').text();
	let newstitle = $(this).find('td:eq(2)').text();
	
	$('#nbtn').prop('disabled', true);
	$('#nubtn').prop('disabled', false);
	
	console.log(newsid,newstitle,newscontent);
	
	$('#newsid').val(newsid);
	$('#newstitle').val(newstitle);
	$('#newscontent').val(newscontent);
})
.on('click','#nubtn',function(){
	let newsid = $('#newsid').val();
	let newstitle = $('#newstitle').val();
	let newscontent = $('#newscontent').val();
	
	clear();
	$.post('/newsup',{newsid:newsid,newstitle:newstitle,newscontent:newscontent},function(data){
		shownews();
	})
})
.on('click','#abtn',function(){
	let answer = $('#answer').val();
	let anid = $('#anid').val();
	clear();
	
	$.post('/inquiryup',{answer:answer,anid:anid},function(data){
		showinquiry();
	})
	
})
function mlist(){
	$.post('/mlist',{},function(data){
		console.log(data);
		$('#movienum').empty();
		for( let x of data){
			let str ='<option value='+x['id']+'>'+x['id']+', '+x['mname']+', '+x['runningtime']+'</option>';
			$('#movienum').append(str);
		}
	},'json')
}
function rlist(){
	$.post('/rlist',{},function(data){
		console.log(data);
		$('#roomnum').empty();
		for(let x of data){
			let str ='<option value='+x['id']+','+x['allseat']+','+x['adult_price']+','+x['young_price']+'>'+x['id']+', '+x['Sname']+', '+x['seatlevel']+', '+x['allseat']+'석</option>';
			$('#roomnum').append(str);
		}
	},'json')
}
function deitemid(){
	$.post('/deitemid',{},function(data){
		console.log(data);
		$('#deitemid').empty();
		for(let x of data){
			let str ='<option value='+x['id']+'>'+x['id']+', '+x['item_name']+'</option>';
			$('#deitemid').append(str);
		}
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
		fseat = $('#roomnum').val().split(',');
		$('#seat').val(fseat[1]);
		$('#aprice').val(fseat[2]);
		$('#yprice').val(fseat[3]);
	},'json')
}
function clear(){
	$('#date,#stime,#etime,#mname,#runtime,#director,#cast,#genre,#minfo,#rdate,#itemname,#itemprice,'
		+'#disprice,#conposition,#origin,#itemimage,#detname,#period,#anid,#writer,#title,#newsid,'
		+'#content,#answer,#createt,#answert,#newstitle,#newscontent').val('');
	$('#image').val('/chartImage/.jpg');
	$('#itemimage').val('/store_Images/.jpg');
	$('#nubtn').prop('disabled', true);
	$('#nbtn').prop('disabled', false);
}
function showmovie(){
	$.post('/showmovie',{},function(data){
		$('#movieinfo tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td>'+x['mname']+'</td><td>'+x['age']+'</td><td>'+x['reservation']+'</td><td>'+x['runningtime']+'</td><td>'+
						x['imagepath']+'</td><td>'+x['director']+'</td><td>'+x['cast']+'</td><td>'+x['genre']+'</td><td>'+x['releasedate']+'</td><td class=movietext>'+
						x['movieinfo']+'</td><td>'+
						'</td><td><input type=button id=moviedel value=삭제></td></tr>'
			$('#movieinfo tbody').append(str);
		}
		
	},'json')
}
function showitem(){
	$.post('/showitem',{},function(data){
		console.log("aaaaaaa",data)
		$('#itemlist tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td>'+x['item_name']+'</td><td>'+x['price']+'</td><td>'+x['discount_price']+'</td><td>'+x['composition']+'</td><td>'+
						x['origin']+'</td><td>'+x['image_path']+'</td><td><input type=button id=itemdel value=삭제></td></tr>'
			$('#itemlist tbody').append(str);
		}
		
	},'json')
}
function showdetail(){
	$.post('/showdetail',{},function(data){
		console.log("aaaaaaa",data)
		$('#detaillist tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td>'+x['item_id']+'</td><td>'+x['name']+'</td><td>'+x['period']+'</td><td>'+
			'</td><td><input type=button id=detaildel value=삭제></td></tr>'
			$('#detaillist tbody').append(str);
		}
		
	},'json')
}
function showinquiry(){
	$.post('/showinquiry',{},function(data){
		$('#inquirylist tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td style=display:none>'+x['content']+'</td><td style=display:none>'+x['answer']+'</td><td>'+x['nickname']+'</td><td>'+x['title']+'</td><td>'+
			x['current']+'</td><td>'+x['created']+'</td><td>'+x['ancreated']+'</td><td>'+'</td><td><input type=button id=inquirydel value=삭제></td></tr>'
			$('#inquirylist tbody').append(str);
		}
		
	},'json')
}
function shownews(){
	$.post('/shownews',{},function(data){
		$('#newslist tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td style=display:none>'+x['content']+'</td><td>'+x['title']+'</td><td>'+x['create']+'</td><td>'+x['hit']+'</td><td><input type=button id=newsdel value=삭제></td></tr>'
			$('#newslist tbody').append(str);
		}
		
	},'json')
}

</script>
</html>