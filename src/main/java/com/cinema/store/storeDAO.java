package com.cinema.store;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface storeDAO {

	ArrayList<storeDTO> selectpackage(int id);
	ArrayList<storeDTO> selectitem(int id);
	String getImagePath(int id);
	
	
	
}
