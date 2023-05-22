package com.yedam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;
import com.yedam.notice.vo.NoticeVO;

public class NoticeDetailControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int notId = Integer.parseInt(req.getParameter("notId"));

		NoticeService service = new NoticeServiceImpl();		
		req.setAttribute("list",service.getNotice(notId));
		
		HttpSession session = req.getSession();
		req.setAttribute("auth",(String)session.getAttribute("Auth"));
		return "notice/noticeDetail.tiles";
	}
}