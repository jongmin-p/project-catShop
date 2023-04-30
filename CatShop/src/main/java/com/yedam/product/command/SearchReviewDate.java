package com.yedam.product.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.ProductVO;

public class SearchReviewDate implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String date = req.getParameter("date");
		System.out.println(date);
		
		
		ProductService service = new ProductServiceImpl();

		List<ProductVO> searchDate = service.searchReviewDateList(date);

		Gson gson = new GsonBuilder().create();

		return gson.toJson(searchDate) + ".json";
	}

}
