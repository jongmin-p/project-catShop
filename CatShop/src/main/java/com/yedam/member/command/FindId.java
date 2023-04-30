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
		
		// fId 가 뭔가를 반환받았다면(즉, 아이디를 받환받았다면)
		if(fId != null) {
			System.out.println(fId.getMemId() + " - 2번째");
			
			HttpSession session = req.getSession();
			session.setAttribute("fId", fId.getMemId());
			
			// req.setAttribute("fId", fId.getMemId());
			//	그냥 req.setAttribute로 하면, findIdResult.jsp 에서 못받음.
			//	findIdForm.jsp 의 ajax 에다가 아래 json 을 반환하고 findIdResult.jsp 로 이동하기 때문에
			//	그래서 Session 에다가 저장.
			return "{ \"retCode\" : \"Success\" }.json";
		} else {
			// 에러 메시지 출력 후 다시 findIdForm화면으로
//			req.setAttribute("error", "아이디가 없는데요");
			return "{ \"retCode\" : \"Fail\" }.json";	
		}
	}
}