package com.cinema.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface chartDAO {

ArrayList<chartDTO> chartList();
ArrayList<chartDTO> chartList1();
}

