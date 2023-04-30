package com.yedam.order.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class refundInfoControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ordProId = req.getParameter("ordProId");
//		String ordId = req.getParameter("ordId"); // 주문번호를 이용하여 한번에 처리도 가능?
		
		OrderVO ovo = new OrderVO();
		ovo.setOrdProId(Integer.parseInt(ordProId));
//		ovo.setOrdId(Integer.parseInt(ordId));
		OrderService service = new OrderServiceImpl();
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("refundInfo", service.getRefundInfo(ovo));
		Gson gson = new GsonBuilder().create();
		
		System.out.println(resultMap);
		
		return gson.toJson(resultMap) + ".json";

	}

}
