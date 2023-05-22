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

public class FindId implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		System.out.println(name);
		System.out.println(email);
		
		MemberService service = new MemberServiceMybatis();

		MemberVO fId = service.findId(name, email);
		System.out.println(fId);
		
		if(fId != null) {
			System.out.println(fId.getMemId() + " - 2번째");
			
			HttpSession session = req.getSession();
			session.setAttribute("fId", fId.getMemId());
			
			return "{ \"retCode\" : \"Success\" }.json";
		} else {
			return "{ \"retCode\" : \"Fail\" }.json";	
		}
	}
}