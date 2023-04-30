package com.yedam.qa.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.qa.service.QaService;
import com.yedam.qa.service.QaServiceImpl;
import com.yedam.qa.vo.QaVO;

public class InsertProductQa implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String proId = req.getParameter("qaProId");
		String memId = req.getParameter("qaWriter");
		String qaTitle = req.getParameter("qaTitle");
		String qaContent = req.getParameter("qaDesc");
		
		QaVO qa = new QaVO();
		qa.setProId(Integer.parseInt(proId));
		qa.setMemId(memId);
		qa.setQaTitle(qaTitle);
		qa.setQaContent(qaContent);
		
		String json = "";
		QaService service = new QaServiceImpl();
		if(service.addProductQa(qa) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		return json + ".json";
	}

}
