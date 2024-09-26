<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header Component</title>
    <link rel="stylesheet" href="/Header_css/Header.css">
</head>
<body>
    <header class="header">
    	<h1 class="logo"><a href="/">HIII CINEMA</a></h1>
        <div class="navbar2">
        	<ul class="nav-links">
            	${sessionScope.linkstr}
                <li><a href="/myhome">My페이지</a></li>
                <li><a href="/serviceHome">고객센터</a></li>
            </ul>
        </div>
        <div class="navbar1">
        	<ul class="nav-links">
				<li><a href="/chart" class="hover-icon icon-chart">영화</a></li>
				<li><a href="/cinema" class="hover-icon icon-cinema">극장</a></li>
				<li><a href="/ticket" class="hover-icon icon-ticket">예매</a></li>
				<li><a href="/store" class="hover-icon icon-store">스토어</a></li>
            </ul>
        </div>
    </header>
</body>
</html>
