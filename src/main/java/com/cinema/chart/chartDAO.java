package com.cinema.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface chartDAO {

ArrayList<chartDTO> chartList();
ArrayList<chartDTO> chartList1();
String chartList2(int id); 
chartDTO chartList3(int id);
chartmoviepayDTO putreservation(@Param("param1") String getmname);
}

