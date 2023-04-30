package com.yedam.product.command;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.ProductVO;

public class InsertProductManager implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = (1024 * 1024 * 10);
		String encoding = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
//		String proId = multi.getParameter("proId");
		String proName = multi.getParameter("proName");
		String proPrice = multi.getParameter("proPrice");
		String proDesc = multi.getParameter("proDesc");
		String proCategory = multi.getParameter("proCategory");
		String fileName = "";
		
		Enumeration<?> files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String file = (String) files.nextElement();
			fileName = multi.getFilesystemName(file);
		}
		
		ProductVO product = new ProductVO();
//		product.setProId(Integer.parseInt(proId));
		product.setProName(proName);
		product.setProPrice(Integer.parseInt(proPrice));
		product.setProDesc(proDesc);
		product.setProCategory(proCategory);
		product.setProImg(fileName);
		
		ProductService service = new ProductServiceImpl();
		String link = "";
		if(service.addProduct(product) > 0) {
			link = "productManagerPage.do";
		} else {
			System.out.println("오류");
		}
			
		return link;
	}

}
