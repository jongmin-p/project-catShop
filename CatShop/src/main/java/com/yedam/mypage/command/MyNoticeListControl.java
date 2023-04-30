package com.yedam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.mypage.service.MyNoticeService;
import com.yedam.mypage.service.MyNoticeServiceImpl;

public class MyNoticeListControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyNoticeService service = new MyNoticeServiceImpl(); 		
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("logId");
		req.setAttribute("list",service.myReview(memId));
		req.setAttribute("qalist",service.myQa(memId));
		System.out.println("myQa"+service.myQa(memId));
		
		return "mypage/myNotice.tiles";
	}

}
