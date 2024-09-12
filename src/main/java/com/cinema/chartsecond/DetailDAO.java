package com.cinema.chartsecond;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DetailDAO {
	movieDTO getMovieAll(int a);
}
