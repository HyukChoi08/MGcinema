<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비차트</title>
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

ol {
    display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    list-style-type: none; /* 숫자 지우는 것 */
}
</style>
<body>
<div>
	<div><h3>무비차트</h3></div>
	<div><select size=2 style="width:100px;height:30px;"></select><button id="list">Go</button></div>
    <div class="vertical-container">
        <div class="vertical-container">
            <ol id="1">
            </ol>
        </div>
        <div class="vertical-container">
            <ol id="2">
            </ol>
        </div>
    </div>
        <div class="vertical-container">
        <div class="vertical-container">
            <ol id="3">
            </ol>
        </div>
        <div class="vertical-container">
            <ol id="4">
            </ol>
        </div>
    </div>
    <div><button id="plus">더보기</button></div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
// 차트 보이게하는거
$.ajax({
    url: '/chartList',
    type: 'post',
    data: {},
    dataType: "json",
    success: function(data) {
        console.log(data);
        let str1 = '';
        let str2 = '';
        $('#1').empty();
        $('#2').empty();
        for (let count = 0; count < data.length; count++) {
            if (count < 3) {
                str1 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'<strong><li><a href=""><img src=' + data[count]['image'] +' width="150" height="100"></a></li></div><div><a href="asd">asd</a><br><span><a href="asd">예매</a></div></div>';
            } else if (count >= 3 && count < 7) {
                str2 +=  '<div class="vertical-container"><div><strong>No.'+(count+1)+'<strong><li><a href=""><img src=' + data[count]['image'] +' width="150" height="100"></a></li></div><div><a href="asd">asd</a><br><span><a href="asd">예매</a></div></div>';
            }
        }
        $('#1').append(str1);
        $('#2').append(str2);
    }
});
//차트 다시보이게 하는거
$(document)
.on('click','#plus',function(){
	$.ajax({
	    url: '/chartList',
	    type: 'post',
	    data: {},
	    dataType: "json",
	    success: function(data) {
	        console.log(data);
	        let str1 = '';
	        let str2 = '';
	        let str3 = '';
	        let str4 = '';
	        $('#1').empty();
	        $('#2').empty();
	        $('#3').empty();
	        $('#4').empty();
	        for (let count = 0; count < data.length; count++) {
	            if (count < 3) {
	                str1 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'<strong><li><a href=""><img src=' + data[count]['image'] +' width="150" height="100"></a></li></div><div><a href="asd">asd</a><br><span><a href="asd">예매</a></div></div>';
	            } else if (count >= 3 && count < 7) {
	                str2 +=  '<div class="vertical-container"><div><strong>No.'+(count+1)+'<strong><li><a href=""><img src=' + data[count]['image'] +' width="150" height="100"></a></li></div><div><a href="asd">asd</a><br><span><a href="asd">예매</a></div></div>';
	            } else if (count >= 7 && count < 10) {
	                str3 +=  '<div class="vertical-container"><div><strong>No.'+(count+1)+'<strong><li><a href=""><img src=' + data[count]['image'] +' width="150" height="100"></a></li></div><div><a href="asd">asd</a><br><span><a href="asd">예매</a></div></div>';
	            } else if (count >= 10 && count < 14) {
	                str4 +=  '<div class="vertical-container"><div><strong>No.'+(count+1)+'<strong><li><a href=""><img src=' + data[count]['image'] +' width="150" height="100"></a></li></div><div><a href="asd">asd</a><br><span><a href="asd">예매</a></div></div>';
	            }
	        }
	        $('#1').append(str1);
	        $('#2').append(str2);
	        $('#3').append(str3);
	        $('#4').append(str4);
	    }
	});
	
})
</script>
</html>