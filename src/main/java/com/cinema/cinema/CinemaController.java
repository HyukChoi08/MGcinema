package com.cinema.cinema;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CinemaController {
	
	
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
		return"z";
	}
}
