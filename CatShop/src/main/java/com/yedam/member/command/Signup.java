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
		String user = req.getParameter("member_user");	// 숨겨진 값(user) 으로 넘어옴.  회원가입이니까 무조건 user
		
		
		/*
		 * if (pass != confirmPass) { HttpSession session = req.getSession();
		 * 
		 * // 회원가입 후 첫 화면에서 이름 언급용 (xxx님 환영합니다) session.setAttribute("passwordError",
		 * "비번과 재확인 비번이 일치하지 않습니다");
		 * 
		 * return "member/signup.tiles"; }
		 */
		
		
		MemberVO member = new MemberVO();
		member.setMemId(id);
		member.setMemPw(pass);
		member.setMemPw(confirmPass);	// 이거 적어야 하나??? DB 컬럼에도 추가해야 함?
										// 아니지... 가입이 됐다는건 어쩄든 동일하게 했다는거니.. 가입 시 2개가 다르면 애초에 막았어야 함.
		member.setMemName(name);
		member.setMemPhone(phone);
		member.setMemEmail(email);
		member.setMemUser(user);
		
		MemberService service = new MemberServiceMybatis();
		service.addMember(member);
		
		
		// 회원가입 시 환영 페이지가 아닌, 바로 로그인 페이지로 이동할거기 때문에 아래 코드 필요 X
//		MemberService service = new MemberServiceMybatis();
//		if( service.addMember(member) > 0) {
//			HttpSession session = req.getSession();
//			
//			// 회원가입 후 첫 화면에서 이름 언급용 (xxx님 환영합니다)
//			session.setAttribute("logName", member.getMemName());
//		}
		
		
		// 멤버 VO 불러오고, 위와 동일한 방식으로 (coupon.set~~~
		MemberVO coupvo = new MemberVO();
		
		// 아래 값은 고정			(날짜는 매퍼에서 sysdate + 어쩌구),   쿠폰ID 는 셀렉트키에서 시퀀스 이용(OderMapper.xml 참고)
		coupvo.setMemId(id);
		coupvo.setCoupName("가입기념쿠폰");
		coupvo.setCoupPrice(Integer.parseInt("5000"));
		coupvo.setCoupInfo("이건 가입 기념 쿠폰입니다.");

		// 서비스 이렇게 하나 만들면 됨
		service.addCoupon(coupvo);
		
		// member/signup 페이지로 이동
		return "member/signup.tiles";
	}
}