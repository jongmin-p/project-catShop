package com.yedam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;
import com.yedam.notice.vo.NoticeVO;

public class NoticeUpdateControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeService service = new NoticeServiceImpl();
		NoticeVO nvo = new NoticeVO();
		
		nvo.setNotId(Integer.parseInt(req.getParameter("notId")));  ;
		nvo.setNotTitle(req.getParameter("title")); 
		nvo.setNotContent(req.getParameter("content")); 
		
		System.out.println(nvo.getNotTitle());
		System.out.println(req.getParameter("notId"));
		
		service.updateNotice(nvo);
		
		return "noticeList.do";
		
	}

}
