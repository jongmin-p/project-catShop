package com.yedam.mypage.service;

import java.util.List;

import com.yedam.mypage.vo.MyNoticeVO;

public interface MyNoticeService {

	public List<MyNoticeVO> myReview(String memId);

	public List<MyNoticeVO> myQa(String memId);

}
