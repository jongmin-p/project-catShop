<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="stylesheet" type="text/css" href="css/juanButton.css" />
</head>
<body>
	<div class="content">
		<div class="container">
			<h2 class="mb-5" style="margin-top: 5% !important;">공지사항</h2>

			<div class="table-responsive custom-table-responsive">
				<table class="table custom-table">
					<thead>
						<tr>

							<th scope="col"><label class="control control--checkbox">
									<c:choose>
										<c:when test="${auth == 'admin'}">
											<input type="checkbox" class="js-check-all" id="cboxAll"
												name="cboxAll" onclick="checkAll()" />
										</c:when>
										<c:otherwise>
											<input type="hidden" class="js-check-all" id="cboxAll"
												name="cboxAll" onclick="checkAll()" />
										</c:otherwise>
									</c:choose>
									<div class="control__indicator"></div>
							</label></th>

							<th scope="col">글번호</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col"></th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${list }">
							<tr scope="row"
								onclick="location.href='noticeDetail.do?notId=${notice.notId}'"
								style="cursor: pointer">
								<th scope="row" onclick="event.cancelBubble=true"><label
									class="control control--checkbox"> <c:choose>
											<c:when test="${auth == 'admin'}">
												<input type="checkbox" name="cbox" />
											</c:when>
											<c:otherwise>
												<input type="hidden" name="cbox" />
											</c:otherwise>
										</c:choose>
										<div class="control__indicator"></div>
								</label></th>
								<td>${notice.notId }</td>
								<td>관리자</td>
								<td>${notice.notTitle }</td>
								<td></td>
								<td>${notice.notDate }</td>
							</tr>
						</c:forEach>
						<tr class="spacer">
							<td colspan="100"></td>
						</tr>
					</tbody>
				</table>
				<button onclick="location.href='addNoticeForm.do'" class="admin">
					글작성</button>
				<button class="admin" id="delBtn" onclick="delCheck()">삭제</button>
			</div>
		</div>
	</div>

	<script>
		//체크박스
		function checkAll() {
			if ($("#cboxAll").is(":checked")) {
				$("input[name=cbox]").prop("checked", true);
			} else {
				$("input[name=cbox]").prop("checked", false);
			}
		}

		$(document).on("click", "input:checkbox[name=cbox]", function(e) {
			var chks = document.getElementsByName("cbox");
			var chksChecked = 0;

			for (var i = 0; i < chks.length; i++) {
				var cbox = chks[i];

				if (cbox.checked) {
					chksChecked++;
				}
			}

			if (chks.length == chksChecked) {
				$("#cboxAll").prop("checked", true);
			} else {
				$("#cboxAll").prop("checked", false);
			}
		});

		//삭제 confirm
		function delCheck() {
			var returnValue = confirm('삭제하시겠습니까?');

			if (returnValue == true) {
				delNotice()

			} else {
				var chks = document.getElementsByName("cbox");
				$(chks).prop("checked", false)
			}
		}
		//삭제버튼 누르면 체크된거만 삭제
		function delNotice() {

			var chks = document.getElementsByName("cbox");
			var chkst = [];
			for (let i = 0; i < chks.length; i++) {
				if (chks[i].checked == true) {
					chkst.push(chks[i].closest("tr").children[1].innerText);
				}
			}
			console.log(chkst);
			$.ajax({
				url : "noticeDelete.do",
				type : "post",
				traditional : true, // ajax 배열 넘기기 옵션!
				data : {
					arrStr : chkst
				},
				dataType : "json",
				success : function(result) {
					//일로 안와서 밑에서 reload함
				},
				error : function(reject) {
					location.reload();
				},
			});
		}

		//관리자만 작성삭제 보이게
		if ("${auth}" !== "admin") {
			let buttons = document.querySelectorAll(".admin");
			//속성 값 설정
			for (let i = 0; i < buttons.length; i++) {
				buttons[i].setAttribute("hidden", true);
			}
		}
	</script>