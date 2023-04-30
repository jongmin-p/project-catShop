package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class searchOrderControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req);
		String ordId = req.getParameter("ordId");
		String memId = req.getParameter("memId");
		String ordStatus = req.getParameter("ordStatus");
//		String findPeriod = req.getParameter("findPeriod");
		System.out.println(ordId);
		System.out.println(memId);
		System.out.println(ordStatus);
//		System.out.println(findPeriod);
		
		OrderVO ovo = new OrderVO();
		if(ordId != "") {
			ovo.setOrdId(Integer.parseInt(ordId));
		}
		if(memId != "") {
			ovo.setMemId(memId);	
		}
		if(ordStatus != null) {
			ovo.setOrdStatus(ordStatus);
		}
		System.out.println(ovo);
		OrderService service = new OrderServiceImpl();
		System.out.println(service.searchOrder(ovo));
		req.setAttribute("orderList", service.searchOrder(ovo));
		
		return "admin/orderManage.tiles";
	}

}
