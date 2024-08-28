package com.cinema.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomepageController {
@GetMapping("/home")
public String home() {
	return "home/homepage";
	}
}