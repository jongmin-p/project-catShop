package com.yedam.notice.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;

public class NoticeDeleteControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 Map<String, Object> resultMap = new HashMap<String, Object>();
		   // ajax를 통해 넘어온 배열 데이터 선언
		   String[] arrStr = req.getParameterValues("arrStr");
		   
		   NoticeService service = new NoticeServiceImpl();
		  
		   try {
		       if(arrStr !=null && arrStr.length > 0) {
		            for(int i=0; i<arrStr.length; i++) {		              
		               service.deleteNotice(Integer.parseInt(arrStr[i]));
		       	    }
		       	} 
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
			
			return "Success.json";
	
	}

}
