package com.cinema.management;

import lombok.Data;

@Data
public class RoomDTO {
	int id;
	String Sname;
	String seatlevel;
	String allseat;
	int adult_price;
	int young_price;
}
