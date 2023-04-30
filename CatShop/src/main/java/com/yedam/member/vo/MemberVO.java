package com.yedam.member.vo;

import lombok.Data;

@Data // lombok을 활용해서 getter , setter, toString, hashCode 등의 메소드들을 불러옴
public class MemberVO {

	private String memId;
	private String memPw;
	private String memName;
	private String memPhone;
	private String memEmail;
	private String memUser;
	//coupon table
	private int coupId;
	private String coupName;
	private int coupPrice;
	private String coupInfo;
	private String coupExpired;
	private String payId;
	
	//페이징
	private int startNum;
	private int endNum; 
	

}