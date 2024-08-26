package com.cinema.ticket;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TicketDAO {
	
	List<movieDTO> getMovies();

    List<theaterDTO> getTheaters(@Param("movieId") int movieId, @Param("date") String date);

    List<String> getDates(@Param("theaterId") int theaterId);

    List<timesDTO> getTimes(@Param("movieId") int movieId, @Param("date") String date, @Param("roomId") String roomId);

    void reserve(@Param("movieId") int movieId, @Param("theaterId") int theaterId, @Param("date") String date, @Param("time") String time);

    void reserveSeats(@Param("seats") List<String> seats, 
            @Param("movieId") int movieId, 
            @Param("theaterId") int theaterId, 
            @Param("date") String date, 
            @Param("time") String time);
}
