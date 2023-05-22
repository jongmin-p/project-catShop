package com.yedam.member.service;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.member.vo.MemberVO;

public interface MemberService {

	public MemberVO login(MemberVO member);
	public int addMember(MemberVO member);
	public List<MemberVO> selectCoupon(String memId);
	public List<MemberVO> memberList();
	public int removeMember(String mid);
	public int modifyMember(MemberVO member);
	public MemberVO findId(String name, String email);
	public MemberVO findPwd(String name, String email, String id);
	void setTempPwd(MemberVO fPwd);
	public int checkId(String id);
	public MemberVO memInfo(String memId);
	public MemberVO searchMember(String memId);
	public int addCoupon(MemberVO coupvo);
	public List<MemberVO> memberListPage(Pagination paging);
}