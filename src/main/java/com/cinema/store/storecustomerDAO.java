package com.cinema.store;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface storecustomerDAO {
	
	 storecustomerDTO storecustomer(String uid);
	 void insertStorepay(String customer_id,String random_id,String item_name,String totalprice);
	 @Select("SELECT COUNT(*) FROM storepay WHERE random_id = #{randomId}")
	    int checkIfExists(@Param("randomId") String randomId);
	 
	 void clearcart(String customer_id,int item_id,int id);
	 storecustomerDTO storeage(String customer_id,int cust_id);

}
