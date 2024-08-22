package com.cinema.ticket;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TicketDAO {
	
	List<movieDTO> getMovies();

    List<theaterDTO> getTheaters(@Param("movieId") int movieId);

    List<String> getDates(@Param("theaterId") int theaterId);

    List<String> getTimes(@Param("theaterId") int theaterId, @Param("date") String date);

    void reserve(@Param("movieId") int movieId, @Param("theaterId") int theaterId, @Param("date") String date, @Param("time") String time);

}
