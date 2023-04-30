package com.yedam.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.common.Pagination;
import com.yedam.member.mapper.MemberMapper;
import com.yedam.member.vo.MemberVO;

public class MemberServiceMybatis implements MemberService {

	SqlSession session = DataSource.getInstance().openSession(true); // 자동커밋

	// session.getMapper(인터페이스타입.class); 를 통해 메소드를 호출할수있다
	MemberMapper mapper = session.getMapper(MemberMapper.class);

	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}

	@Override
	public int addMember(MemberVO member) {
		
		return mapper.addMember(member);
	}

	@Override
	public List<MemberVO> selectCoupon(String memId) {
		return mapper.couponSelect(memId);
	}


	@Override
	public List<MemberVO> memberList() {
		return mapper.memberList();
	}
	
	@Override
	public int removeMember(String mid) {
		return mapper.deleteMember(mid);
	}

	@Override
	public int modifyMember(MemberVO member) {
		return mapper.updateMember(member);

	}

	@Override
	public MemberVO findId(String memName, String memEmail) {
		return mapper.getFindId(memName, memEmail);
	}

	@Override
	public MemberVO findPwd(String memName, String memEmail, String memId) {
		return mapper.getFindPwd(memName, memEmail, memId);
	}

	@Override
	public void setTempPwd(MemberVO fPwd) {
		mapper.setTempPwd(fPwd);
	}

	//
	@Override
	public int checkId(String id) {
		return mapper.checkId(id);
	}

	@Override
	public MemberVO memInfo(String memId) {
		// TODO Auto-generated method stub
		return mapper.memInfo(memId);
	}

	@Override
	public MemberVO searchMember(String memId) {
		return mapper.searchSpecificMember(memId);
	}

	@Override

	public int addCoupon(MemberVO coupvo) {
		return mapper.insertCoupon(coupvo);
  }
  @Override
	public List<MemberVO> memberListPage(Pagination paging) {
		return mapper.selectMemberListPage(paging);

	}
}