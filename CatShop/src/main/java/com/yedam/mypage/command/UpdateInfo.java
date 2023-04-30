package com.yedam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;
import com.yedam.member.vo.MemberVO;

public class UpdateInfo implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceMybatis();
		MemberVO mvo = new MemberVO();
		
		mvo.setMemId(req.getParameter("memId"));  
		mvo.setMemPw(req.getParameter("memPw"));  
		mvo.setMemName(req.getParameter("memName")); 
		mvo.setMemEmail(req.getParameter("memEmail")); 
		mvo.setMemPhone(req.getParameter("memPhone")); 
		mvo.setMemUser(req.getParameter("memUser")); 
		
		service.modifyMember(mvo);
		
		return "updateInfoForm.do";
	}

}