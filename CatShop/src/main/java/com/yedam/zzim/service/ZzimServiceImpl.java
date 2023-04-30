package com.yedam.zzim.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.zzim.mapper.ZzimMapper;
import com.yedam.zzim.vo.ZzimVO;

public class ZzimServiceImpl implements ZzimService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ZzimMapper mapper = session.getMapper(ZzimMapper.class);
	
	@Override
	public int addProductZzim(ZzimVO zzim) {
		return mapper.insertProductZzim(zzim);
	}

	@Override
	public ZzimVO ZzimList(String zzimuser, int proId) {
		return mapper.ZzimList(zzimuser, proId);
	}

	@Override
	public int deleteProductZzim(String zzimuser, int proId) {
		return mapper.deleteProductZzim(zzimuser, proId);
//		System.out.println(zzimuser + " " + proId);
//		return 0;
	}
	
	
	
}
