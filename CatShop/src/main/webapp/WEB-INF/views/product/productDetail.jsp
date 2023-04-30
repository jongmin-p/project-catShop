<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

    <!------리뷰 부트스트랩--------->
    <!--====== Favicon Icon ======-->
    <link rel="shortcut icon" href="bootstrap1/assets/images/favicon.png" type="image/png">

    <!--====== Slick CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/slick.css">

    <!--====== Line Icons CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/LineIcons.css">

    <!--====== Material Design Icons CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/materialdesignicons.min.css">

    <!--====== Jquery Ui CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/jquery-ui.min.css">

    <!--====== nice select CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/nice-select.css">

    <!--====== Bootstrap CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/bootstrap.min.css">

    <!--====== Default CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/default.css">

    <!--====== Style CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/style.css">

<style>
	img.reviewImg {
	  	max-width: 100%;
    	max-height: 100%;
	}
	h4.title{
		margin-left:20px;
	}
	h3.QA{
		margin-bottom:30px;
	}
</style>
<section class="section" id="product">

	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="left-images">
					<img src="images/${proDetail.proImg }" alt="" />
				</div>
			</div>
			<div class="col-lg-4">
				<div class="right-content">
					<h4>${proDetail.proName }</h4>
					<span class="price">${proDetail.proPrice } 원</span>
					<ul class="stars">
						<li><i class="fa fa-star"></i></li>
						<li><i class="fa fa-star"></i></li>
						<li><i class="fa fa-star"></i></li>
						<li><i class="fa fa-star"></i></li>
						<li><i class="fa fa-star"></i></li>
					</ul>
					<span>${proDetail.proDesc }</span>
					<div class="quote">
						<i class="fa fa-quote-left"></i>
						<p>${proDetail.proDesc }</p>
					</div>
					<div class="quantity-content">
						<div class="left-content">
							<h6>No. of Orders</h6>
						</div>
						<div class="right-content">
							<div class="quantity buttons_added">
								<input type="button" value="-" class="minus" /><input
									id="productCount" type="number" step="1" min="0" max=""
									name="quantity" value="1" title="Qty"
									class="input-text qty text" size="4" pattern="" inputmode=""
									readonly /><input type="button" value="+" class="plus" />
							</div>
						</div>
					</div>
					<div class="total">
						<h4>Total: ${proDetail.proPrice }</h4><h4 style="margin-left:5px">원</h4>
						<div class="main-border-button">
							<c:choose>
								<c:when test="${zzimUser.proId eq proDetail.proId}">
									<!-- 										<a id="zzim" class="selected" style="cursor: pointer;">찜 -->
									<!-- 											취소</a> -->
									<a id="zzim" class="selected" style="cursor: pointer;"> <i
										class="fa fa-heart text-danger"></i>
									</a>
								</c:when>
								<c:otherwise>
									<!-- 										<a id="zzim" class="" style="cursor: pointer;">찜 하기</a> -->
									<a id="zzim" class="" style="cursor: pointer;"><i
										class="fa fa-heart"></i></a>
								</c:otherwise>
							</c:choose>
							<a id="cart" style="cursor: pointer;">장바구니</a>
						</div>
						<br />
						<div class="main-border-button"></div>
					</div>
					<div></div>
				</div>
			</div>
		</div>
		<!--====== Reviews Part Start ======-->
			<section class="reviews-wrapper pt-100 pb-50 ">
				<h4 class="title">Product Reviews</h4>
				
				<div class="container">
					<c:forEach var="review" items="${reviewList }">
						<div class="reviews-style">
							<div class="tab-pane fade show active" id="profile"
								role="tabpanel" aria-labelledby="profile-tab">
								<div class="review-wrapper">
									<div class="reviews-title">
										
										<input class="revId" type="text" value="${review.revId }" style="display:none;">
									</div>
									<div class="reviews-rating-wrapper flex-wrap">
										<div class="reviews-rating-star">
											<img class = "reviewImg" src="images/${review.revImage }" alt="" />
										</div>
										<div class="reviews-rating-form">
											<div class="rating-star">
												<h4>${review.memId }</h4><p>${review.revDate }</p>
												<c:choose>
													<c:when test="${review.revRate eq 1}">
														<ul id="stars" class="stars">
				                                            <li class="star selected" data-value='1'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='2'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='3'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='4'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='5'><i class="mdi mdi-star"></i></li>
		                                        		</ul>
													</c:when>
													<c:when test="${review.revRate eq 2}">
														<ul id="stars" class="stars">
				                                            <li class="star selected" data-value='1'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='2'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='3'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='4'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='5'><i class="mdi mdi-star"></i></li>
		                                        		</ul>
													</c:when>
													<c:when test="${review.revRate eq 3}">
														<ul id="stars" class="stars">
				                                            <li class="star selected" data-value='1'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='2'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='3'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='4'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='5'><i class="mdi mdi-star"></i></li>
		                                        		</ul>
													</c:when>
													<c:when test="${review.revRate eq 4}">
														<ul id="stars" class="stars">
				                                            <li class="star selected" data-value='1'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='2'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='3'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='4'><i class="mdi mdi-star"></i></li>
				                                            <li class="star" data-value='5'><i class="mdi mdi-star"></i></li>
		                                        		</ul>
													</c:when>
													<c:when test="${review.revRate eq 5}">
														<ul id="stars" class="stars">
				                                            <li class="star selected" data-value='1'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='2'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='3'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='4'><i class="mdi mdi-star"></i></li>
				                                            <li class="star selected" data-value='5'><i class="mdi mdi-star"></i></li>
		                                        		</ul>
													</c:when>
												</c:choose>
											</div>
											<div class="rating-form">
												<form action="#">
													<div class="single-form form-default">
														<label>Comment</label>
														<div class="form-input">
															<textarea readonly>${review.revContent }</textarea>
															<i class="mdi mdi-message-text-outline"></i>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
									<c:if test="${!empty review.revReply }">
										<div class="reviews-comment">
											<ul class="comment-items">
												<li>
													<div class="single-review-comment">
														<div class="comment-user-info">
															<div class="comment-content">
																<h6 class="name" style="color:red;font-weight: bolder;">
																<img src="bootstrap1/assets/images/icon-svg/person-square.svg" alt="" style="width:30px; margin-right:10px;">관리자</h6>
																<p>
																	<span class=""></span>
																</p>
															</div>
														</div>
														<div class="comment-user-text">
															<p>${review.revReply }</p>
														</div>
														<div id="list">
														
														</div>
													</div>
												</li>
											</ul>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
		<!--====== Reviews Part Ends ======-->
		<div class="productDetailQnA">
			<h3 class="QA">Q&A</h3>
			<table class="productDetailQnA">
				<thead class="productDetailQnA">
					<tr class="productDetailQnA">
						<th class="productDetailQnA">QA_ID</th>
						<th class="productDetailQnA">작성자</th>
						<th class="productDetailQnA">제품</th>
						<th class="productDetailQnA">제목</th>
						<th class="productDetailQnA">작성일자</th>

					</tr>
				</thead>
				<tbody class="productDetailQnA">
					<c:forEach var="qa" items="${qaList }">
							<tr class="productDetailQnA tog">
								<td class="productDetailQnA">${qa.qaId }</td>
								<td class="productDetailQnA">${qa.memId }</td>
								<td class="productDetailQnA">${qa.proId }</td>
								<c:choose>
									<c:when test="${qa.memId eq logId}">
										<td class="productDetailQnA">${qa.qaTitle }</td>
									</c:when>
									<c:otherwise>
										<td class="productDetailQnA">비밀글입니다.</td>
									</c:otherwise>
								</c:choose>
								<td class="productDetailQnA">${qa.qaDate }</td>
							</tr>
							<tr class="productDetailQnA" style="display:none;"> 
								<td class="productDetailQnA">내용 : </td>
								<c:choose>
									<c:when test="${qa.memId eq logId}">
										<td class="productDetailQnA" colspan='4'>${qa.qaContent }</td>
									</c:when>
									<c:otherwise>
										<td class="productDetailQnA" colspan='4'>비밀글입니다.</td>
									</c:otherwise>
								</c:choose>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<c:if test="${!empty logId}">
				<button class="btn btn-primary" onclick="window.open('productQaPage.do?pid=${proDetail.proId }','window_name','width=800,height=600,location=no,status=no,scrollbars=yes');">등록</button>
			</c:if>
		</div>
	</div>

</section>
<!-- ***** Product Area Ends ***** -->

<script>
// 	let revId = $(".revId");
// 	revId.each(function(index, item){
// 			console.log(item.value);
// 			fetch("replyList.do?revId=" + item.value)
// 			  .then((resolve) => resolve.json())
// 			  .then((result) => {
// 				  console.log(result);
// 				  result.forEach((reply) => {
// 				    	makeReply(reply);
// 				       });
// 			  })
// 			  .catch((error) => {
// 				  console.log(error);
// 			  })
			
// 		});

// 	let revId = $(".revId");
// 	async function fetchReplyList(revId) {
// 	  try {
// 	    const response = await fetch("replyList.do?revId=" + revId);
// 	    const result = await response.json();
// 	    console.log(result);
// 	    result.forEach((reply) => {
// 	    	makeReply(reply);
// 	       });
// 	  } catch (error) {
// 	    console.log(error);
// 	  }
// 	}
	
// 	async function fetchAll() {
// 	  for (let i = 0; i < revId.length; i++) {
// 	    const item = revId[i];
// 	    await fetchReplyList(item.value);
// 	  }
// 	}
	
// 	fetchAll();

   let plus = document.querySelectorAll(".plus")[0];
   let minus = document.querySelectorAll(".minus")[0];
   let productCount = document.querySelector("#productCount");
   let total = document.querySelectorAll(".total")[0].children[0];
   let proId = ${proDetail.proId };

   plus.addEventListener("click", function () {
     let productCountValue = parseInt(productCount.value) + 1;
     let result = productCountValue * ${proDetail.proPrice };
     total.innerText = "Total: " + result;
   });

   minus.addEventListener("click", function () {
     let productCountValue = parseInt(productCount.value) - 1;
     let result = productCountValue * ${proDetail.proPrice };
     if (result >= 0) {
       total.innerText = "Total: " + result;
     }
   });
   
   $('#cart').click(function() {
	   if("${logId}" == ""){
		   let logpopup = confirm("로그인 해주세요")
		   if(logpopup){
			   location.href = "loginForm.do";
		   }
		   return;
	   }
	   
	   let productCountValue = parseInt(productCount.value);
	   let result = productCountValue * ${proDetail.proPrice };
	   let proId = ${proDetail.proId };
	   
	   $.ajax({
		   url: "productCartAdd.do",
		   method: "post",
		   data: {memId: "${logId}", proId: proId, caQuant: productCountValue, caSumprice: result},
		   success: function(result){
			   console.log(result);
			   if (result.retCode == "Success") {
			   	   let popup = confirm("장바구니에 제품이 담겼습니다.");
				   if(popup){
					   location.href='cart.do';
				   }
			   } else {
				   alert("오류");
			   }
		   },
		   error: function(reject){
			   console.log(reject);
			   alert("오류");
		   },
	   });
   })
   
   $('#zzim').click(function(){
	   if("${logId}" == ""){
		   let logpopup = confirm("로그인 해주세요")
		   if(logpopup){
			   location.href = "loginForm.do";
		   }
		   return;
	   }
	   
	   
	   if ($(this).hasClass('selected')) {
		   $.ajax({
	 		   url: "productZzimDel.do",
	 		   method: "post",
	 		   data: {memId: "${logId}", proId: proId},
	 		   success: function(result){
	 			   console.log(result);
	 			   if (result.retCode == "Success") {
	 				   $('#zzim').removeClass('selected');
	 				   $('#zzim').children(0).remove();
// 	 				   let i = $("<i>").attr("class", "fa.fa-star text-danger")
	 				   $("#zzim").append("<i class='fa fa-heart'></i>");
	 			   	   alert("찜이 취소되었습니다.");
	 			   } else {
	 				   alert("오류");
	 			   }
	 		   },
	 		   error: function(reject){
	 			   console.log(reject);
	 			   alert("오류");
	 		   },
	 	   });
		   
	   } else {
		   $.ajax({
	 		   url: "productZzimAdd.do",
	 		   method: "post",
	 		   data: {memId: "${logId}", proId: proId},
	 		   success: function(result){
	 			   console.log(result);
	 			   if (result.retCode == "Success") {
	 				   $('#zzim').addClass('selected');
	 				   $('#zzim').children(0).remove();
	 				   $("#zzim").append("<i class='fa fa-heart text-danger'></i>");
	 			   	   let popup = confirm("찜이 되었습니다.");
	 				   if(popup){
	 					  location.href='zzimList.do';
	 				   }
	 			   } else {
	 				   alert("오류");
	 			   }
	 		   },
	 		   error: function(reject){
	 			   console.log(reject);
	 			   alert("오류");
	 		   },
	 	   });
	   }
   })
   
   function makeReply(reply) {
	   let tr1 = $("<tr />")
       .attr("data-id", reply.replyId)
       .append(
         $("<td />").html("<b>번호:</b> " + reply.replyId),
         $("<td />").html("<b>제목:</b>  " + reply.replyTitle),
         $("<td />").html("<b>작성자:</b>  " + reply.replyWriter),
         $("<td />").html("<b>날짜:</b>  " + reply.replyDate)
       );
	   
	   $("#list").prepend(tr1);
   }
   
   $(".tog").on("click", function(e) {
	   let $contentRow = $(this).next();
	   if ($contentRow.css("display") === "none") {
	     $contentRow.css("display", "");
	   } else {
	     $contentRow.css("display", "none");
	   }
	});
</script>
