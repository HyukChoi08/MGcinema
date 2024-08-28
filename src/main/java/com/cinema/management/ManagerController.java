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
		mmdao.schedules(movienum, roomnum, date, stime, etime);
		return "manager/manager";
	}
}
