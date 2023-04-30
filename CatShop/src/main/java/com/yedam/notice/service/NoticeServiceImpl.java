package com.yedam.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.notice.mapper.NoticeMapper;
import com.yedam.notice.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService{
	SqlSession session = DataSource.getInstance().openSession(true);
	NoticeMapper mapper = session.getMapper(NoticeMapper.class);

	@Override 
	public List<NoticeVO> noticeList() { 
		return mapper.noticeList();
	}

	@Override
	public int addNotice(NoticeVO notice) {
		return mapper.insertNotice(notice);
		
	}

	@Override
	public NoticeVO getNotice(int notId) {
		// TODO Auto-generated method stub
		return mapper.selectNotice(notId);
	}

	@Override
	public int deleteNotice(int notId) {
		return mapper.deleteNotice(notId);
		
	}

	@Override
	public int updateNotice(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return mapper.updateNotice(nvo);
	}
}
