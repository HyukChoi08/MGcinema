<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비차트</title>
</head>
<style> 

body {
    flex-direction: column; /* 세로 방향으로 배치 */
    justify-content: space-between; /* 푸터를 아래쪽으로 이동 */
    align-items: center; /* 가운데 정렬 */
    height: 100vh; /* 뷰포트 높이와 같게 설정 */
    background-color: black;
    color: white;
}

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
    margin-top:150px;
}
.vertical-container4 {
    display: flex;
    flex-direction: column;
    align-items: center; /* 가운데 정렬 */
    justify-content: center; /* 수직 중앙 정렬 */
    height: 100vh; /* 전체 뷰포트 높이 */
    width: 100%; /* 전체 너비 */
    padding: 20px; /* 적절한 여백 추가 */
}
ol {
    display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    list-style-type: none; /* 숫자 지우는 것 */
    
}
a {
    text-decoration-line: none;
    color:white;
}
.rank {
    display: inline-block; /* 요소를 블록처럼 취급하여 너비를 지정할 수 있게 함 */
    width: 200px; /* 고정 너비 설정 */
    text-align: center;
    background-color: red;
    color: white;
    margin-left: 20px; /* 좌측 간격 설정 */
    margin-right: 20px; /* 우측 간격 설정 */
    letter-spacing: 4px; /* 문자 간격 추가 */
}

.rank2 {
    display: inline-block; /* 요소를 블록처럼 취급하여 너비를 지정할 수 있게 함 */
    width: 200px; /* 고정 너비 설정 */
    text-align: center;
    background-color: grey;
    color: white;
    margin-left: 20px; /* 좌측 간격 설정 */
    margin-right: 20px; /* 우측 간격 설정 */
    letter-spacing: 4px; /* 문자 간격 추가 */
}
.button-container {
    display: flex;
    justify-content: flex-end; /* 버튼을 오른쪽으로 정렬 */
    width: 100%; /* 컨테이너가 전체 너비를 차지하도록 설정 */
    padding-right: 20px; /* 필요한 만큼 패딩 조정 */
}

.button-container button {
    width: auto; /* 버튼의 너비를 콘텐츠에 맞게 자동 조정 */
    padding: 8px 20px; /* 원하는 패딩 설정 */
 
    background-color:#E6E6FA;
    color: greyblue;
    border: none;
    border-radius: 5px; /* 둥근 모서리 설정 */
}
.mnamecolor{
	color:#EF6C00;
}

</style>

<body>
 <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div class="vertical-container4"> 
	<div class="vertical-container1">
		<div><h1>무비차트</h1></div>
		<div class="button-container"><select size=1 style="width:100px;height:30px;" id="chartArray"></select><button id="list">Go</button></div>
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
	    <div class="button-container"><button class="button-container button" id="plus">더보기</button></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->
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
                str1 += '<div class="vertical-container"><div><strong class="rank">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px" ></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
            } else if (count >= 3 && count < 7) {
            	 str2 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
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
                    	 str1 += '<div class="vertical-container"><div><strong class="rank">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
                    } else if (count >= 3 && count < 7) {
                    	 str2 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
                    } else if (count >= 7 && count < 11) {
                    	 str3 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
                    } else if (count >= 11 && count < 15) {
                    	 str4 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
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
			            	 str1 += '<div class="vertical-container"><div><strong class="rank">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a</span></div></div>';
			            } else if (count >= 3 && count < 7) {
			            	 str2 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
			            } else if (count >= 7 && count < 11) {
			            	 str3 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
			            } else if (count >= 11 && count < 15) {
			            	 str4 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
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
                    	 str1 += '<div class="vertical-container"><div><strong class="rank">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
                    } else if (count >= 3 && count < 7) {
                    	 str2 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
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
			            	 str1 += '<div class="vertical-container"><div><strong class="rank">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
			            } else if (count >= 3 && count < 7) {
			            	 str2 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong>예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong>'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span><a href="asd">예매</a></span></div></div>';
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