<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀렉트 테스트 해보자잉</title>
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

ul {
    display: flex; /* ul 요소를 플렉스 컨테이너로 설정 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
}
</style>
<body>
<div>
    <div class="vertical-container">
        <div class="flex-container">
            <ul id="1">
            </ul>
        </div>
        <div class="flex-container">
            <ul id="2">
            </ul>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$.ajax({
    url: '/test',
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
            if (i < 3) {
                str1 += '<li>' + data[count]['image'] + '</li>';
            } else if (i >= 3 && i < 7) {
                str2 += '<li>' + data[count]['image'] + '</li>';
            }
        }
        $('#1').append(str1);
        $('#2').append(str2);
    }
});
</script>
</html>