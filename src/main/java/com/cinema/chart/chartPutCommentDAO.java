package com.cinema.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface chartPutCommentDAO {
	  void putcomment(int moviechart, String content, String writer, String uid, int rate);
ArrayList<chartPutCommentDTO> selectputcomment(int id);
void updatereview(int id, String content, int rate, String userId);
void deletereview(int id);
int count(String moviename);

chartPutCommentDTO selectMovieReview(String userId, int movieId);

double selectMovieAverageRate(int movieId);


}
