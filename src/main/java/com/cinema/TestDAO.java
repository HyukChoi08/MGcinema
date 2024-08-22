package com.cinema;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDAO {
	void insertCus(String a,int b,String c);
}
