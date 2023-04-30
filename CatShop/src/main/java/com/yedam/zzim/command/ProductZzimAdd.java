package com.yedam.zzim.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.zzim.service.ZzimService;
import com.yedam.zzim.service.ZzimServiceImpl;
import com.yedam.zzim.vo.ZzimVO;

public class ProductZzimAdd implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		String proId = req.getParameter("proId");
		
		ZzimVO vo = new ZzimVO();
		vo.setMemId(memId);
		vo.setProId(Integer.parseInt(proId));
		
		ZzimService service = new ZzimServiceImpl();
		String json = "";
		
		if(service.addProductZzim(vo) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		return json + ".json";
	}

}
