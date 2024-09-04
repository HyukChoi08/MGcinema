package com.cinema.store;

import java.util.ArrayList;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface cartDAO {
	
	void insertcart(String customer_id,int item_id,int qty,String total);
	ArrayList<cartDTO> selectcart(String userid);
	void deletecart(int id,String uid);
	void deletecart1(int id,String customer_id);
	int countcart(String customer_id);
	ArrayList<cartDTO> selectitem(int item_id);
	ArrayList<cartDTO> checkitem(String customer_id,int item_id);
}

