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

public class SearchProductManage implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		String proId = req.getParameter("proId");
		String proName = req.getParameter("proName");
		System.out.println(req.getParameter("page"));
		if(req.getParameter("page")!=null){
			page = Integer.parseInt(req.getParameter("page"));
		} else {
			page = 1;
		}
		System.out.println(proId);
		System.out.println(proName);
		System.out.println(page);
		ProductVO pvo = new ProductVO();
		ProductService service = new ProductServiceImpl();
		if(proId.equals("") && !proName.equals("")) {
			System.out.println("상품명 검색");
			int startNum = (page-1)*10+1;
	        int endNum = page*10;
	        System.out.println("startNum : "+startNum);
	        System.out.println("endNum : "+endNum);
	        
	        pvo.setProName(proName);
	        pvo.setStartNum(startNum);
	        pvo.setEndNum(endNum);
	        System.out.println(pvo);
	        //검색한 상품 개수 조회
	        int count = service.searchProduct(proName).size();

	        System.out.println("검색 개수 : "+count);
	        
	        //페이징 처리를 위한 정보 담기
			Pagination paging = new Pagination();
			paging.setPage(page);
			paging.setTotalCount(count);
			paging.setStartNum(startNum);
	        paging.setEndNum(endNum);
	        
	        
	       
	        
			List<ProductVO> searchReview = service.searchProNameList(pvo);

			Gson gson = new GsonBuilder().create();
			Gson gsonPage = new GsonBuilder().create();
			
			JsonObject result = new JsonObject();
			result.add("paging", gsonPage.toJsonTree(paging));
			result.add("searchReview", gson.toJsonTree(searchReview));
			String json = gson.toJson(result);
			System.out.println(json);
			
			return json + ".json";
		}
		else if(proName.equals("") && !proId.equals("")) {
			System.out.println("상품코드 검색");
	        pvo.setProId(Integer.parseInt(proId));
	        int count = service.searchProIdList(pvo).size();
	        
	        System.out.println("검색 개수 : "+count);
			//페이지 클릭시 페이지 번호 변경

			int startNum = (page-1)*10+1;
	        int endNum = page*10;
	        //페이징 처리를 위한 정보 담기
			Pagination paging = new Pagination();
			paging.setPage(page);
			paging.setTotalCount(count);
			paging.setStartNum(startNum);
	        paging.setEndNum(endNum);
	        
	        
	        pvo.setStartNum(startNum);
	        pvo.setEndNum(endNum);
	        
			List<ProductVO> searchReview = service.searchProIdList(pvo);

			Gson gson = new GsonBuilder().create();
			Gson gsonPage = new GsonBuilder().create();
			
			JsonObject result = new JsonObject();
			result.add("paging", gsonPage.toJsonTree(paging));
			result.add("searchReview", gson.toJsonTree(searchReview));
			String json = gson.toJson(result);
			System.out.println(json);
			
			return  json + ".json";
		}
		
		
		
		return null; 
		
		
	}

}
