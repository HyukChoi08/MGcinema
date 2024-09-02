package com.cinema.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface commentArrayDAO {
ArrayList<commentArrayDTO> commentArray();
}
