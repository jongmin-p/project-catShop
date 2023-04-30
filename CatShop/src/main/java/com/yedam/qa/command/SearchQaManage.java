package com.yedam.qa.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.qa.service.QaService;
import com.yedam.qa.service.QaServiceImpl;
import com.yedam.qa.vo.QaVO;

public class SearchQaManage implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String proId = req.getParameter("proId");
		
		System.out.println("출력 테스트 컨트롤러 -> " + proId);

		if(proId.equals("")) {
			proId = null;
		}
		
		QaService service = new QaServiceImpl();
		
		List<QaVO> searchQa = service.searchQa(proId);
		
		System.out.println("검색된 멤버는 ==> " + searchQa);
		
		
		Gson gson = new GsonBuilder().create();

		return gson.toJson(searchQa) + ".json";
	}

}
