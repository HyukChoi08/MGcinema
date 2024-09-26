package com.cinema.management;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieDAO {
	ArrayList<MovieDTO> movielist();
	ArrayList<RoomDTO> roomlist();
	void schedules(int a, int b, String c, String d, String e, int f, int g, int h, String i);
	ArrayList<ScheDTO> getschedules();
	void schedel(int a);
	ArrayList<MovieinfoDTO> getmovieinfo();
	void moviedel(int a);
	void itemdel(int a);
	void inquirydel(int a);
	void newsdel(int a);
	void moviein(String a, String o, String i, String u, String y, String t, String r, String e, String w, float q, float s);
	ArrayList<ItemDTO> itemlist();
	ArrayList<InquiryDTO> inquirylist();
	ArrayList<NewsDTO> newslist();
	void itemin(String a,String b,String c,String d,String e,String f,String g,String h);
	void newsin(String a,String b,String c);
	void inquiryup(int a,String b);
	void newsup(int a,String b,String c,String d);
	void roomup(int a,String b,String c,String d);
	void itemup(int a,String b,String c,String d,String e,String f,String g,String h,String i);
	void bestzero();
	void bestitems(int a, int b);
	ArrayList<SalesDTO> msaleslist(String a);
	ArrayList<SalesDTO> ssaleslist(String a);
}
