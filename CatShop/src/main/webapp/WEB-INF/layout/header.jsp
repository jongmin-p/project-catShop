x<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js">
</script>
<script type="text/javascript" src=js/main.js></script>
<!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="main.do" class="logo">
                        <img src="images/흰배경 로고.png" style="width:100px; height:75px;">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="main.do" class="active">Home</a></li>
                            <li class="scroll-to-section"><a href="noticeList.do">공지사항</a></li>
                            <li class="submenu">
                                <a href="javascript:;">고양이 상품</a>
                                <ul>
                                    <li><a href="searchProduct.do?menu=식품">식품</a></li>
                                    <li><a href="searchProduct.do?menu=위생용품">위생용품</a></li>
                                    <li><a href="searchProduct.do?menu=목욕용품">목욕용품</a></li>
                                    <li><a href="searchProduct.do?menu=장난감">장난감</a></li>
                                    <li><a href="searchProduct.do?menu=가구">가구</a></li>
                                    <li><a href="searchProduct.do?menu=기타">기타</a></li>
                                </ul>
                            </li>                            
                            <li class="submenu">
                            <c:choose>
                            	<c:when test="${Auth == 'admin' }">
                                	<a href="adminMain.do">관리자메뉴</a>
                                </c:when>
	                            <c:when test="${!empty logId}">
                                	<a href="#">마이페이지</a>
	                                <ul>
	                                    <li><a href="orderList.do">주문내역</a></li>
	                                    <li><a href="zzimList.do">찜한상품</a></li>
	                                    <li><a href="myNoticeList.do">내게시글</a></li>
	                                    <li><a href="updateInfoForm.do">정보수정</a></li>
	                                </ul>
                                </c:when>
                                
								<c:otherwise>
									<a href="">마이페이지</a>
		                                <ul>
		                                    <li><a href="loginForm.do">주문내역</a></li>
		                                    <li><a href="loginForm.do">찜한상품</a></li>
		                                    <li><a href="loginForm.do">내게시글</a></li>
		                                    <li><a href="loginForm.do">정보수정</a></li>
		                                </ul>
                                </c:otherwise>
	                        </c:choose>
                            </li>
                            <c:choose>
	                            <c:when test="${!empty logId}">
	                            	<li class="scroll-to-section"><a href="cart.do">장바구니</a></li>
	                            </c:when>
								<c:otherwise>
	                                <li class="scroll-to-section"><a href="loginForm.do">장바구니</a></li>
	                            </c:otherwise>
	                            </c:choose>
                            <c:choose>
                                	<c:when test="${!empty logId}">
		                                <li class="scroll-to-section"><a href="logOut.do">로그아웃</a></li>
                                	</c:when>
                                	<c:otherwise>
		                                <li class="scroll-to-section"><a href="loginForm.do">로그인</a></li>
                                	</c:otherwise>
                             </c:choose>
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
    
    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
        <div class="container-fluid">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="height: 410px; width: 100%;">
                            <img class="img-fluid" src="images/고양이로고4.jpg" alt="Image" style="width: 100%;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h3 class="text-light text-uppercase font-weight-medium mb-3">지금 상품 구매시</h3>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">배송비 무료</h3>
                                    <a href="#" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;  width: 100%;">
                            <img class="img-fluid" src="images/고양이로고3.png" alt="Image" style="width: 100%;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h3 class="text-light text-uppercase font-weight-medium mb-3">지금 회원 가입시 전원</h3>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">5000원 쿠폰 지급</h3>
                                    <a href="#" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n2"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n2"></span>
                        </div>
                    </a>
                </div>
<!--             <div class="row"> -->
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="left-content"> -->
<!--                         <div class="thumb"> -->

<!--                             <img src="bootstrap/assets/images/cat.jpg" alt=""> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--             </div> -->
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->