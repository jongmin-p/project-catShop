package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;
import com.yedam.member.vo.MemberVO;

public class Signup implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// login.jsp 에서 입력받은 정보 추출
		String id = req.getParameter("member_id");
		String pass = req.getParameter("member_pw");
		String confirmPass = req.getParameter("member_confirm_pw");
		String name = req.getParameter("member_name");
		String phone = req.getParameter("member_phone");
		String email = req.getParameter("member_email");
		String user = req.getParameter("member_user");

		
		MemberVO member = new MemberVO();
		member.setMemId(id);
		member.setMemPw(pass);
		member.setMemPw(confirmPass);
		member.setMemName(name);
		member.setMemPhone(phone);
		member.setMemEmail(email);
		member.setMemUser(user);
		
		MemberService service = new MemberServiceMybatis();
		service.addMember(member);
		

		MemberVO coupvo = new MemberVO();

		coupvo.setMemId(id);
		coupvo.setCoupName("가입기념쿠폰");
		coupvo.setCoupPrice(Integer.parseInt("5000"));
		coupvo.setCoupInfo("이건 가입 기념 쿠폰입니다.");

		service.addCoupon(coupvo);

		return "member/signup.tiles";
	}
}