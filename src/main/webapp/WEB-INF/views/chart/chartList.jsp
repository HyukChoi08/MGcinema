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
    display: flex;
    flex-direction: column; /* 세로 방향으로 배치 */
    justify-content: space-between; /* 헤더와 푸터 사이에 콘텐츠 공간 확보 */
    min-height: 100vh; /* 최소 높이 설정 */
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
    margin-top:50px;
}
.vertical-container4 {
    flex: 1; /* 콘텐츠 영역이 남은 공간을 차지하도록 설정 */
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
a {
    text-decoration-line: none;
    color: white;
}
.rank {
    display: inline-block; /* 요소를 블록처럼 취급하여 너비를 지정할 수 있게 함 */
    width: 200px; /* 고정 너비 설정 */
    text-align: center;
    background-color: red;
    color: white;
    margin-left: 40px; /* 좌측 간격 설정 */
    margin-right: 40px; /* 우측 간격 설정 */
    letter-spacing: 4px; /* 문자 간격 추가 */
}

.rank2 {
    display: inline-block; /* 요소를 블록처럼 취급하여 너비를 지정할 수 있게 함 */
    width: 200px; /* 고정 너비 설정 */
    text-align: center;
    background-color: grey;
    color: white;
    margin-left: 40px; /* 좌측 간격 설정 */
    margin-right: 40px; /* 우측 간격 설정 */
    margin-top:40px;
    letter-spacing: 4px; /* 문자 간격 추가 */
    
}
.button-container {
    display: flex;
    justify-content: flex-end; /* 버튼을 오른쪽으로 정렬 */
    width: 100%; /* 전체 너비를 차지하도록 설정 */
    padding-right: 20px; /* 오른쪽 여백 추가 */
    margin-top: auto; /* 푸터 위에 위치하도록 설정 */
}

.button-container button {
    width: auto; /* 버튼의 너비를 콘텐츠에 맞게 자동 조정 */
    padding: 8px 20px; /* 원하는 패딩 설정 */
    background-color: #444; /* 검정색 배경에 적합한 어두운 회색 */
    color: white; /* 흰색 텍스트 */
    border: none;
    border-radius: 5px; /* 둥근 모서리 설정 */
    font-size: 14px; /* 글자 크기 설정 */
}

.button-container button:hover {
    background-color: #555; /* 마우스를 올렸을 때 색상 변경 */
}

.mnamecolor {
    color: #FF5722; /* 색상 변경: 주황색으로 설정 */
}
.mnamecolor:hover{
 background-color: #555; /* 마우스를 올렸을 때 색상 변경 */
}
.small-text {
    font-size: 13px; /* 글자 크기 작게 설정 */
}
.reservation-text {
    font-size: 13px; /* 예매율 텍스트 크기 조절 */
}

.release-date {
    font-size: 12px; /* 개봉 텍스트 크기 조절 */
}
.buyticket{
color: #BE2E22;
}
.buyticket:hover{
 background-color: #555; /* 마우스를 올렸을 때 색상 변경 */
 }
</style>

<body>
 <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
<div class="vertical-container4">
	<div class="vertical-container1">
		<div><h1>무비차트</h1></div>
		<div class="button-container">
			<select size=1 style="width:100px;height:30px;" id="sortCriteria" onchange="changeEventOfSortFilter()">
                <option value="releasedate desc">최신순</option>
                <option value="reservation desc">예매율순</option>
            </select>
            <button id="list">Go</button></div>
 		<div class="vertical-container1" id="movieList">
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
        </div><br><br><br>
	    <div class="button-container"><button class="button-container button" id="plus">더보기</button></div>
	</div>
</div>
<!-- 푸터 포함 -->
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
let isSelectedSortCriteriaChanged = false;
let pageNumber = 0;


	    // 더보기를 눌러서 차트 다시보이게 하는거
$(document)
.on('click','#plus',function(){
    if(isSelectedSortCriteriaChanged) {
        firstLoadMovieList();
    } else {
        addAllRestMovies();
    }
})
//go버튼을 눌렀을 때의 화면
.on('click', '#list', function() {
            firstLoadMovieList();
        })
    function firstLoadMovieList(){
        $('#movieList').empty();
        $.ajax({
            url: '/chartList',
            type: 'post',
            data: {pageSize:7,selectedSortCriteria:$("#sortCriteria").val()},
            dataType: "json",
            success: function(data) {
                pageNumber = 1;
                isSelectedSortCriteriaChanged = false;

                let str1 = '';
                $('#1').empty();
                $('#2').empty();
                for (let count = 0; count < data.length; count++) {
                    let isFirstLine = count < 3;
                    if (isFirstLine) {
                        if (count == 0) {
                            str1 += '<ol>'
                        }

                        str1 += '<div class="vertical-container">' +
                                        '<div>' +
                                            '<strong class="rank">No.'+(count+1)+'</strong>' +
                                            '<li>' +
                                            '<a href="chartList1?id='+data[count]['id']+'">' +
                                            '<img src=' + data[count]['imagepath'] +' height="400px" width="200px" ></a>' +
                                            '</li>' +
                                        '</div>' +
                                        '<div>' +
                                            '<a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br>' +
                                            '<div>' +
                                            '<strong class="reservation-text">예매율<span>'+data[count]['reservation']+'%</span></strong>' +
                                            '</div>' +
                                            '<span><strong class="release-date">'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span>' +
                            '<a href="/ticket?mname=' + data[count]['mname'] + '" class="buyticket">예매하기</a></span>'
                            +
                                        '</div>' +
                                '</div>';

                        if (count == 2) {
                            str1 += '</ol>'
                        }


                    } else {
                        if (count % 4 == 3) {
                            str1 += '<ol>'
                        }
                        str1 += '<div class="vertical-container">' +
                            '<div><strong class="rank2">' +
                            'No.'+(count+1)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong class="reservation-text">예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong class="release-date">'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span>' +
                            '<a href="/ticket?mname=' + data[count]['mname'] + '" class="buyticket">예매하기</a></span>' +
                            '</div>' +
                            '</div>';
                        if (count % 4 == 2) {
                            str1 += '</ol>'
                          
                        }
                    }
                    
                }

                $('#movieList').append(str1);
            }
        });
    }
    
function addAllRestMovies(){
    let selectedSortCriteria = $("#sortCriteria").val();
    $.ajax({
        url: '/chartList',
        type: 'post',
        data: {selectedSortCriteria:selectedSortCriteria, pageSize:2000, pageNumber},
        dataType: "json",
        success: function(data) {
            $("#plus").hide();
            let str1 = '';
            $('#1').empty();
            $('#2').empty();
            $('#3').empty();
            $('#4').empty();
            for (let count = 0; count < data.length; count++) {
                if (count == 0 || (count % 4 == 0)) {
                    str1 += '<ol>'
                }
                str1 += '<div class="vertical-container"><div><strong class="rank2">No.'+(count+8)+'</strong><li><a href="chartList1?id='+data[count]['id']+'"><img src=' + data[count]['imagepath'] +' height="400px" width="200px"></a></li></div><div><a href="chartList1?id='+data[count]['id']+'"class="mnamecolor">'+data[count]['mname']+'</a><br><div><strong class="reservation-text">예매율<span>'+data[count]['reservation']+'%</span></strong></div><span><strong class="release-date">'+data[count]['releasedate']+'<span>개봉</span></strong></span><br><span>' +
                    '<a href="/ticket?mname=' + data[count]['mname'] + '" class="buyticket">예매하기</a></span></div>' +
                    '</div>';
                if (count == 3 || count % 4 == 3) {
                    str1 += '</ol>'
                }
            }
            $('#movieList').append(str1);
        }
    });
}

function changeEventOfSortFilter(){
    isSelectedSortCriteriaChanged = true;
    pageNumber = 0;
    $("#plus").show();
}

function updaterenewal(){
	$.ajax({
		url:'/updaterenewal',
		type:'post',
		data:{},
		success:function(data){
			console.log("updaterenewal",data)
		}
	});
}
$(document).ready(function () {
    firstLoadMovieList();
    updaterenewal();
});
</script>
</html>