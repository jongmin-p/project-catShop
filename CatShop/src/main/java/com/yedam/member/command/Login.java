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
import com.yedam.mypage.vo.ZzimVO;

public class Login implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// login.jsp 에서 입력받은 정보 추출
		String id = req.getParameter("mid");
		String pass = req.getParameter("mpw");
		
		MemberService service = new MemberServiceMybatis();

		// 받아온 정보 담음
		MemberVO member = new MemberVO();
		member.setMemId(id);
		member.setMemPw(pass);


		// 받아온 정보를 담은 VO 객체를 service 로 넘김
		MemberVO rvo = service.login(member);
		
		
		System.out.println(rvo);
		

		if (rvo != null) {
			HttpSession session = req.getSession();

			session.setAttribute("logId", rvo.getMemId());
			session.setAttribute("logName", rvo.getMemName());
			session.setAttribute("Auth", rvo.getMemUser());
			System.out.println(rvo.getMemUser());
			req.setAttribute("vo", rvo);
			if(rvo.getMemUser().equals("admin")) {
				return "{ \"retCode\" : \"Success\",\"manager\" : \"admin\" }.json";
			} else {
				return "{ \"retCode\" : \"Success\"}.json";
			}
		} else {
			return "{ \"retCode\" : \"Fail\" }.json";
		}
	}
}