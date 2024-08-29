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
 <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div>
	<div><h3>무비차트</h3></div>
	<div><select size=1 style="width:100px;height:30px;" id="chartArray"></select><button id="list">Go</button></div>
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
                str1 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
            } else if (count >= 3 && count < 7) {
            	 str2 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
            }
        }
        $('#1').append(str1);
        $('#2').append(str2);
    }
});
//chartArray select에 넣는것
$.ajax({
	    url: '/chartArray',
	    type: 'post',
	    data: {},
	    dataType: "json",
	    success: function(data) {
	        console.log(data);
	    let str=''
	    for(let i = 0;i<data.length;i++){
	    str += '<option value="'+data[i]['id']+'">'+data[i]['text']+'</option>'	
	    }
	    $('#chartArray').append(str);
	    }
	        
	    })
	    // 더보기를 눌러서 차트 다시보이게 하는거
$(document)
.on('click','#plus',function(){
    // select 요소를 가져옵니다.
    let selectElement = document.getElementById('chartArray');

    // 선택된 옵션의 id를 가져옵니다.
    let selectedOptionId = selectElement.options[selectElement.selectedIndex].value;
	console.log("id",selectedOptionId);
    if (selectedOptionId == 1) {
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
                    	 str1 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
                    } else if (count >= 3 && count < 7) {
                    	 str2 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
                    } else if (count >= 7 && count < 10) {
                    	 str3 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
                    } else if (count >= 10 && count < 14) {
                    	 str4 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
                    }
                }
                $('#1').append(str1);
                $('#2').append(str2);
                $('#3').append(str3);
                $('#4').append(str4);
            }
        });
		}else if(selectedOptionId == 2){
			$.ajax({
			    url: '/chartList11',
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
			            	 str1 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
			            } else if (count >= 3 && count < 7) {
			            	 str2 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
			            } else if (count >= 7 && count < 10) {
			            	 str3 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
			            } else if (count >= 10 && count < 14) {
			            	 str4 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
			            }
			        }
			        $('#1').append(str1);
			        $('#2').append(str2);
			        $('#3').append(str3);
			        $('#4').append(str4);
			    }
			});
		}
})
//go버튼을 눌렀을 때의 화면
.on('click', '#list', function() {
    // select 요소를 가져옵니다.
    let selectElement = document.getElementById('chartArray');

    // 선택된 옵션의 id를 가져옵니다.
    let selectedOptionId = selectElement.options[selectElement.selectedIndex].value;
	console.log("id",selectedOptionId);
    if (selectedOptionId == 1) {
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
                    	 str1 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
                    } else if (count >= 3 && count < 7) {
                    	 str2 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
                    }
                }
                $('#1').append(str1);
                $('#2').append(str2);
            }
        });
		}else if(selectedOptionId == 2){
			$.ajax({
			    url: '/chartList11',
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
			            	 str1 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
			            } else if (count >= 3 && count < 7) {
			            	 str2 += '<div class="vertical-container"><div><strong>No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><a href="asd">예매</a></div></div>';
			            }
			        }
			        $('#1').append(str1);
			        $('#2').append(str2);
			    }
			});
		}

	

	
})
</script>
</html>