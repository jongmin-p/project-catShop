package com.yedam.product.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int proId;
	private String proName;
	private int proPrice;
	private String proDesc;
	private String proCategory;
	private String proImg;
	private int cartId;
	private String memId;
	private int caQuant;
	private int caSumprice;

	// review table
	private int revId;
	private String revTitle;
	private String revContent;
	private String revDate;
	private int revRate;
	private String revImage;
	private String revReply;
	private double avgRate;
	
	//페이징
	private int startNum;
	private int endNum; 
}
