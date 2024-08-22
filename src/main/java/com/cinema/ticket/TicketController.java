package com.cinema.ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TicketController {
	@Autowired TicketDAO tdao;
	
	@GetMapping("/ticket")
	public String ticket() {
		return "ticketweb/ticket";
	}

}
