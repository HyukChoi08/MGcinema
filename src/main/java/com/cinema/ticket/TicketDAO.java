package com.cinema.ticket;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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

    customerDTO getCustomer(String uid);
    
    void insertData(String a,String b,String c,String d, String e, String f, String g , String h, String i, String j, String k);

    @Select("SELECT COUNT(*) FROM moviepay WHERE random_id = #{randomId}")
    int checkIfExists(@Param("randomId") String randomId);
    
    
    List<nowseatDTO> getOccupiedSeats(@Param("movieName") String movieName,
                                  @Param("roomName") String roomName,
                                  @Param("beginTime") String beginTime,
                                  @Param("dateTime") String dateTime);
    
    void updateSeat(String a, String b, String c, String d, int e);



}
