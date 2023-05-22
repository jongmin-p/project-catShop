package com.yedam.qa.mapper;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.member.vo.MemberVO;
import com.yedam.qa.vo.QaVO;


public interface QaMapper {
	public List<QaVO> getList(int proId);
	public int insertProductQa(QaVO qa);
	public List<QaVO> getListAll();
	public int deleteQa(int qaId);
	public int updateQa(QaVO qa);
	public List<QaVO> selectQaListAllPage(Pagination paging);
	public List<QaVO> searchSpecificQa(String proId);
}