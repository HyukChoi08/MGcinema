package com.cinema.management;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class ManagerController {
	@Autowired MovieDAO mmdao;
	@GetMapping("/manager")
	public String manager() {
		return "manager/manager";
	}
	
	@PostMapping("/mlist")
	@ResponseBody
	public String mlist() {
		ArrayList<MovieDTO> a = mmdao.movielist();
		JSONArray Ty = new JSONArray();
		for(MovieDTO Rdto : a) {
			JSONObject T = new JSONObject();
			T.put("id",Rdto.getId());
			T.put("mname",Rdto.getMname());
			T.put("runningtime",Rdto.getRunningtime());
			Ty.put(T);
		}
		return Ty.toString();
	}
	@PostMapping("/rlist")
	@ResponseBody
	public String rlist() {
		ArrayList<RoomDTO> a = mmdao.roomlist();
		JSONArray Ty = new JSONArray();
		for(RoomDTO Rdto : a) {
			JSONObject T = new JSONObject();
			T.put("id",Rdto.getId());
			T.put("Sname",Rdto.getSname());
			T.put("seatlevel",Rdto.getSeatlevel());
			T.put("allseat",Rdto.getAllseat());
			T.put("adult_price",Rdto.getAdult_price());
			T.put("young_price",Rdto.getYoung_price());
			Ty.put(T);
		}
		return Ty.toString();
	}
	@PostMapping("/playlistin")
	@ResponseBody
	public String playlistin(HttpServletRequest req,Model model) {
		int movienum = Integer.parseInt(req.getParameter("movienum"));
		int roomnum = Integer.parseInt(req.getParameter("roomnum"));
		String date = req.getParameter("date");
		String stime = req.getParameter("stime");
		String etime = req.getParameter("etime");
		int seat = Integer.parseInt(req.getParameter("seat"));
		int aprice = Integer.parseInt(req.getParameter("aprice"));
		int yprice = Integer.parseInt(req.getParameter("yprice"));
		String ptype = req.getParameter("ptype");
		mmdao.schedules(movienum, roomnum, date, stime, etime, seat, aprice, yprice, ptype);
		return "manager/manager";
	}
	@PostMapping("/schedules")
	@ResponseBody
	public String schedules(HttpServletRequest req,Model model) {
		ArrayList<ScheDTO> a = mmdao.getschedules();
		JSONArray Ty = new JSONArray();
		for(ScheDTO Rdto : a) {
			JSONObject T = new JSONObject();
			T.put("id",Rdto.getId());
			T.put("Sname",Rdto.getSname());
			T.put("seatlevel",Rdto.getSeatlevel());
			T.put("mname",Rdto.getMname());
			T.put("moviedate",Rdto.getMoviedate());
			T.put("runningtime",Rdto.getRunningtime());
			T.put("age",Rdto.getAge());
			T.put("lestseat",Rdto.getLestseat());
			T.put("begintime",Rdto.getBegintime());
			T.put("endtime",Rdto.getEndtime());
			T.put("a_price",Rdto.getA_price());
			T.put("y_price",Rdto.getY_price());
			T.put("timetype",Rdto.getTimetype());
			Ty.put(T);
		}
		return Ty.toString();
	}
	@PostMapping("/schedel")
	@ResponseBody
	public String schedel(HttpServletRequest req,Model model) {
		int delid = Integer.parseInt(req.getParameter("delid"));
		mmdao.schedel(delid);
		return "manager/manager";
	}
	@PostMapping("/moviedel")
	@ResponseBody
	public String moviedel(HttpServletRequest req,Model model) {
		int delid = Integer.parseInt(req.getParameter("delid"));
		System.out.println(delid);
		mmdao.moviedel(delid);
		return "manager/manager";
	}
	@PostMapping("/showmovie")
	@ResponseBody
	public String showmovie(HttpServletRequest req,Model model) {
		ArrayList<MovieinfoDTO> a = mmdao.getmovieinfo();
		JSONArray Ty = new JSONArray();
		for(MovieinfoDTO Rdto : a) {
			JSONObject T = new JSONObject();
			T.put("id",Rdto.getId());
			T.put("reservation",Rdto.getReservation());
			T.put("mname",Rdto.getMname());
			T.put("imagepath",Rdto.getImagepath());
			T.put("runningtime",Rdto.getRunningtime());
			T.put("age",Rdto.getAge());
			T.put("director",Rdto.getDirector());
			T.put("cast",Rdto.getCast());
			T.put("genre",Rdto.getGenre());
			T.put("releasedate",Rdto.getReleasedate());
			T.put("movieinfo",Rdto.getMovieinfo());
			Ty.put(T);
		}
		return Ty.toString();
	}
	@PostMapping("/moviein")
	@ResponseBody
	public String moviein(HttpServletRequest req,Model model) {
		String mname = req.getParameter("mname");
		String age = req.getParameter("age");
		String runtime = req.getParameter("runtime");
		String image = req.getParameter("image");
		String director = req.getParameter("director");
		String cast = req.getParameter("cast");
		String genre = req.getParameter("genre");
		String rdate = req.getParameter("rdate");
		String minfo = req.getParameter("minfo");
		float reservation = 0.0f;
		mmdao.moviein(mname, age, runtime, image, director, cast, genre, rdate, minfo, reservation);
		return "manager/manager";
	}
	@PostMapping("/showitem")
	@ResponseBody
	public String showitem(HttpServletRequest req,Model model) {
		ArrayList<ItemDTO> a = mmdao.itemlist();
		JSONArray Ty = new JSONArray();
		for(ItemDTO Rdto : a) {
			JSONObject T = new JSONObject();
			T.put("id",Rdto.getId());
			T.put("item_name",Rdto.getItem_name());
			T.put("price",Rdto.getPrice());
			T.put("discount_price",Rdto.getDiscount_price());
			T.put("composition",Rdto.getComposition());
			T.put("origin",Rdto.getOrigin());
			T.put("image_path",Rdto.getImage_path());
			Ty.put(T);
		}
		return Ty.toString();
	}
	@PostMapping("/itemin")
	@ResponseBody
	public String itemin(HttpServletRequest req,Model model) {
		String itemname = req.getParameter("itemname");
		String itemprice = req.getParameter("itemprice");
		String disprice = req.getParameter("disprice");
		String conposition = req.getParameter("conposition");
		String origin = req.getParameter("origin");
		String itemimage = req.getParameter("itemimage");
		mmdao.itemin(itemname, itemprice, disprice, conposition, origin, itemimage);
		return "manager/manager";
	}
	@PostMapping("/showdetail")
	@ResponseBody
	public String showdetail(HttpServletRequest req,Model model) {
		ArrayList<DetailDTO> a = mmdao.detaillist();
		JSONArray Ty = new JSONArray();
		for(DetailDTO Rdto : a) {
			JSONObject T = new JSONObject();
			T.put("id",Rdto.getId());
			T.put("item_id",Rdto.getItem_id());
			T.put("name",Rdto.getName());
			T.put("period",Rdto.getPeriod());
			Ty.put(T);
		}
		return Ty.toString();
	}
}
