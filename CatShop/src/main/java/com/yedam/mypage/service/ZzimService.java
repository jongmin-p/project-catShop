package com.yedam.mypage.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.yedam.mypage.vo.ZzimVO;

public interface ZzimService {
	
	
	public List<ZzimVO> zzimList(String memId);

	public int deleteZzim(int zzimId); 
	
	
}
