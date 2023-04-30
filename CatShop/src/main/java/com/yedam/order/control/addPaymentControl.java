package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class addPaymentControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String coupId = req.getParameter("coupId");
		String payCouponprice = req.getParameter("payCouponprice");
		String payCode = req.getParameter("payCode");
		String payTotalprice = req.getParameter("payTotalprice");
		System.out.println(payTotalprice);
		
		OrderVO ovo = new OrderVO();
		ovo.setCoupId(Integer.parseInt(coupId));
		ovo.setPayCouponprice(Integer.parseInt(payCouponprice));
		ovo.setPayCode(payCode);
		ovo.setPayTotalprice(Integer.parseInt(payTotalprice));
		
		OrderService service = new OrderServiceImpl();
		String json="";
		
		if(service.addPayment(ovo) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		return json + ".json";
	}

}
