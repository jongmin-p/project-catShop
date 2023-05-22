package com.yedam.zzim.mapper;

import java.util.List;

import com.yedam.zzim.vo.ZzimVO;

public interface ZzimMapper {
	
	public int insertProductZzim(ZzimVO zzim);
	public ZzimVO ZzimList(String zzimuser, int proId);
	public int deleteProductZzim(String zzimuser, int proId);
}