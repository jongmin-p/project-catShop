package com.yedam.zzim.service;

import java.util.List;

import com.yedam.zzim.vo.ZzimVO;

public interface ZzimService {
	
	public int addProductZzim(ZzimVO zzim);
	public ZzimVO ZzimList(String zzimuser, int proId);
	public int deleteProductZzim(String zzimuser, int proId);
}