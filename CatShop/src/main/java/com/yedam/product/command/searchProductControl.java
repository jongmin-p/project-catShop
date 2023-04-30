package com.yedam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Set;

import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class searchProductControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("search") != null ) {
			String keyword = req.getParameter("search");

			ProductService service = new ProductServiceImpl();
			req.setAttribute("list", service.searchProduct(keyword));
			System.out.println(service.searchProduct(keyword));
		} else if(req.getParameter("menu") != null ) {
			String menu = req.getParameter("menu");

			ProductService service = new ProductServiceImpl();
			req.setAttribute("list", service.searchMenu(menu));
			
		}

		return "search/search.tiles";
	}

}
