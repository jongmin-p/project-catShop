package com.yedam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class NoticeUpdateFormControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeService service = new NoticeServiceImpl();
		int notId = Integer.parseInt(req.getParameter("notId")) ;
		req.setAttribute("list",service.getNotice(notId));
		
		return "notice/noticeUpdate.tiles";
	}

}
