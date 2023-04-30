package com.yedam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.mypage.service.ZzimService;
import com.yedam.mypage.service.ZzimServiceImpl;

public class ZzimListControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ZzimService service = new ZzimServiceImpl(); 		
		HttpSession session = req.getSession();
		
		req.setAttribute("list",service.zzimList((String)session.getAttribute("logId")));
		return "mypage/zzimList2.tiles";
	}

}
