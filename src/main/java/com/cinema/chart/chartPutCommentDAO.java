package com.cinema.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface chartPutCommentDAO {
	  void putcomment(int moviechart, String content, String writer, String uid, int rate, int customer_id);
ArrayList<chartPutCommentDTO> selectputcomment(int moviechart);
void updatereview(int id, String content, int rate, String userId);
void deletereview(int id);
int count(String moviename);

chartPutCommentDTO selectMovieReview(String userId, int movieId,String customer_id);

double selectMovieAverageRate(int movieId);

 int buyTicketCheck(int c_id, String customer_id,String movie_name);



}
