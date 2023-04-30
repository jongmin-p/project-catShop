<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">Q&A 등록</h1>
	</div>
</div>

<div class="container">
	<form name="newQa" class="form-horizontal" id="frm">


		<div class="form-group row">
			<label class="col-sm-2">상품ID</label>
			<div class="com-sm-3">
				<input value="${qaDetail.proId }" type="text" id="qaProId" name="qaProId" class="form-control" readonly>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">제목</label>
			<div class="com-sm-3">
				<input data-name="제목" type="text" id="qaTitle" name="qaTitle" class="form-control data">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">작성자</label>
			<div class="com-sm-3">
				<input value="${logId }" type="text" id="qaWriter" name="qaWriter" class="form-control" readonly>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">상세 내용</label>
			<div class="com-sm-5">
				<textarea data-name="상세 내용" id="qaDesc" name="qaDesc" cols="50" rows="2" class="form-control data"></textarea>
			</div>
		</div>
		<br>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-primary" value="등록" id="addQa">
			</div>
		</div>

	</form>
</div>

<script>
	$('#addQa').click(function() {
		let qaProId = $("#qaProId").val();
		let qaTitle = $("#qaTitle").val();
		let qaWriter = $("#qaWriter").val();
		let qaDesc = $("#qaDesc").val();
	
		var isRight = true;
		$("#frm").find(".data").each(function(index, item) {
			if ($(this).val().trim() == '') {
				alert($(this).attr("data-name") + " 항목을 입력하세요.");
				isRight = false;
				return false;
			}
		});
	
		if (!isRight) {
			return;
		}
	
		$(this).prop("disabled", true);
		$(this).prop("disabled", false);
	
	
	
		$.ajax({
			url: "insertProductQa.do",
			method: "post",
			data: { qaProId: qaProId, qaTitle: qaTitle, qaWriter: qaWriter, qaDesc: qaDesc },
			success: function(result) {
				console.log(result)
				if (result.retCode == "Success") {
					let popup = confirm("등록 하시겠습니까?")
					if (popup) {
						opener.location.reload();
						window.close();
					}
				} else {
					alert("오류");
				}
			},
			error: function(reject) {
				console.log(reject);
			},
		});
	})

</script>