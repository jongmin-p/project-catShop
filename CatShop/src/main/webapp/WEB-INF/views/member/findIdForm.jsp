<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
		* {
			padding: 0;
			margin: 0;
			border: none;
		}

		body {
			font-size: 14px;
			font-family: 'Roboto', sans-serif;
		}

		.info-wrapper {
			width: 400px;
			height: 350px;
			padding: 40px;
			box-sizing: border-box;
			margin: 0 auto;
		}

		.info-wrapper>h2 {
			font-size: 30px;
			color: #6A24FE;
			margin-bottom: 20px;
		}

		.info-wrapper {
			text-align: center;
		}

		.info-wrapper>input,
		.info-wrapper>button {
			width: 100%;
			height: 48px;
			padding: 0 10px;
			box-sizing: border-box;
			margin-bottom: 16px;
			border-radius: 6px;
			background-color: #d3d3d3;
		}

		.info-wrapper>input::placeholder {
			color: #797979;
		}

		.info-wrapper>button[type="submit"] {
			color: #fff;
			font-size: 16px;
			background-color: #6A24FE;
			margin-top: 20px;
		}
	</style>
</head>

<body>
	<div class="info-wrapper">
		<h2>아이디 찾기</h2>
		<div id="errorMsg"></div> <!-- 여기다가 에러 메시지 출력 -->

		<input type="text" id="mname" name="name" placeholder="이름을 입력하세요." required="required">
		<input type="text" id="memail" name="email" placeholder="이메일을 입력하세요." required="required">

		<button type="submit" id="findIdBtn">아이디 찾기</button>
	</div>

	<script>
		$("#findIdBtn").on('click', function () {
			let name = $("#mname").val();
			let email = $("#memail").val();

			$.ajax({
				url: "findId.do",
				type: "post",
				data: {
					name: name,
					email: email
				},

				success: function (result) {

					if (result.retCode == "Success") {
						location.href = 'findIdResult.do';
					} else if (result.retCode == "Fail") {
						$("#errorMsg").text("해당하는 정보의 아이디가 존재하지 않습니다.");
						$("#errorMsg").css("color", "red");

						$('#mname').val('');
						$('#memail').val('');
					}
				},

				error: function () {
					console.log("실패");
				},
			});
		});
	</script>
</body>
</html>