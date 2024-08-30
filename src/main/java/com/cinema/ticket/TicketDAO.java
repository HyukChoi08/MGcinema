package com.cinema.ticket;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TicketDAO {
	
	List<movieDTO> getMovies();
	
	String getMovieimage(@Param("movieId") int movieId);

    List<theaterDTO> getTheaters(@Param("movieId") int movieId, @Param("date") String date);

    List<String> getDates(@Param("theaterId") int theaterId);

    List<timesDTO> getTimes(@Param("movieId") int movieId, @Param("date") String date, @Param("roomId") String roomId);

    void reserve(@Param("movieId") int movieId, @Param("theaterId") int theaterId, @Param("date") String date, @Param("time") String time);

    void reserveSeats(@Param("seats") List<String> seats, 
            @Param("movieId") int movieId, 
            @Param("theaterId") int theaterId, 
            @Param("date") String date, 
            @Param("time") String time);
    
    List<seatDTO> getSeats(@Param("theaterId") String theaterId);
    
    List<priceDTO> getTotalPrice(@Param("movieId") int movieId, @Param("roomId") String roomId, @Param("moviedate") String moviedate, @Param("begintime") String begintime );
}
