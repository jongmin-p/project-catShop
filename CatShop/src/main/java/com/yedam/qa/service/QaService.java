package com.yedam.qa.service;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.member.vo.MemberVO;
import com.yedam.qa.vo.QaVO;

public interface QaService {
	public List<QaVO> qaList(int proId); // 제품 상세페이지 Q&A 목록 출력
	public int addProductQa(QaVO qa); // Q&A 등록
	
	public List<QaVO> qaListAll();		// jm 추가
	public int removeQa(int qaId);
	public int modifyQa(QaVO vo);
	public List<QaVO> qaListAllPage(Pagination paging);
	public List<QaVO> searchQa(String proId);
}
