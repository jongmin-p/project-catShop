package com.yedam.mypage.mapper;

import java.util.List;

import com.yedam.mypage.vo.MyNoticeVO;

public interface MyNoticeMapper {
	public List<MyNoticeVO> myReview(String memId);

	public List<MyNoticeVO> myQa(String memId);
}
