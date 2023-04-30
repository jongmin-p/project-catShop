package com.yedam.order.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.yedam.common.Command;
import com.yedam.common.Pagination;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class orderManageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		OrderService countService = new OrderServiceImpl();
		//페이지 클릭시 페이지 번호 변경
		if(req.getParameter("page")!=null){
			page = Integer.parseInt(req.getParameter("page"));
			
			//총 상품 개수 조회
			int count = countService.orderList().size();

			int startNum = (page-1)*10+1;
	        int endNum = page*10;
	        //페이징 처리를 위한 정보 담기
			Pagination paging = new Pagination();
			paging.setPage(page);
			paging.setTotalCount(count);
			paging.setStartNum(startNum);
	        paging.setEndNum(endNum);
	        
	        OrderVO ovo = new OrderVO();
	        ovo.setStartNum(startNum);
	        ovo.setEndNum(endNum);
	        
	        OrderService service = new OrderServiceImpl();
	        List<OrderVO> orderList = service.orderListPage(ovo);
	        
	        Gson gson = new GsonBuilder().create();
			Gson gsonPage = new GsonBuilder().create();
			
			JsonObject result = new JsonObject();
			result.add("paging", gsonPage.toJsonTree(paging));
			result.add("orderList", gson.toJsonTree(orderList));
			String json = gson.toJson(result);
			System.out.println(json);
			
			return json + ".json";
		}
		
		
		
		//총 상품 개수 조회
		int count = countService.orderList().size();

		int startNum = (page-1)*10+1;
        int endNum = page*10;
        //페이징 처리를 위한 정보 담기
		Pagination paging = new Pagination();
		paging.setPage(page);
		paging.setTotalCount(count);
		paging.setStartNum(startNum);
        paging.setEndNum(endNum);
        
        OrderVO ovo = new OrderVO();
        ovo.setStartNum(startNum);
        ovo.setEndNum(endNum);
        
        OrderService service = new OrderServiceImpl();
        req.setAttribute("orderList", service.orderListPage(ovo));
        req.setAttribute("paging", paging);
        System.out.println(paging);
		System.out.println(service.orderListPage(ovo));
		return "admin/orderManage.tiles";
		
		
		
		
		
	}

}
