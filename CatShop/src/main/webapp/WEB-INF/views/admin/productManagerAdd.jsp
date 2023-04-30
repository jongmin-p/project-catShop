<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	span {
		margin: 10px;
	}
	div#image_container img{
		height : 300px;
		width : 300px;
	}
</style>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 등록</h1>
	</div>
</div>

<div class="container">

	<form name="newProduct" action="insertProductManager.do"
		class="form-horizontal" method="post" enctype="multipart/form-data">

		<div class="form-group row">
			<label class="col-sm-2">상품 이름</label>
			<div class="com-sm-3">
				<input type="text" id="proName" name="proName" class="form-control">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">상품 가격</label>
			<div class="com-sm-3">
				<input type="text" id="proPrice" name="proPrice"
					class="form-control">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">상세 내용</label>
			<div class="com-sm-5">
				<textarea name="proDesc" cols="50" rows="2" class="form-control"></textarea>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">카테고리</label>
			<div class="com-sm-5">
				<span><input type="radio" name="proCategory" value="식품"> 식품 </span>
				<span><input type="radio" name="proCategory" value="위생용품"> 위생 </span>
				<span><input type="radio" name="proCategory" value="목욕용품"> 목욕 </span>
				<span><input type="radio" name="proCategory" value="장난감"> 장난감 </span>
				<span><input type="radio" name="proCategory" value="가구"> 가구 </span>
				<span><input type="radio" name="proCategory" value="기타"> 기타 </span>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">상품 이미지</label>
			<div>
				<input type="file" name="proImg" class="form-control" onchange="setThumbnail(event);">
				<br>
				<div id="image_container" style="text-align: center;"></div>
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록">
			</div>
		</div>

	</form>
</div>

<script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>