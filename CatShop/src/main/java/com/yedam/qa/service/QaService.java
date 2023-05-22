package com.yedam.qa.service;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.member.vo.MemberVO;
import com.yedam.qa.vo.QaVO;

public interface QaService {
	public List<QaVO> qaList(int proId);
	public int addProductQa(QaVO qa);
	
	public List<QaVO> qaListAll();
	public int removeQa(int qaId);
	public int modifyQa(QaVO vo);
	public List<QaVO> qaListAllPage(Pagination paging);
	public List<QaVO> searchQa(String proId);
}