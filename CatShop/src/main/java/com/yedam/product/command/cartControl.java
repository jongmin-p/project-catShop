package com.yedam.product.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.ProductVO;

public class cartControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String logId = (String)session.getAttribute("logId");
		
		//장바구니 목록 조회
		ProductService service = new ProductServiceImpl();
		req.setAttribute("cartList", service.getCartList(logId));
		System.out.println(service.getCartList(logId));
		//장바구니 가격 총합
		List<ProductVO> productList = service.getCartList(logId);
		int sum = 0;
		for(ProductVO product : productList) {
		    sum += product.getCaSumprice();
		}
		req.setAttribute("sumPrice", sum);
		
		return "cart/cart.tiles";
		
	}

}
