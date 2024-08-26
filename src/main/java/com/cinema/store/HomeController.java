package com.cinema.store;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
	
	@Autowired storeDAO itemdao;
	
	
	@GetMapping("/store")
	public String store(HttpServletRequest req) {
		
		return "store/store";
	}
	@GetMapping("/details")
	public String details(HttpServletRequest req,Model model) {
	    int id = Integer.parseInt(req.getParameter("id"));
	    System.out.println(id);
	    
		ArrayList<storeDTO> arPackage = itemdao.selectpackage(id);
		System.out.println("item="+arPackage.size());
		ArrayList<storeDTO> arItem = itemdao.selectitem(id);
		
		String imagePath = itemdao.getImagePath(id);
		
		model.addAttribute("arPackage",arPackage);
		model.addAttribute("arItem",arItem);
		model.addAttribute("imagePath", imagePath);
	
	    return "store/details";
	}
	
	

}
