package com.cinema.store;

import java.util.ArrayList;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface cartDAO {
	
	void insertcart(String customer_id,int item_id,int qty,String total,int cust_id);
	ArrayList<cartDTO> selectcart(String userid,int cust_id);
	void deletecart(int id,String uid,int cust_id);
	void deletecart1(int id,String customer_id);
	int countcart(String customer_id,int cust_id);
	ArrayList<cartDTO> selectitem(int item_id);
	ArrayList<cartDTO> checkitem(int cust_id,int item_id);
	void updatecart(String customer_id,int item_id,int qty,int cust_id);
}

