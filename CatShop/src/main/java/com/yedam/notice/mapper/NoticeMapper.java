package com.yedam.notice.mapper;

import java.util.List;

import com.yedam.notice.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> noticeList(); //공지사항 전체 리스트불러오기

	public int insertNotice(NoticeVO notice); //공지사항 글 등록

	public NoticeVO selectNotice(int notId); //공지사항 단건조회

	public int deleteNotice(int notId); //공지 삭제
	
	public int updateNotice(NoticeVO nvo); //공지 수정

}
