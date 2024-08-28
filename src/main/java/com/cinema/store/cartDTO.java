package com.cinema.store;

import lombok.Data;

@Data
public class cartDTO {
	int id;
	String customer_id;
	int item_id;
	int qty;
	String total;
	
	

}
