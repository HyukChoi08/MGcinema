package com.cinema.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface chartPutCommentDAO {
void putcomment(int moviechart,String content,String writer);
ArrayList<chartPutCommentDTO> selectputcomment();
}
