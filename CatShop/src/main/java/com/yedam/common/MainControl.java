package com.yedam.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.yedam.mypage.service.ZzimService;
import com.yedam.mypage.service.ZzimServiceImpl;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.ProductVO;

public class MainControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService service = new ProductServiceImpl();
		req.setAttribute("list", service.productList());
		
		System.out.println(service.rateList());
		req.setAttribute("rateList", service.rateList());
		
		HttpSession session = req.getSession();
		String memId = (String)session.getAttribute("logId");
		System.out.println(memId);
		if(memId != null) {
			ZzimService zzimService = new ZzimServiceImpl();
			req.setAttribute("zzimList", zzimService.zzimList(memId));
		}
		
		
		
		return "main/main.tiles";
	}

}
