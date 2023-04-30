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

public class AddNoticeControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title"); // form>input:name속성.
		String content = req.getParameter("content");

		NoticeVO notice = new NoticeVO();
		notice.setNotTitle(title);
		notice.setNotContent(content);

		NoticeService service = new NoticeServiceImpl();
		service.addNotice(notice);
		
	
		
		return "noticeList.do";
	}

}
