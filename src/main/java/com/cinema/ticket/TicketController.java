package com.cinema.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public List<theaterDTO> getTheaters(@RequestParam int movieId, @RequestParam int date) {
		return tdao.getTheaters(movieId, date);
	}

	@GetMapping("/dates")
	@ResponseBody
	public List<String> getDates(@RequestParam int theaterId) {
		return tdao.getDates(theaterId);
	}

	@GetMapping("/times")
	@ResponseBody
	public List<String> getTimes(@RequestParam int theaterId, @RequestParam String date) {
		return tdao.getTimes(theaterId, date);
	}

	@PostMapping("/reserve")
	@ResponseBody
	public String reserveTicket(@RequestParam int movieId, @RequestParam int theaterId, @RequestParam String date, @RequestParam String time) {
		// 예매 처리 로직 추가
		tdao.reserve(movieId, theaterId, date, time);
		return "Success";
	}
}
