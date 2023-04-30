package com.yedam.qa.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.qa.service.QaService;
import com.yedam.qa.service.QaServiceImpl;
import com.yedam.qa.vo.QaVO;

public class QaUpdate implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qid = req.getParameter("qid");
		String mid = req.getParameter("mid");
		String pid = req.getParameter("pid");
		String qtitle = req.getParameter("qtitle");
		String qcontent = req.getParameter("qcontent");
		String qdate = req.getParameter("qdate");
		String qReply = req.getParameter("qReply");

		
		QaVO vo = new QaVO();
		vo.setQaId(Integer.parseInt(qid));
		vo.setMemId(mid);
		vo.setProId(Integer.parseInt(pid));
		vo.setQaTitle(qtitle);
		vo.setQaContent(qcontent);
		vo.setQaDate(qdate);
		vo.setQaReply(qReply);

		// 결과값을 map타입에 저장
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("manager", vo);
		Gson gson = new GsonBuilder().create();

		QaService service = new QaServiceImpl();

		if (service.modifyQa(vo) > 0) {
			resultMap.put("retCode", "Success");
		} else {
			resultMap.put("retCode", "Fail");
		}

		return gson.toJson(resultMap) + ".json";
	}

}
