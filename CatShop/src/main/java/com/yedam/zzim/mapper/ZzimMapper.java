package com.yedam.zzim.mapper;

import java.util.List;

import com.yedam.zzim.vo.ZzimVO;

public interface ZzimMapper {
	
	public int insertProductZzim(ZzimVO zzim); // 제품 찜 추가
	public ZzimVO ZzimList(String zzimuser, int proId); // 유저가 찜한거 출력
	public int deleteProductZzim(String zzimuser, int proId); // 찜 취소
}
