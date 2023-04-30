package com.yedam.notice.service;

import java.util.List;

import com.yedam.notice.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> noticeList(); //공지사항 리스트 조회

	public int addNotice(NoticeVO notice); //공지사항 추가

	public NoticeVO getNotice(int notId);

	public int deleteNotice(int notId);

	public int updateNotice(NoticeVO nvo);

	
}
