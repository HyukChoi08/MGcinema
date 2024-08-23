package com.cinema.cinema;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CinemaDAO {
	ArrayList<MoviedateDTO> Moviedate(String a);
	ArrayList<MovienameDTO> Moviename(String a);
	ArrayList<RoominfoDTO> Roominfo(String a,String b);
}