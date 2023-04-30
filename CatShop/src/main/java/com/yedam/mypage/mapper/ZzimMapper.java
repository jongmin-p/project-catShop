package com.yedam.mypage.mapper;

import java.util.List;

import com.yedam.mypage.vo.ZzimVO;


public interface ZzimMapper {
	public List<ZzimVO> zzimList(String memId);

	public int deleteZzim(int zzimId);
}
