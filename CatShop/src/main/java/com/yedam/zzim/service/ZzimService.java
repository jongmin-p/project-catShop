package com.yedam.zzim.service;

import java.util.List;

import com.yedam.zzim.vo.ZzimVO;

public interface ZzimService {
	
	public int addProductZzim(ZzimVO zzim); // 제품 찜에 추가
	public ZzimVO ZzimList(String zzimuser, int proId); // 유저가 찜한거 출력
	public int deleteProductZzim(String zzimuser, int proId); // 찜 취소

}
