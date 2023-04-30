package com.yedam.product.command;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.ProductVO;

public class ModifyProductManager implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = (1024 * 1024 * 10);
		String encoding = "utf-8";

		MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, encoding, new DefaultFileRenamePolicy());

		String pid = multi.getParameter("pid");
		String pname = multi.getParameter("pname");
		String pprice = multi.getParameter("pprice");
		String pdesc = multi.getParameter("pdesc");
		String pcategory = multi.getParameter("pcategory");
		String fileName = "";

		Enumeration<?> files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String file = (String) files.nextElement();
			System.out.println(file);
			fileName = multi.getFilesystemName(file); // 바뀐 파일 이름 읽을 때
		}

		ProductVO vo = new ProductVO();
		vo.setProId(Integer.parseInt(pid));
		vo.setProName(pname);
		vo.setProPrice(Integer.parseInt(pprice));
		vo.setProDesc(pdesc);
		vo.setProCategory(pcategory);
		vo.setProImg(fileName);

		// 결과값을 map타입에 저장
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("manager", vo);
		Gson gson = new GsonBuilder().create();
		
		ProductService service = new ProductServiceImpl();
		
		if(service.modifyProduct(vo) > 0) {
			resultMap.put("retCode", "Success");
		} else {
			resultMap.put("retCode", "Fail");
		}
		
		return gson.toJson(resultMap) + ".json";
	}

}
