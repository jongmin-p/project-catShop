



function requestPay() {
	 
	//결제내용 확인 체크
	if (!document.querySelector('#paymentInfoCheck').checked) {
		alert("주문정보를 확인 해주세요.");
		return;
	}

	//총 결제 금액
	var totalPrice = document.querySelectorAll('.totalPrice')[1].textContent;
	//결제 상품 이름
	var name = "";
	var productName = document.querySelectorAll('.selectBox:checked')
	if (productName.length > 0) {
		name = productName[0].dataset.name + " 외 " + (productName.length - 1) + "개";

	} else {
		name = productName[0].dataset.name
	}
	//결제자 이메일
	var buyerEmail = document.querySelector('#bemail').value;
	//결제자 이름
	var buyerName = document.querySelector('#bname').value;
	//결제자 번호
	var buyerTel = document.querySelector('#bphone').value;
	//결제자 주소

	//결제자 ID
	var memId = document.querySelector('#memberId').dataset.id;
	console.log(memId);
	//수신자 이름
	var ordReciever = document.querySelector('#rname').value;
	if (!ordReciever) {
		alert("수신자 이름을 확인 해주세요.");
		return;
	}
	//수신자 연락처
	var ordPhone = document.querySelector('#rphone').value;
	if (!ordPhone) {
		alert("수신자 연락처를 확인 해주세요.");
		return;
	}
	//수신자 주소
	var reg = /[\{\}\[\]\/?.;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	var ordAddr = document.querySelector('#sample4_roadAddress').value + "/"
		+ document.querySelector('#sample4_extraAddress').value.replace(reg, "") + "/"
		+ document.querySelector('#sample4_detailAddress').value
	if (!document.querySelector('#sample4_detailAddress').value) {
		alert("주소를 확인 해주세요.");
		return;
	}

	//결제자 우편번호
	var ordPostcode = document.querySelector('#sample4_postcode').value;
	if (!ordPostcode) {
		alert("우편번호를 확인 해주세요.");
		return;
	}
	//쿠폰 id
	var coupId = document.querySelector('#payBtn').dataset.id;
	//쿠폰 가격
	var payCouponprice = document.querySelector('#payBtn').dataset.price;
	//할인전 가격
	var payTotalprice = document.querySelectorAll('.sumCartPrice')[0].textContent;
	console.log(payTotalprice)
	//결제코드
	var merchant_uid = 'chamsu_' + new Date().getTime();

	var selectedProducts = document.querySelectorAll('.selectBox:checked');
	console.log(selectedProducts);
	var proIds = [];
	var ordQuants = [];
	var ordProSumprices = [];
	var cartIds = [];

	for (var i = 0; i < selectedProducts.length; i++) {
		var selectedProduct = selectedProducts[i];
		var proId = selectedProduct.dataset.value;
		proIds.push(proId);
		var ordQuant = selectedProduct.closest('.product-cart').querySelector('.one-eight:nth-child(4) .quantity').value;
		ordQuants.push(ordQuant);
		var ordProSumprice = selectedProduct.closest('.product-cart').querySelector('.one-eight:nth-child(5) .price').textContent;
		ordProSumprices.push(ordProSumprice);
		var cartid = selectedProduct.dataset.cid;
		cartIds.push(cartid);
	}
	console.log(cartIds);

	var IMP = window.IMP; // 생략가능
	IMP.init('imp42753804'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	IMP.request_pay({
		pg: "html5_inicis.INIpayTest",
		pay_method: "card",
		merchant_uid: merchant_uid,
		name: name,	//수정부분
		amount: 100,		//수정부분
		buyer_email: buyerEmail,	//수정
		buyer_name: buyerName,			//수정
		buyer_tel: buyerTel	//수정
		//		    buyer_addr : '서울특별시 강남구 삼성동',	//수정
		//		    buyer_postcode : '123-456'		//수정
	}, function(rsp) { // callback
		console.log(rsp)
		if (rsp.success) {
			let msg = '결제가 완료되었습니다.';
			//주문정보 저장 -orders table
			$.post("addOrder.do", {
				memId: memId,
				ordReceiver: ordReciever,
				ordAddr: ordAddr,
				ordPhone: ordPhone,
				ordPostcode: ordPostcode,
				ordTotalPrice: totalPrice,
				coupId: coupId,
				payCouponprice: payCouponprice,
				payTotalprice: payTotalprice,
				payCode: merchant_uid,
				payUid: rsp.imp_uid
			}, function(result) {
				if (result.retCode == "Success") {
					console.log("주문테이블 등록 성공");

					// 두 번째 AJAX 요청 실행
					$.ajax({
						url: "addOrderProduct.do",
						type: "POST",
						traditional: true,
						data: {
							ordStatus: '결제완료',
							ordQuant: ordQuants,
							proId: proIds,
							ordProSumprice: ordProSumprices
						},
						success: function(result) {
							if (result.retCode == "Success") {
								console.log("주문상품 정보 등록 성공");
							} else {
								console.log("주문상품 정보 등록 실패");
							}
						},
						error: function(error) {
							console.log("실패");
						}
					});
				
					$.ajax({
						url: 'removeCart.do',
						method: 'post',
						traditional: true,
						data: {cartIds : cartIds},
						success: function(result) {
							if (result.retCode == "Success") {
								console.log('목록에서 삭제를 성공했습니다.');
	
							} else {
								console.log('목록 등록에 실패했습니다.');
								
							}
						},
						error: function(err) {
							console.log(err);
						}
					});
				
				} else {
					console.log("주문테이블 등록 실패");
				}
			});
			

			alert(msg);
			location.href = "orderList.do"
		} else {
			let msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
	});
}	