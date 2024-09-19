package com.cinema.chartsecond;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DetailDAO {
	List<movieDTO> getMovieAll(int a);
	
	String  dirimg(@Param("movieid") int movieid,@Param("dirn") String dirn);
	
	List<castDTO> getCastImages(@Param("movieid") int movieid, @Param("castNames") List<String> castNames);
	
	List<cutDTO> getCutimg(@Param("movieid") int movieid);
}
