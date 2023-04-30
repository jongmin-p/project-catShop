package com.yedam.qa.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.common.Pagination;
import com.yedam.member.vo.MemberVO;
import com.yedam.qa.mapper.QaMapper;
import com.yedam.qa.vo.QaVO;

public class QaServiceImpl implements QaService{
	SqlSession session = DataSource.getInstance().openSession(true);
	QaMapper mapper = session.getMapper(QaMapper.class);
	
	@Override
	public List<QaVO> qaList(int proId) {
		return mapper.getList(proId);
	}

	@Override
	public int addProductQa(QaVO qa) {
		return mapper.insertProductQa(qa);
	}

	// jm 추가
	@Override
	public List<QaVO> qaListAll() {
		return mapper.getListAll();
	}

	@Override
	public int removeQa(int qaId) {
		return mapper.deleteQa(qaId);
	}

	@Override
	public int modifyQa(QaVO qa) {
		return mapper.updateQa(qa);
	}

	@Override
	public List<QaVO> qaListAllPage(Pagination paging) {
		return mapper.selectQaListAllPage(paging);
	}

	@Override
	public List<QaVO> searchQa(String proId) {
		return mapper.searchSpecificQa(proId);
	}
}
