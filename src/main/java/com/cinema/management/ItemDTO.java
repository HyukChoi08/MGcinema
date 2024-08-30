package com.cinema.management;

import lombok.Data;

@Data
public class ItemDTO {
	int id;
	String item_name;
	String price;
	String discount_price;
	String composition;
	String origin;
	String image_path;
}
