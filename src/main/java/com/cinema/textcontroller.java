package com.cinema;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class textcontroller {
	@Autowired TestDAO tdao;
	
	@GetMapping("/")
	public String main() {
		return "ticket";
	}
	
	@PostMapping("/addMenu")
	@ResponseBody
	public String Addmenu(HttpServletRequest req) {
		String name = req.getParameter("realname");
		String price = req.getParameter("passwd");
		System.out.println(name+price);
		tdao.insertCus(name, Integer.parseInt(price), name);
		
		return "ok";
	}

}
