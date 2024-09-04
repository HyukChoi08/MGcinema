package com.cinema.cinema;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CinemaDAO {
	ArrayList<MoviedateDTO> Moviedate(String a);
	ArrayList<MovienameDTO> Moviename(String a);
	ArrayList<Roominfo2DTO> Roominfo2(String a);
	ArrayList<TimeDTO> gettime(String a);
}
