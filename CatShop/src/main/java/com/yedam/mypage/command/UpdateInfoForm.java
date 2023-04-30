package com.yedam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;

public class UpdateInfoForm implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberService service = new MemberServiceMybatis(); 		
		HttpSession session = req.getSession();
		req.setAttribute("list",service.memInfo((String)session.getAttribute("logId")));
		
		return "mypage/updateInfo.tiles";
	}

}