package com.yedam.qa.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ProductQaPage implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		ProductService service = new ProductServiceImpl();
		req.setAttribute("qaDetail", service.getProduct(Integer.parseInt(pid)));
		
		return "qa/productQaPage.tiles";
	}

}
