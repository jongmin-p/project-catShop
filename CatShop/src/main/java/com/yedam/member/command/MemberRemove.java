package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;

public class MemberRemove implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("memId");
		MemberService service = new MemberServiceMybatis();
		
		if(service.removeMember(memId) > 0) {
			return "{ \"retCode\" : \"Success\" }.json";
		}
		
		return "{ \"retCode\" : \"Fail\" }.json";
	}

}
