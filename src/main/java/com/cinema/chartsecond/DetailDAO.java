package com.cinema.chartsecond;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DetailDAO {
	List<movieDTO> getMovieAll(int a);
}
