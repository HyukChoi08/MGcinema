package com.cinema.chartsecond;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class detailController {
	@Autowired DetailDAO ddao;
	
	@GetMapping("/chartdetail")
	public String chartdetail(HttpServletRequest req, Model model) {
//		int movieid = Integer.parseInt(req.getParameter("id"));
		return "chart_second/chartdetail";
	}

}
