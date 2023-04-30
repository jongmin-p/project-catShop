<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js">
</script> 
<style>
	input:-ms-input-placeholder {
		color : #a8a8a8;
	}
	#searchBtn {
		width:50px;
		height:100%;
		border : 0px;
		background: #1b5ac2;
		outline:none;
		float: right;
		color:#ffffff
	}
	#searchBox {
	 height:40px;
	 width:400px;
	 border : 1px solid #1b5ac2;
	 background: #ffffff;
	}
	#searchInput {
		font-size: 16px;
		width: 325px;
		height:100%;
		padding : 10px;
		border:0px;
		outline:none;
		float: left;
	}
</style>

<c:if test = "${empty list }">
 <h3 style="text-align:center; margin-top:10%;">검색결과 없음</h3>
</c:if>
 
<section class="py-5">
<form action="searchProduct.do" style="float:right; margin-right: 17%">
	<div id="searchBox" style="">
		<input id="searchInput" type="text" name="search" placeholder="검색어 입력">
		<button id="searchBtn" type="submit">검색</button>
	</div>
</form>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-5 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach var="list" items="${list }">
                    <div class="col mb-5 colbox">
                        <div class="card h-100">
                            <!-- Sale badge-->
<!--                             <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem"></div> -->
                            <!-- Product image-->
                            <a href="productDetail.do?pid=${list.proId }"><img class="card-img-top" src="images/${list.proImg }" alt="..." class="img"/></a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${list.proName }</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    
                                    ${list.proPrice }원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a data-id="${list.proId}" data-price="${list.proPrice }" class="btn btn-outline-dark mt-auto">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
        </section>
        
        <script>
     // 장바구니 담기 기능
        $('.btn.btn-outline-dark.mt-auto').on('click', function() {
        	if(!'${logId}') {
        		alert("회원 전용 기능입니다.")
        		return;
        	}
        	
        	var proId = $(this).attr('data-id');
        	var caSumprice = $(this).attr('data-price');
        	
        	$.ajax({
        		url: 'productCartAdd.do',
        		method: 'post',
        		data: {memId :'${logId}', proId : proId, caQuant:1, caSumprice: caSumprice},
        		success: function(result) {
        			if (result.retCode == "Success") {
        				alert('장바구니 등록에 성공했습니다.');
        			} else if (result.retCode == "NoMember") {
        				var result = confirm('로그인이 필요한 기능입니다.\n확인을 누르면 로그인 페이지로 이동합니다.');

        		        if(result) {
        		            location.replace('loginForm.do');
        		        } else {
        		        }
        			} else {
        				alert('장바구니 등록에 실패했습니다.');
        				
        			}
        		},
        		error: function(err) {
        			console.log(err);
        		}
        	});
        });
        </script>