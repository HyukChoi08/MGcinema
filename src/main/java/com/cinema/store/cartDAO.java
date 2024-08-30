package com.cinema.store;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface cartDAO {
	
	void insertcart(String customer_id,int item_id,int qty,String total);
	ArrayList<cartDTO> selectcart(String userid);
	void deletecart(int id,String uid);
	//void deleteItems(List<Integer> itemIds);
}
