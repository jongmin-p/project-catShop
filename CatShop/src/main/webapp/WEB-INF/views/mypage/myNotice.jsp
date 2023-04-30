<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js">
	
</script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/payment.js"></script>
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">

<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">
<style>
.selectpicker+.bootstrap-select>.btn-light {
	display: none !important;
}

.bootstrap-select>.dropdown-menu {
	display: none !important;
}

.nice-select {
	display: none !important;
}

#couponList {
	display: block !important;
}

.ordImg {
	width: 120px;
	height: 90px;
	border-radius: 10px;
}

button {
	color: white;
	background-color: rgba(0, 0, 0, 0.644);
	border-radius: 5px;
	border: none;
	height: 35px;
	margin: 15px 2.5px;
}
</style>
<div class="colorlib-product" id="table1" style="display: block;">
	<h2 style="text-align: center;">나의 후기</h2>
	<div class="container">
		<button onclick="changeReview()">나의 후기</button>
		<button onclick="changeQa()">나의 QnA</button>
		<div class="row row-pb-lg">
			<div class="col-md-12">
				<div class="product-name d-flex">
					<div class="one-eight text-left px-4"></div>
					<div class="one-eight text-left px-4">
						<span>상품정보</span>
					</div>
					<div class="one-eight text-left px-4"></div>
					<div class="one-eight text-center">
						<span>별점</span>
					</div>
					<div class="one-eight text-center"></div>
					<div class="one-eight text-center">
						<span>제목</span>
					</div>
					<div class="one-eight text-center"></div>
					<div class="one-eight text-center">
						<span>작성일</span>
					</div>
					<div class="one-eight text-center"></div>
					<div class="one-eight text-center">
						<span>삭제</span>
					</div>
					<div class="one-eight text-left px-4"></div>
				</div>
				<c:forEach var="list" items="${list }">
					<div class="post-title" onclick="togglePostContent(${list.revId})">
						<div class="product-cart d-flex">
							<!-- 							<div class="one-eight text-center"> -->
							<!-- 								<div class="display-tc"></div> -->
							<!-- 							</div> -->
							<div class="one-eight text-center">
								<div class="display-tc">
									<img src="images/${list.revImage }" class="ordImg">
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.proName }</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 50px">
								<div class="display-tc"></div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.revRate }</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 50px">
								<div class="display-tc"></div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.revTitle }</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 70px">
								<div class="display-tc"></div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.revDate }</span>
								</div>
							</div>
							<div class="one-eight text-center" style="width: 50px">
								<div class="display-tc"></div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<button class="btn btn-danger delRevBtn" revId="${list.revId }">삭제</button>
								</div>
							</div>
						</div>
					</div>
					<div id=${list.revId } class="post-content" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.revContent }<hr></div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<div class="colorlib-product" id="table2" style="display: none;">
	<h2 style="text-align: center;">나의 QnA</h2>
	<div class="container">
		<button onclick="changeReview()">나의 후기</button>
		<button onclick="changeQa()">나의 QnA</button>
		<div class="row row-pb-lg">
			<div class="col-md-12">
				<div class="product-name d-flex">
					<div class="one-eight text-left px-4"></div>
					<div class="one-eight text-left px-4">
						<span>상품정보</span>
					</div>
					<div class="one-eight text-left px-4"></div>
					<div class="one-eight text-center">
						<span>제목</span>
					</div>
					<div class="one-eight text-left px-4"></div>
					<div class="one-eight text-center">
						<span>작성일</span>
					</div>
					<div class="one-eight text-right">
						<span>답변유무</span>
					</div>
					<div class="one-eight text-right">
						<span>삭제</span>
					</div>
				</div>
				<c:forEach var="list" items="${qalist }">
					<div class="post-title"
						onclick="togglePostContent('a${list.qaId}')">
						<div class="product-cart d-flex">
							<div class="one-eight text-center">
								<div class="display-tc">
									<img src="images/${list.proImg }" class="ordImg">
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.proName }</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc"></div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.qaTitle }</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc"></div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.qaDate }</span>
								</div>
							</div>
							<div class="one-eight text-right">
								<div class="display-tc">
									<c:if test="${list.qaReply != null}">
										<span class="price">답변 완료</span>
									</c:if>
									<c:if test="${list.qaReply == null}">
										<span class="price">답변 대기</span>
									</c:if>
								</div>
							</div>
							<div class="one-eight text-center" style="width:50px">
								<div class="display-tc">
								</div>
							</div>
							<div class="one-eight text-center" style="width:100px">
								<div class="display-tc">
									<button class="btn btn-danger delQaBtn" qaId="${list.qaId }">삭제</button>
								</div>
							</div>
						</div>
					</div>
					<div id="a${list.qaId}" class="post-content" style="display: none;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용&nbsp :&nbsp&nbsp
						${list.qaContent }
						<c:if test="${list.qaReply != null}">
							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;답변 :
								&nbsp&nbsp&nbsp${list.qaReply }</div>
						</c:if>
					<hr></div>
				</c:forEach>
				<p>
			</div>
		</div>
	</div>
</div>


<script>
	function changeQa() {
		var table1 = document.getElementById('table1');
		var table2 = document.getElementById('table2');
		table1.style.display = 'none';
		table2.style.display = 'block';
	}
	function changeReview() {
		var table1 = document.getElementById('table1');
		var table2 = document.getElementById('table2');
		table1.style.display = 'block';
		table2.style.display = 'none';
	}

	function togglePostContent(postContentId) {
		var postContent = document.getElementById(postContentId);
		if (postContent.style.display === 'none') {
			postContent.style.display = 'block';
		} else {
			postContent.style.display = 'none';
		}
	}
	
	$('button.delRevBtn').click(function() {
		if (!window.confirm("삭제하시겠습니까?")) {
		      return;
		    }
		let revId = $(this).attr('revId');
		$.ajax({
			url: "removeReviewManage.do",
			data : {revId : revId},
			success: function(result){
				
				if(result.retCode == "Success"){
					location.reload();
				} else {
					alert("오류");
				}
			},
			error: function(reject){
				console.log(reject);
			}
		})
	})
	
	$('button.delQaBtn').click(function(){
		if (!window.confirm("삭제하시겠습니까?")) {
		      return;
		    }
		
		let qaId = $(this).attr('qaId');
		$.ajax({
			url: "removeQa.do",
			data : {qaId : qaId},
			success: function(result){
				
				if(result.retCode == "Success"){
					location.reload();
				} else {
					alert("오류");
				}
			},
			error: function(reject){
				console.log(reject);
			}
		})
	})
		
</script>
