package com.yedam.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private int ordId;
	private String memId;
	private String ordReceiver;
	private String ordAddr;
	private String ordPhone;
	private int ordTotalprice;
	private String ordPostcode;
	// orderproduct table
	private int ordProId;
	private int ordQuant;
	private int proId;
	private int ordProSumprice;
	private String ordStatus;
	//payment
	private int payId;
	private String payDate;
	private int payTotalprice;
	private int payCouponprice;
	private String payCode;
	private int coupId;
	private String payUid;
	
	private String memName;
	private String proName;
	//검색조건

	//주문내역용 product table,payment table
	private String proImg;
	private int proPrice;

	//페이징
	private int startNum;
	private int endNum; 
	
}
