package com.yedam.member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;
import com.yedam.member.vo.MemberVO;

public class selectCouponControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String json = "";
			String memId = req.getParameter("memId");
			Map<String,Object> resultMap = new HashMap<>();
			Gson gson = new GsonBuilder().create();
			
		if(memId != null) {
			MemberService service = new MemberServiceMybatis();
			List<MemberVO> list = service.selectCoupon(memId);
			
			System.out.println(service.selectCoupon(memId));
			
			if(list != null) {
				resultMap.put("cvo", list);
				resultMap.put("retCode","Success");

			} else {
				resultMap.put("retCode","Fail");
			}
		} else {
			resultMap.put("retCode","NoMemeber");
		}
		
		
		return gson.toJson(resultMap) + ".json";
	}

}
