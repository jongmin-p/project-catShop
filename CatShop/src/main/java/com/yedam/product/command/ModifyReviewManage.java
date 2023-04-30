package com.yedam.product.command;

import java.io.IOException;
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

public class ModifyReviewManage implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = (1024 * 1024 * 10);
		String encoding = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String rid = multi.getParameter("rid");
		String rReply = multi.getParameter("rReply");
		String pid = multi.getParameter("pid");
		String mid = multi.getParameter("mid");
		String rtitle = multi.getParameter("rtitle");
		String rcontent = multi.getParameter("rcontent");
		String rate = multi.getParameter("rate");
		String rdate = multi.getParameter("rdate");
		String rimg = multi.getParameter("rimg");
		
		ProductVO vo = new ProductVO();
		vo.setRevId(Integer.parseInt(rid));
		vo.setRevReply(rReply);
		vo.setProId(Integer.parseInt(pid));
		vo.setMemId(mid);
		vo.setRevTitle(rtitle);
		vo.setRevContent(rcontent);
		vo.setRevRate(Integer.parseInt(rate));
		vo.setRevDate(rdate);
		vo.setRevImage(rimg);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("review", vo);
		Gson gson = new GsonBuilder().create();
		
		ProductService service = new ProductServiceImpl();
		System.out.println(service.updateReview(vo));
		
		if(service.updateReview(vo) > 0) {
			resultMap.put("retCode", "Success");
		} else {
			resultMap.put("retCode", "Fail");
		}
		
		return gson.toJson(resultMap) + ".json";
	}

}
