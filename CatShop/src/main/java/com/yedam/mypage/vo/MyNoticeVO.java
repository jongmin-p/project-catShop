package com.yedam.mypage.vo;

import lombok.Data;

@Data
public class MyNoticeVO {
	//review table
	private int revId;
	private String memId;
	private int proId;
	private String revTitle;
	private String revContent;
	private String revDate;
	private int revRate;
	private String revImage;
	private String revReply;
	//qa table
	private int qaId;
	private String qaTitle;
	private String qaDate;
	private String qaReply;
	private String qaContent;
	//join용 product table
	private String proName;
	private String proImg;
	
}
