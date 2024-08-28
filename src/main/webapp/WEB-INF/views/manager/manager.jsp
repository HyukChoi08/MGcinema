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
<div class="container">
<div class="movieinsert1">
<h2>영화 상영정보 추가</h2>
<table>
	<tr><td>영화선택</td><td><select class="mselect" id="movienum"></select></td></tr>
	<tr><td>관선택</td><td><select class="mselect" id="roomnum"></select></td></tr>
	<tr><td>상영일</td><td><input type="date" id="date"></td></tr>
	<tr><td>시작시간</td><td><input type="text" id="stime"></td></tr>
	<tr><td>종료시간</td><td><input type="text" id="etime"></td></tr>
	<tr><td colspan="2"><input type="button" id="mbtn" value="상영정보추가"></td></tr>
</table>
</div>
<div class="movieinsert2">
<table id="schedules"></table>
</div> 
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	mlist();
	rlist();
})
.on('click','#mbtn',function(){
	let movienum = $('#movienum').val();
	let roomnum = $('#roomnum').val();
	let date = $('#date').val();
	let stime = $('#stime').val();
	let etime = $('#etime').val();
	console.log(movienum,roomnum,date,stime,etime);
	clear();
	
	$.post('/playlistin',{movienum:movienum,roomnum:roomnum,date:date,stime:stime,etime:etime},function(data){
	},'json')
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
		for( let x of data){
			let str ='<option value='+x['id']+'>'+x['id']+', '+x['Sname']+', '+x['seatlevel']+'</option>';
			$('#roomnum').append(str);
		}
	},'json')
}
function clear(){
	$('#date,#stime,#etime').val('');
}

</script>
</html>