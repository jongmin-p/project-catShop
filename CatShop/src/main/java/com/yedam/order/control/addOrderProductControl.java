package com.yedam.order.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class addOrderProductControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] ordQuants = req.getParameterValues("ordQuant");
		String[] proIds = req.getParameterValues("proId");
		String[] ordProSumprices = req.getParameterValues("ordProSumprice");
		String json="";
		String ordStatus = req.getParameter("ordStatus");
		System.out.println(ordStatus);
		for(int i = 0 ; i < ordQuants.length ; i++) {
			OrderVO ovo = new OrderVO();
			ovo.setOrdQuant(Integer.parseInt(ordQuants[i])); 
			ovo.setProId(Integer.parseInt(proIds[i])); 
			ovo.setOrdProSumprice(Integer.parseInt(ordProSumprices[i])); 
			ovo.setOrdStatus(ordStatus);
			OrderService service = new OrderServiceImpl();
			if(service.addOrderProduct(ovo)>0) {
				json = "{\"retCode\": \"Success\"}";
			} else {
				json = "{\"retCode\": \"Fail\"}";
				
			}
		}
		
		return json + ".json";
	}

}
