package com.yedam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.mypage.service.ZzimService;
import com.yedam.mypage.service.ZzimServiceImpl;

public class ZzimDeleteControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] arrStr = req.getParameterValues("arrStr");
		ZzimService service = new ZzimServiceImpl();
		
		try {
		       if(arrStr !=null && arrStr.length > 0) {
		            for(int i=0; i<arrStr.length; i++) {		              
		               service.deleteZzim(Integer.parseInt(arrStr[i]));
		       	    }
		       	} 
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		
		return "success.json";
	}

}
