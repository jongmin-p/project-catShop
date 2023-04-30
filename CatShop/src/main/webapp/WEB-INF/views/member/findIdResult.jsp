<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		* {
			padding: 0;
			margin: 0;
			border: none;
		}

		.container {
			text-align: center;
		}

		h2 {
			text-align: center;
			margin-top: 20px;
		}

		span {
			color: red;
		}

		#loginBtn {
			width: 100px;
			height: 48px;
			padding: 0 10px;
			box-sizing: border-box;
			margin-bottom: 16px;
			border-radius: 6px;

			color: #fff;
			font-size: 16px;
			background-color: #6A24FE;
			margin-top: 20px;
		}
	</style>
</head>

<body>
	<div class="container">
		<h2>
			회원님의 아이디는 <span>${fId}</span> 입니다.
		</h2>

		<button type="button" id="loginBtn" onClick="location.href='loginForm.do'">로그인</button>
	</div>
</body>
</html>