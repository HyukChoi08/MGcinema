package com.cinema.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface chartDAO {

ArrayList<chartDTO> chartList(String sortCriteria, int pageSize, int pageNumber);
ArrayList<chartDTO> chartList1();
String chartList2(int id); 
chartDTO chartList3(int id);
chartmoviepayDTO putreservation(@Param("param1") String getmname);//예매율 구하는것
void updatereservation(String getmname);
void updaterenewal();
}