package com.cinema.cinema;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}
