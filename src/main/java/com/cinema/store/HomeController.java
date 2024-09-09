package com.cinema.store;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired storeDAO storedao;
	@Autowired cartDAO cartdao;
	@Autowired storecustomerDAO customerdao;
	
	

	@GetMapping("/store")

	public String store(HttpServletRequest req,Model model) {
	
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
		
		HttpSession s=req.getSession();
		String uid=(String) s.getAttribute("uid");
		System.out.println(uid);
		
	    if (uid != null) {
            model.addAttribute("uid", uid);
        } else {
            model.addAttribute("uid", ""); // 또는 다른 기본값
        }
		
	    
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
	public String pack(HttpServletRequest req,Model model) {
		
		HttpSession s=req.getSession();
		String uid=(String) s.getAttribute("uid");
		System.out.println(uid);
		
		model.addAttribute("uid",uid);
		return "store/package";
	}
	@GetMapping("/combo")
	public String combo(HttpServletRequest req,Model model) {
		HttpSession s=req.getSession();
		String uid=(String) s.getAttribute("uid");
		System.out.println(uid);
		
		model.addAttribute("uid",uid);
		
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

		HttpSession s=req.getSession();
		String uid=(String) s.getAttribute("uid");
		System.out.println(uid);
		
		
		ArrayList<cartDTO> arCart=cartdao.selectcart(uid);
		
		model.addAttribute("uid",uid);
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
		
		HttpSession s=req.getSession();		
		
		String customer_id=(String) s.getAttribute("uid");
		System.out.println(customer_id);
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
	@PostMapping("/updatecart")
	@ResponseBody
	public String updatecart(HttpServletRequest req) {
		String customer_id=req.getParameter("customer_id");
		int item_id=Integer.parseInt(req.getParameter("item_id"));
		int qty=Integer.parseInt(req.getParameter("qty"));
				
		cartdao.updatecart(customer_id, item_id, qty);
		
		return "ok";
	}
	
	@PostMapping("/choicedelete")
	@ResponseBody
	public String choicedelete(@RequestBody Map<String, List<String>> requestBody, HttpServletRequest req) {
	    HttpSession session = req.getSession();
	    String customer_id = (String) session.getAttribute("uid");
	    if (customer_id == null) {
	        return "User not logged in";
	    }
	    
	    List<String> itemIds = requestBody.get("item_id");
	    if (itemIds == null || itemIds.isEmpty()) {
	        return "No items selected";
	    }
	    
	    for (String itemId : itemIds) {
	        try {
	            int itemIdInt = Integer.parseInt(itemId);
	            cartdao.deletecart(itemIdInt, customer_id); // 데이터베이스에서 항목 삭제
	        } catch (NumberFormatException e) {
	            return "Invalid item ID: " + itemId;
	        }
	    }
	    
	    return "ok";
	}
	
    @PostMapping("/dostorepay")
    public String dostorepay(@RequestParam("productData") String productData, Model model,HttpServletRequest req) {
    	HttpSession session = req.getSession();
  	    String customer_id = (String) session.getAttribute("uid");
  	    System.out.println("cust"+customer_id);
    	
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> dataMap;

        try {
            // JSON 문자열을 Map으로 변환
            dataMap = objectMapper.readValue(productData, new TypeReference<Map<String, Object>>() {});
        } catch (IOException e) {
            e.printStackTrace();
            // JSON 파싱 오류 처리
            dataMap = Map.of(); // 빈 Map으로 대체
        }

        // 변환된 데이터를 모델에 추가
    
        model.addAttribute("uid",customer_id);
        model.addAttribute("items", dataMap.get("items"));
        System.out.println(dataMap.get("items"));
   
        
        
        
        model.addAttribute("totalPrice", dataMap.get("totalPrice"));
     
        model.addAttribute("totalDiscount", dataMap.get("totalDiscount"));
        model.addAttribute("finalPrice", dataMap.get("finalPrice"));
        
        System.out.println("Final Price: " + dataMap.get("finalPrice"));

        // JSP 파일명 반환
        return "store/storepay";
    }
	@PostMapping("/countcart")
	@ResponseBody
	public String conuntcart(HttpServletRequest req) {
		  HttpSession session = req.getSession();
		  String customer_id = (String) session.getAttribute("uid");
		
		  int n=cartdao.countcart(customer_id);
		  
		return ""+n;
	}
	   @PostMapping("/selectitem")
	    @ResponseBody
	    public String selectitem(HttpServletRequest req) {
	    	 int item_id = Integer.parseInt(req.getParameter("item_id"));
	    	 System.out.println("item_id"+item_id);
	    	
	    	ArrayList<cartDTO> arCart =cartdao.selectitem(item_id);
			JSONArray ja= new JSONArray();
			for(cartDTO bdto : arCart) {
				JSONObject jo = new JSONObject();
				jo.put("id", bdto.getId());
				jo.put("discount_price",bdto.getDiscount_price());
				jo.put("price", bdto.getPrice());
				jo.put("composition", bdto.getComposition());
				jo.put("name",bdto.getItem_name());
				jo.put("image_path",bdto.getImage_path());

				ja.put(jo);		
			}
			return ja.toString();
	    }
	   @PostMapping("/checkitem")
	   @ResponseBody
	   public String checkitem(HttpServletRequest req) {
		   HttpSession session = req.getSession();
		   String customer_id = (String) session.getAttribute("uid");
		   int item_id=Integer.parseInt(req.getParameter("item_id"));
				
		   System.out.println("item"+item_id);
		   ArrayList<cartDTO> arCart =cartdao.checkitem(customer_id,item_id);
			JSONArray ja= new JSONArray();
			for(cartDTO bdto : arCart) {
				JSONObject jo = new JSONObject();
//				jo.put("id", bdto.getId());
				jo.put("item_count", bdto.getItem_count()); 
				jo.put("item_qty",bdto.getItem_qty());

				ja.put(jo);		
			}
			return ja.toString();	   
	   }
	   @GetMapping("/store/storecheck")
	    public String storeCheckoutPage(@RequestParam("itemname") String itemname,
	            						@RequestParam("totalprice") String totalprice,

	            						HttpServletRequest req, Model model) {
			HttpSession s =req.getSession();
			String userid= (String) s.getAttribute("uid");
			storecustomerDTO arCustomer = customerdao.storecustomer(userid);
		
			model.addAttribute("id", arCustomer.getId());
	        model.addAttribute("uid", arCustomer.getUid());
	        model.addAttribute("passwd", arCustomer.getPasswd());
	        model.addAttribute("realname", arCustomer.getRealname());
	        model.addAttribute("nickname", arCustomer.getNickname());
	        model.addAttribute("email", arCustomer.getEmail());
	        model.addAttribute("mobile", arCustomer.getMobile());
	        
	        model.addAttribute("itemname", itemname);       	        
	        model.addAttribute("totalprice", totalprice);

	        String orderId = UUID.randomUUID().toString();
	        model.addAttribute("orderId", orderId);
	        
	        System.out.println("toto1"+totalprice);
	        return "store/storecheck";
    }
	   
	@GetMapping("/storesuccess")
	public String storesuccess(@RequestParam Map<String,String> params,Model model) {
		
		   model.addAttribute("orderId", params.get("orderId"));
		   model.addAttribute("uid", params.get("uid"));
		   model.addAttribute("itemname", params.get("itemname"));
		   model.addAttribute("totalprice", params.get("totalprice"));	

		
		   System.out.println("toto2"+params.get("totalprice"));
		return "store/storesuccess";
	}
	
	@GetMapping("/storeData")
	public String storeData(HttpServletRequest req) {
		
		String customer_id=req.getParameter("customer_id");
		String random_id=req.getParameter("random_id");
		String item_name=req.getParameter("item_name");
		String totalprice=req.getParameter("totalprice");
		
		  int count =customerdao.checkIfExists(random_id);
		    if (count > 0) {
		        return "home/homepage"; // Or some appropriate response
		    }
		
		
		customerdao.insertStorepay(customer_id,random_id,item_name,totalprice);	
		
		
		
		return "ok";
	}	

	
	   
	   
	   
	
}
