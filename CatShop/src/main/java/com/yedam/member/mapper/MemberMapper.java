package com.yedam.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.common.Pagination;
import com.yedam.member.vo.MemberVO;

// 가장 간단한(기본적인) 부분 선언하는곳 , 예를들어 연산시 => 더하기 , 뺄셈, 나누기, 곱하기
public interface MemberMapper { // 서비스부분이 아니라 데이터를 처리해주는 곳임(DB처리)


	public MemberVO login(MemberVO member); // 로그인

	public int addMember(MemberVO member);	// 회원가입 유저 DB에 추가


	public List<MemberVO> couponSelect(String memId); //쿠폰 조회

	
	//
	public List<MemberVO> memberList(); //회원전체목록.

	public int deleteMember(String mid);

	public int updateMember(MemberVO member);

	public MemberVO getFindId(@Param("memName")String memName, @Param("memEmail")String memEmail);
	
	public MemberVO getFindPwd(@Param("memName")String memName, @Param("memEmail")String memEmail, @Param("memId")String memId);
	

	//
	public void setTempPwd(MemberVO fPwd);

	//
	public int checkId(String id);
	
	public MemberVO memInfo(String memId); //juan member단건조회

	public MemberVO searchSpecificMember(String memId);		// 종민	회원검색용


	public int insertCoupon(MemberVO coupvo);
	public List<MemberVO> selectMemberListPage(Pagination paging); // 페이징

}