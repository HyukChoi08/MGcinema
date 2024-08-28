package com.cinema.store;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface cartDAO {
	
	void insertcart(String customer_id,int item_id,int qty,String total);
	

}
