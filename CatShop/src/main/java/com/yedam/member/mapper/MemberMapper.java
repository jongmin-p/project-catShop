package com.yedam.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.common.Pagination;
import com.yedam.member.vo.MemberVO;

public interface MemberMapper {


	public MemberVO login(MemberVO member);
	public int addMember(MemberVO member);
	public List<MemberVO> couponSelect(String memId);
	public List<MemberVO> memberList();
	public int deleteMember(String mid);
	public int updateMember(MemberVO member);
	public MemberVO getFindId(@Param("memName")String memName, @Param("memEmail")String memEmail);
	public MemberVO getFindPwd(@Param("memName")String memName, @Param("memEmail")String memEmail, @Param("memId")String memId);
	public void setTempPwd(MemberVO fPwd);
	public int checkId(String id);
	public MemberVO memInfo(String memId);
	public MemberVO searchSpecificMember(String memId);
	public int insertCoupon(MemberVO coupvo);
	public List<MemberVO> selectMemberListPage(Pagination paging);
}