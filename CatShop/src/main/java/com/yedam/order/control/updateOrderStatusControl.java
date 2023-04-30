package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class updateOrderStatusControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ordProId = req.getParameter("ordProId");
		String ordStatus = req.getParameter("ordStatus");
		System.out.println(ordStatus);
		
		OrderVO ovo = new OrderVO();
		ovo.setOrdProId(Integer.parseInt(ordProId));
		ovo.setOrdStatus(ordStatus);

		System.out.println(ovo);
		OrderService service = new OrderServiceImpl();
		String json = "";
		if(service.modifyOrderStatus(ovo)>0) {
			json = "{\"retCode\": \"Success\"}";
			
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		return json + ".json";
	}

}
