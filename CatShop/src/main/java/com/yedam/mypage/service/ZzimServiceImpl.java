package com.yedam.mypage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mypage.mapper.ZzimMapper;
import com.yedam.mypage.vo.ZzimVO;

public class ZzimServiceImpl implements ZzimService{
	SqlSession session = DataSource.getInstance().openSession(true);
	ZzimMapper mapper = session.getMapper(ZzimMapper.class);
	
	@Override
	public List<ZzimVO> zzimList(String memId) {
		return mapper.zzimList(memId);
	}

	@Override
	public int deleteZzim(int zzimId) {
		return mapper.deleteZzim(zzimId);
		
	}
	
}
