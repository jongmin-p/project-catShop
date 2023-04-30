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
</style>
<div class="colorlib-product" id="table1" style="display: block;">
	<h2 style="text-align: center;">나의 관심상품</h2>
	<div class="container">
		<div class="row row-pb-lg">
			<div class="col-md-12">
				<div class="product-name d-flex">
					<div class="one-eight text-center"></div>
					<div class="one-eight text-left">
						<input id="allcheck" type="checkbox">
					</div>
					<div class="one-eight text-left">
						<span>상품번호</span>
					</div>
					<div class="one-eight text-center">
						<span>상품정보</span>
					</div>
					<div class="one-eight text-center"></div>
					<div class="one-eight text-right">
						<span>금액</span>
					</div>
					<div class="one-eight text-center"></div>
					<div class="one-eight text-left">
						<button class="btn btn-danger" onclick="AllConfirm()">선택삭제</button>
					</div>
				</div>
				<c:forEach var="list" items="${list }">
					<div class="product-cart d-flex" id="a${list.zzimId }">
						<div class="one-eight text-center"></div>
						<div class="one-eight text-left">
							<div class="display-tc">
								<input class="selectBox" type="checkbox" data-value="44"
									data-price="44" data-name="44" name="cbox"> <input
									type="hidden" value="${list.zzimId }">
							</div>
						</div>
						<div class="one-eight text-left">
							<div class="display-tc">
								<span class="price">${list.proId }</span>
							</div>
						</div>
						<div class="one-eight text-center">
							<div class="display-tc">
								<a href="productDetail.do?pid=${list.proId }"><img src="images/${list.proImg }" class="ordImg"></a>
							</div>

						</div>
						<div class="one-eight text-center">
							<div class="display-tc">
								<a href="productDetail.do?pid=${list.proId }" class="price">${list.proName }</a>
							</div>
						</div>
						<div class="one-eight text-right">
							<div class="display-tc">
								<span class="price">${list.proPrice }</span>
							</div>
						</div>
						<div class="one-eight text-left">
							<div class="display-tc"></div>
						</div>
						<div class="one-eight text-left">
							<div class="display-tc">
								<span class="price"><button class="btn btn-danger"
										onclick="delConfirm('a${list.zzimId }')">삭제</button></span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>




<script>
const allCheck = document.getElementById('allcheck');

//전체체크
allCheck.addEventListener('click', () => {
  const checkboxes = document.querySelectorAll('.selectBox');
  for (let i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = allCheck.checked;
  }
});


const checkboxes = document.querySelectorAll('.selectBox');

//하나라도 체크안되면 전체체크 취소
for (let i = 0; i < checkboxes.length; i++) {
  checkboxes[i].addEventListener('click', () => {
    let checkedCount = 0;
    for (let j = 0; j < checkboxes.length; j++) {
      if (checkboxes[j].checked) {
        checkedCount++;
      }
    }
    allCheck.checked = (checkedCount === checkboxes.length);
  });
}

//선택 삭제
function delAllZzim() {
var chks = document.getElementsByName("cbox");
var chkst = [];
for (let i = 0; i < chks.length; i++) {
  if (chks[i].checked == true) {
    chkst.push(document.getElementsByName("cbox")[i].closest("div").children[1].value); //상품번호를 배열에 넣기
  }
}
//chkst에 zzimId 잘 담김
$.ajax({
  url: "zzimDelete.do",
  type: "post",
  traditional: true, // ajax 배열 넘기기 옵션!
  data: { arrStr: chkst },
  dataType: "json",
  success: function (result) {
	  for(let j = 0; j < chks.length; j++){
		  if (chks[j].checked == true) {
			  $(chks[j].closest("tr")).remove();
		  }
	  }
  },
  error: function (reject) {
	  location.reload();
  },
});
}

//단건삭제 id가 숫자면 자바스크립트에서 오류나서 a붙였음

function delZzim(zzimId) {
	  // 삭제 버튼이 속한 div 태그 선택
	  let btn = event.currentTarget;
	  const cartItem = btn.closest("#"+zzimId);
	  // 선택된 div 태그 내의 체크박스 선택
	  const checkbox = cartItem.querySelector('input[type="checkbox"]');
	  // 체크박스 선택
	  checkbox.checked = true;
	  delAllZzim();
	}
//삭제시 확인질문
function AllConfirm(){
	if (confirm("삭제 하시겠습니까?")) {
		  // 확인 버튼을 클릭한 경우 실행될 코드
		  delAllZzim();
		} else {
		  // 취소 버튼을 클릭한 경우 실행될 코드
		  return;
		}
}

function delConfirm(zzimId){
	if (confirm("삭제 하시겠습니까?")) {
		  delZzim(zzimId);
		} else {
		  return;
		}
}
</script>