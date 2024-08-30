package com.cinema.store;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired storeDAO storedao;
	@Autowired cartDAO cartdao;
	
	

	@GetMapping("/store")
	public String store(HttpServletRequest req) {
		
		return "store/store";
	}
	@GetMapping("/details")
	public String details(HttpServletRequest req,Model model) {
	    int id = Integer.parseInt(req.getParameter("id"));
	    System.out.println(id);
	    
		ArrayList<storeDTO> arPackage = storedao.selectpackage(id);
		System.out.println("item="+arPackage.size());
		ArrayList<storeDTO> arItem = storedao.selectitem(id);
		
		String imagePath = storedao.getImagePath(id);
		
//		HttpSession s=req.getSession();
//		String userid=(String) s.getAttribute("userid");
//		System.out.println(userid);
//		
//		model.addAttribute(userid);
		
		
		model.addAttribute("arPackage",arPackage);
		model.addAttribute("arItem",arItem);
		model.addAttribute("imagePath", imagePath);
		
		System.out.println(arPackage);
		System.out.println(arItem);
		System.out.println(imagePath);
		
	    return "store/details";
	}
	@GetMapping("/drink")
	public String drink(HttpServletRequest req) {
		
		return "store/drink";
	}
	@GetMapping("/popcorn")
	public String popcorn(HttpServletRequest req) {
		
		return "store/popcorn";
	}
	@GetMapping("/giftcard")
	public String giftcard(HttpServletRequest req) {
		
		return "store/giftcard";
	}
	@GetMapping("/admissionticket")
	public String addmissionticket(HttpServletRequest req) {
		
		return "store/admission_ticket";
	}
	@GetMapping("/package")
	public String pack(HttpServletRequest req) {
		
		return "store/package";
	}
	@GetMapping("/combo")
	public String combo(HttpServletRequest req) {
		
		return "store/combo";
	}
	@GetMapping("/snack")
	public String snack(HttpServletRequest req) {
		
		return "store/snack";
	}
	@GetMapping("/storepay")
	public String storepay(HttpServletRequest req) {
		
		
		return "store/storepay";
	}
	@GetMapping("/cart")
	public String cart(HttpServletRequest req,Model model) {

//		HttpSession s=req.getSession();
//		String userid=(String) s.getAttribute("userid");
//		System.out.println(userid);
//		
		String uid="rkd2";
		
		ArrayList<cartDTO> arCart=cartdao.selectcart(uid);
		
		
		model.addAttribute("arCart",arCart);
		
		return "store/cart";
	}
	@GetMapping("/gift")
	public String gift(HttpServletRequest req) {
		
		
		return "store/gift";
	}
	@PostMapping("/insertcart")
	@ResponseBody
	public String insertcart(HttpServletRequest req) {
		
		String customer_id=req.getParameter("customer_id");
		int item_id=Integer.parseInt(req.getParameter("item_id"));
		int qty=Integer.parseInt(req.getParameter("qty"));
		String total=req.getParameter("total");
		
		
		cartdao.insertcart(customer_id, item_id, qty, total);
		return "ok";
	}
	@PostMapping("/deletecart")
	@ResponseBody
	public String deletecart(HttpServletRequest req) {
		int item_id=Integer.parseInt(req.getParameter("item_id"));
		String customer_id=req.getParameter("customer_id");
		
		cartdao.deletecart(item_id, customer_id);
		
		return "ok";
	}
//    @PostMapping("/alldelete")
//    @ResponseBody
//    public String alldelete(@RequestBody DeleteRequest deleteRequest) {
//        List<Integer> itemIds = deleteRequest.getItems();
//        // DB에서 항목 삭제 처리
//        // deleteItemsFromDatabase(itemIds); // 적절한 서비스 메서드를 호출하여 DB에서 삭제
//        
//        return "success";
//    }
//	
//	
//	
	
	
	
}
