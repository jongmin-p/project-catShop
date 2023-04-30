package com.yedam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class removeCartControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String json = "";
		if(req.getParameter("cartId") != null ) {
			String cartId = req.getParameter("cartId");
			
			ProductService service = new ProductServiceImpl();
			
			
			if(service.removeCart(Integer.parseInt(cartId)) > 0) {
				json = "{\"retCode\": \"Success\"}";
			} else {
				json = "{\"retCode\": \"Fail\"}";
			}
			
			return json + ".json";
		} else if (req.getParameterValues("cartIds") != null){
			System.out.println(req.getParameterValues("cartIds"));
			String[] cartIdsArray = req.getParameterValues("cartIds"); 
			
			for(int i=0 ; i < cartIdsArray.length ; i ++) {
				String cartId = cartIdsArray[i];
				System.out.println(cartId);
				ProductService service = new ProductServiceImpl();
				
				if(service.removeCart(Integer.parseInt(cartId)) > 0) {
					json = "{\"retCode\": \"Success\"}";
				} else {
					json = "{\"retCode\": \"Fail\"}";
				}

			}
			return json + ".json";
			
		}
		return null;
	}

}
