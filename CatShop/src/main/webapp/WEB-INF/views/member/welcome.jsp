<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* 이거 있으면 고양이 사진 옆으로 가는데, 일단 고양이 사진 밑으로 보내달라고 하심 */

/* #container {
	width: 500px;
	height: 500px;
	display: flex;
	flex-direction: column;
	align-items: center;
	position: absolute;
	top: 50%;
	left: 70%;
	transform: translate(-50%, -50%);
	border: 1px solid rgb(89, 117, 196);
	border-radius: 10px;
} */
</style>
</head>

<body>
	<div id="container">
		<h3 id="title">Welcome Page</h3>
		<h6>환영합니다 ${logName} 님</h6>

	</div>
</body>
</html>