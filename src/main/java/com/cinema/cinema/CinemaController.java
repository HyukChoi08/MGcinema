package com.cinema.cinema;

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
public class CinemaController {
	@Autowired CinemaDAO cdao;
	
	@GetMapping("/cinema")
	public String cinema() {
		return "cinema/cinema";
	}
	
	@GetMapping("/park")
	public String park() {
		return "cinema/park";
	}
	
	@PostMapping("/moviedate")
	@ResponseBody
	public String moviedate(HttpServletRequest req,Model model) {
		String mdate = req.getParameter("mdate");
		System.out.println(mdate);
		ArrayList<MoviedateDTO> mlist = cdao.Moviedate(mdate);
		JSONArray Mli = new JSONArray();
		for(MoviedateDTO Mdto : mlist) {
			JSONObject T = new JSONObject();
			T.put("mname",Mdto.getMname());
			T.put("runningtime",Mdto.getRunningtime());
			T.put("age",Mdto.getAge());
			T.put("allseat",Mdto.getAllseat());
			T.put("Sname",Mdto.getSname());
			T.put("seatlevel",Mdto.getSeatlevel());
			T.put("moviedate",Mdto.getMoviedate());
			T.put("lestseat",Mdto.getLestseat());
			T.put("begintime",Mdto.getBegintime());
			T.put("endtime",Mdto.getEndtime());
			Mli.put(T);
		}
		return Mli.toString();
	}
	
}
