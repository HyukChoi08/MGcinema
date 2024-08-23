package com.cinema.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TicketController {
	@Autowired TicketDAO tdao;
	
	@GetMapping("/ticket")
	public String ticket() {
		return "ticketweb/ticket";
	}

	@GetMapping("/movies")
	@ResponseBody
	public List<movieDTO> getMovies() {
		return tdao.getMovies();
	}

	@GetMapping("/theaters")
	@ResponseBody
	public List<theaterDTO> getTheaters(@RequestParam("movieId") int movieId, @RequestParam("date") String date) {
		return tdao.getTheaters(movieId, date);
	}

	@GetMapping("/dates")
	@ResponseBody
	public List<String> getDates(@RequestParam int theaterId) {
		return tdao.getDates(theaterId);
	}

	@GetMapping("/times")
	@ResponseBody
	public List<timesDTO> getTimes(@RequestParam("movieId") int movieId, @RequestParam("date") String date, @RequestParam("roomId") String roomId) {
		return tdao.getTimes(movieId, date, roomId);
	}

	@PostMapping("/reserve")
	@ResponseBody
	public String reserveTicket(@RequestParam int movieId, @RequestParam int theaterId, @RequestParam String date, @RequestParam String time) {
		// 예매 처리 로직 추가
		tdao.reserve(movieId, theaterId, date, time);
		return "Success";
	}
	
	@PostMapping("/ticket/")
	@ResponseBody
	public String ticketdata(HttpServletRequest req) {
		String mname = req.getParameter("mname");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		String room = req.getParameter("room");
		System.out.println(mname + date + time + room);
		return "";
	}
}
