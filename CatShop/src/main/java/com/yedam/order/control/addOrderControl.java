package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class addOrderControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		String ordReceiver = req.getParameter("ordReceiver");
		String ordAddr = req.getParameter("ordAddr");
		String ordPhone = req.getParameter("ordPhone");
		String ordPostcode = req.getParameter("ordPostcode");
		String ordTotalPrice = req.getParameter("ordTotalPrice");

		OrderVO ovo = new OrderVO();
		ovo.setMemId(memId);
		ovo.setOrdReceiver(ordReceiver);
		ovo.setOrdAddr(ordAddr);
		ovo.setOrdPhone(ordPhone);
		ovo.setOrdPostcode(ordPostcode);
		ovo.setOrdTotalprice(Integer.parseInt(ordTotalPrice));
		
		OrderService service = new OrderServiceImpl();
		String json="";
		
		if(service.addOrder(ovo) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
			return json + ".json";
		}
		
		
		
		String coupId = req.getParameter("coupId");
		String payCouponprice = req.getParameter("payCouponprice");
		String payCode = req.getParameter("payCode");
		String payUid = req.getParameter("payUid");
		String payTotalprice = req.getParameter("payTotalprice");
		System.out.println(payUid);
		if(coupId != null) {
			ovo = new OrderVO();
			ovo.setCoupId(Integer.parseInt(coupId));
			ovo.setPayCouponprice(Integer.parseInt(payCouponprice));
			ovo.setPayCode(payCode);
			ovo.setPayUid(payUid);
			ovo.setPayTotalprice(Integer.parseInt(payTotalprice));
		} else {
			ovo = new OrderVO();
			ovo.setPayUid(payUid);
			ovo.setPayCode(payCode);
			ovo.setPayTotalprice(Integer.parseInt(payTotalprice));
		}
		
		
		service = new OrderServiceImpl();
		json="";
		
		if(service.addPayment(ovo) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		
		
		return json + ".json";
		
		
		
	}

}
