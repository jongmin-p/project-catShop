package com.yedam.qa.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.qa.service.QaService;
import com.yedam.qa.service.QaServiceImpl;

public class QaRemove implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qaId = req.getParameter("qaId");
		
		QaService service = new QaServiceImpl();
		String json = "";
		
		if(service.removeQa(Integer.parseInt(qaId)) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		return json + ".json";
	}

}
