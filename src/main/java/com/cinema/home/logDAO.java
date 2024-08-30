package com.cinema.home;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface logDAO {
	int loginCheck(String uid, String passwd);	// 로그인
}
