package com.yedam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.qa.service.QaService;
import com.yedam.qa.service.QaServiceImpl;
import com.yedam.zzim.service.ZzimService;
import com.yedam.zzim.service.ZzimServiceImpl;

public class ProductDetail implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pid = req.getParameter("pid");
		ProductService service = new ProductServiceImpl();
		req.setAttribute("proDetail", service.getProduct(Integer.parseInt(pid)));
		
		QaService serviceQa = new QaServiceImpl(); 
		req.setAttribute("qaList", serviceQa.qaList(Integer.parseInt(pid)));
		
		HttpSession session = req.getSession();
		String logId = (String) session.getAttribute("logId");
		ZzimService serviceZzim = new ZzimServiceImpl();
		req.setAttribute("zzimUser", serviceZzim.ZzimList(logId, Integer.parseInt(pid)));
		
		req.setAttribute("reviewList", service.getReviewList(Integer.parseInt(pid)));
		return "product/productDetail.tiles";
	}

}
