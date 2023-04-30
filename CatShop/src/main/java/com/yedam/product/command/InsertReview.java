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

public class InsertReview implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = (1024 * 1024 * 10);
		String encoding = "utf-8";

		MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String rtitle = multi.getParameter("rtitle");
		String rContent = multi.getParameter("rContent");
		String rate = multi.getParameter("rate");
		String memid = multi.getParameter("memid");
		String proid = multi.getParameter("proid");
		String fileName = "";
		System.out.println(rate);
		System.out.println(proid);
		Enumeration<?> files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String file = (String) files.nextElement();
			System.out.println(file);
			fileName = multi.getFilesystemName(file); // 바뀐 파일 이름 읽을 때
		}
		
		ProductVO vo = new ProductVO();
		vo.setRevTitle(rtitle);
		vo.setRevContent(rContent);
		vo.setRevRate(Integer.parseInt(rate));
		vo.setMemId(memid);
		vo.setRevImage(fileName);
		vo.setProId(Integer.parseInt(proid));
		
		ProductService service = new ProductServiceImpl();
		
		String json = "";
		if(service.insertReview(vo) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		return json + ".json";
	}

}
