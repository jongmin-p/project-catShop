package com.yedam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.mypage.vo.ZzimVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class addZzimControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String json = "";
		
		String memId = req.getParameter("memId");
		String proId = req.getParameter("proId");

		// id값 확인 후 없을 경우 login페이지 안내
		if(memId != null) {
			ZzimVO vo = new ZzimVO();
			vo.setMemId(memId);
			vo.setProId(Integer.parseInt(proId));
			
			ProductService service = new ProductServiceImpl();
			
			if(service.addZzim(vo) > 0) {
				json = "{\"retCode\": \"Success\"}";
			} else {
				json = "{\"retCode\": \"Fail\"}";
			}
		} else {
			json = "{\"retCode\": \"NoMember\"}";
		}
		
		
		
		return json + ".json";
	}

}
