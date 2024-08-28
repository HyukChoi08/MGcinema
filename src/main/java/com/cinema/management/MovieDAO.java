package com.cinema.management;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieDAO {
	ArrayList<MovieDTO> movielist();
	ArrayList<RoomDTO> roomlist();
	void schedules(int a, int b, String c, String d, String e);
}
