package com.yedam.mypage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mypage.mapper.MyNoticeMapper;
import com.yedam.mypage.vo.MyNoticeVO;

public class MyNoticeServiceImpl implements MyNoticeService{
	SqlSession session = DataSource.getInstance().openSession(true);
	MyNoticeMapper mapper = session.getMapper(MyNoticeMapper.class);
	@Override
	public List<MyNoticeVO> myReview(String memId) {
		// TODO Auto-generated method stub
		return mapper.myReview(memId);
	}
	@Override
	public List<MyNoticeVO> myQa(String memId) {
		// TODO Auto-generated method stub
		return mapper.myQa(memId);
	}
	
	
	

}
