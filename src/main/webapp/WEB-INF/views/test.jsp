<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
	<input type=text id="tname"> <input type=number id="passwd">
	<button id="submit">확인</button>
=======
<<<<<<< HEAD
제발제발제발3123123123asdasddd
=======
제발제발제발3123123123asdasds 김민수 수정
>>>>>>> branch 'master' of https://github.com/HyukChoi08/MGcinema.gitddddddd
ㅇㅇㅇ
!!!
>>>>>>> branch 'master' of https://github.com/HyukChoi08/MGcinema.git
</body>
<script src='https://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.on('click','#submit',function(){
	let realname = $('#tname').val();
	let passwd = $('#passwd').val();
	$.ajax({
		url:'/addMenu',type:'post',data:{realname:realname,passwd:passwd},dataType:'text',
		success:function(data) {
			if(data=='ok') {
			}
		}
	})
})
</script>
</html>