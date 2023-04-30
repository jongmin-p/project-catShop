package com.yedam.product.command;

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
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.ProductVO;

public class ProductManagerList implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int page = 1;
		ProductService countService = new ProductServiceImpl();
		//총 상품 개수 조회
		int count = countService.getPrductCount();

        //페이지 클릭시 페이지 번호 변경
		if(req.getParameter("page")!=null){
			page = Integer.parseInt(req.getParameter("page"));
	    }
		int startNum = (page-1)*10+1;
        int endNum = page*10;
        //페이징 처리를 위한 정보 담기
		Pagination paging = new Pagination();
		paging.setPage(page);
		paging.setTotalCount(count);
		paging.setStartNum(startNum);
        paging.setEndNum(endNum);
        
        ProductService service = new ProductServiceImpl();
		List<ProductVO> productList = service.productList(paging);

		Gson gson = new GsonBuilder().create();
		Gson gsonPage = new GsonBuilder().create();
		
		JsonObject result = new JsonObject();
		result.add("paging", gsonPage.toJsonTree(paging));
		result.add("productList", gson.toJsonTree(productList));
		String json = gson.toJson(result);
		System.out.println(json);
		
		return json + ".json";
	}

}
