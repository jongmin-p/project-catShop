package com.yedam.member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;
import com.yedam.member.vo.MemberVO;

public class MemberUpdate implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 수정하고 싶은 회원을 더블클릭하면 인풋으로 바뀌고 그 값들을 읽어서 수정버튼을 누르면 입력된 값을 서버에 넣으면서 다시 원래 모습으로 돌아가야 됨
		// 여기 getParameter 랑 manage.js 의 updateMemberFnc 함수 key 값이랑 통일
		String id = req.getParameter("memId");
		String pass = req.getParameter("memPw");
		String name = req.getParameter("memName");
		String phone = req.getParameter("memPhone");
		String email = req.getParameter("memEmail");
		String user = req.getParameter("memUser");	// 숨겨진 값(user) 으로 넘어옴.  회원가입이니까 무조건 user
		
		System.out.println("컨트롤러에서 값 찍히는지 확인 => " + id + ", " + pass + ", " + name + ", " + phone + ", " + email + ", " + user);
		
		
		MemberService service = new MemberServiceMybatis();
		MemberVO member = new MemberVO();
		
		member.setMemId(id);
		member.setMemPw(pass);
		// member.setMemPw(confirmPass);	// 이거 적어야 하나??? DB 컬럼에도 추가해야 함?
										// 아니지... 가입이 됐다는건 어쩄든 동일하게 했다는거니.. 가입 시 2개가 다르면 애초에 막았어야 함.
		member.setMemName(name);
		member.setMemPhone(phone);
		member.setMemEmail(email);
		member.setMemUser(user);
		
		System.out.println(member);
		
		
		//결과값을 map타입에 저장
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("member", member);
		Gson gson = new GsonBuilder().create();
		
		System.out.println("몇 개? " + service.modifyMember(member));

		//System.out.println(mid);
		if(service.modifyMember(member) > 0) {
			resultMap.put("retCode", "Success");
		} else {
			resultMap.put("retCode", "Fail");
		}
		return gson.toJson(resultMap) + ".json";
	}
}