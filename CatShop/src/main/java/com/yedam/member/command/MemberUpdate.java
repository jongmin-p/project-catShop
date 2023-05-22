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

		String id = req.getParameter("memId");
		String pass = req.getParameter("memPw");
		String name = req.getParameter("memName");
		String phone = req.getParameter("memPhone");
		String email = req.getParameter("memEmail");
		String user = req.getParameter("memUser");
		
		System.out.println("컨트롤러에서 값 찍히는지 확인 => " + id + ", " + pass + ", " + name + ", " + phone + ", " + email + ", " + user);
		
		MemberService service = new MemberServiceMybatis();
		MemberVO member = new MemberVO();
		
		member.setMemId(id);
		member.setMemPw(pass);
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

		if(service.modifyMember(member) > 0) {
			resultMap.put("retCode", "Success");
		} else {
			resultMap.put("retCode", "Fail");
		}
		return gson.toJson(resultMap) + ".json";
	}
}