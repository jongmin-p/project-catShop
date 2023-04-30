package com.yedam.qa.mapper;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.member.vo.MemberVO;
import com.yedam.qa.vo.QaVO;


public interface QaMapper {
	public List<QaVO> getList(int proId); // 제품 상세페이지 Q&A 목록 출력
	public int insertProductQa(QaVO qa); // Q&A 등록
	public List<QaVO> getListAll();		// jm 추가
	public int deleteQa(int qaId);
	public int updateQa(QaVO qa);
	public List<QaVO> selectQaListAllPage(Pagination paging);
	public List<QaVO> searchSpecificQa(String proId);
}
