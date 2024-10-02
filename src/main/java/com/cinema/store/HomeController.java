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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.boot.web.servlet.error.ErrorController;

@Controller
public class HomeController implements ErrorController {

	@Autowired storeDAO storedao;
	@Autowired cartDAO cartdao;
	@Autowired storecustomerDAO customerdao;

	
	
	  @RequestMapping("error") 
	  public String handleError() {
	  
	  return "redirect:/"; ///
	  
	  }
	 
	 
	 
	@GetMapping("/storeall")
	public String storeall(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid"); // 세션에 저장된 uid 값을 가져온다.

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		ArrayList<storeDTO> arStore = storedao.storeall(); // 전체 상품 select를 통해서 나열하기.

		model.addAttribute("arStore", arStore); // 모델로 리스트 배열을 보냄.
		return "store/storeall";
	}

	@GetMapping("/store")
	public String store(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		ArrayList<storeDTO> arStore = storedao.selectbest();

		model.addAttribute("arStore", arStore);
		model.addAttribute("uid", uid);
		return "store/store";
	}

	@GetMapping("/details")
	public String details(HttpServletRequest req, Model model) {
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);

		storeDTO arItem = storedao.selectitem(id);

		String imagePath = storedao.getImagePath(id);

		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");

		System.out.println(uid);

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		model.addAttribute("arItem", arItem);
		model.addAttribute("imagePath", imagePath);

		System.out.println(arItem);
		System.out.println(imagePath);

		return "store/details";
	}

	@GetMapping("/drink")
	public String drink(HttpServletRequest req, Model model) {

		String item_type = "drink";

		ArrayList<storeDTO> arStore = storedao.selectType(item_type);

		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");
		System.out.println(uid);

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		model.addAttribute("arStore", arStore);
		model.addAttribute("uid", uid);

		return "store/drink";
	}

	@GetMapping("/popcorn")
	public String popcorn(HttpServletRequest req, Model model) {

		String item_type = "popcorn";

		ArrayList<storeDTO> arStore = storedao.selectType(item_type);

		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");
		System.out.println(uid);

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		model.addAttribute("arStore", arStore);
		model.addAttribute("uid", uid);

		return "store/popcorn";
	}

	@GetMapping("/giftcard")
	public String giftcard(HttpServletRequest req, Model model) {

		String item_type = "giftcard";

		ArrayList<storeDTO> arStore = storedao.selectType(item_type);

		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");
		System.out.println(uid);

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		model.addAttribute("uid", uid);
		model.addAttribute("arStore", arStore);

		return "store/giftcard";
	}

	@GetMapping("/package")
	public String pack(HttpServletRequest req, Model model) {
		String item_type = "package";

		ArrayList<storeDTO> arStore = storedao.selectType(item_type);

		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");
		System.out.println(uid);

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		model.addAttribute("uid", uid);
		model.addAttribute("arStore", arStore);
		return "store/package";
	}

	@GetMapping("/combo")
	public String combo(HttpServletRequest req, Model model) {
		String item_type = "combo";

		ArrayList<storeDTO> arStore = storedao.selectType(item_type);

		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");
		System.out.println(uid);

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		model.addAttribute("uid", uid);
		model.addAttribute("arStore", arStore);

		return "store/combo";
	}

	@GetMapping("/snack") // 지금은 드링크로 되어있는데 이거 스낵으로 수정해야됌
	public String snack(HttpServletRequest req, Model model) {

		String item_type = "snack";

		ArrayList<storeDTO> arStore = storedao.selectType(item_type);

		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");
		System.out.println(uid);

		if (uid != null) {
			model.addAttribute("uid", uid);
		} else {
			model.addAttribute("uid", ""); // 또는 다른 기본값
		}

		model.addAttribute("arStore", arStore);
		model.addAttribute("uid", uid);

		return "store/snack";
	}

	@GetMapping("/storepay")
	public String storepay(HttpServletRequest req) {

		return "store/storepay";
	}

	@GetMapping("/cart")
	public String cart(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String uid = (String) s.getAttribute("uid");

		// uid가 null인 경우 기본값 설정
		if (uid == null) {
			uid = ""; // 또는 다른 기본값
		}
		model.addAttribute("uid", uid);

		String id1 = (String) s.getAttribute("id");
		int cust_id = 0; // 기본값 설정

		if (id1 != null && !id1.isEmpty()) {
			// id1이 null도 아니고 빈 문자열도 아닐 경우 정수로 변환
			cust_id = Integer.parseInt(id1);
		}

		System.out.println(uid);

		ArrayList<cartDTO> arCart = cartdao.selectcart(uid, cust_id);
		model.addAttribute("arCart", arCart);

		return "store/cart";
	}

	@PostMapping("/insertcart")
	@ResponseBody
	public String insertcart(HttpServletRequest req) {

		HttpSession s = req.getSession();

		String customer_id = (String) s.getAttribute("uid");
		System.out.println(customer_id);
		String id1 = (String) s.getAttribute("id");
		int cust_id = Integer.parseInt(id1);

		int item_id = Integer.parseInt(req.getParameter("item_id"));
		int qty = Integer.parseInt(req.getParameter("qty"));
		String total = req.getParameter("total");

		cartdao.insertcart(customer_id, item_id, qty, total, cust_id);
		return "ok";
	}

	@PostMapping("/deletecart")
	@ResponseBody
	public String deletecart(HttpServletRequest req) {

		HttpSession s = req.getSession();
		String id1 = (String) s.getAttribute("id");
		int cust_id = Integer.parseInt(id1);

		int item_id = Integer.parseInt(req.getParameter("item_id"));
		String customer_id = req.getParameter("customer_id");

		cartdao.deletecart(item_id, customer_id, cust_id);

		return "ok";
	}

	@PostMapping("/updatecart")
	@ResponseBody
	public String updatecart(HttpServletRequest req) {

		HttpSession s = req.getSession();
		String id1 = (String) s.getAttribute("id");
		int cust_id = Integer.parseInt(id1);

		String customer_id = req.getParameter("customer_id");
		int item_id = Integer.parseInt(req.getParameter("item_id"));
		int qty = Integer.parseInt(req.getParameter("qty"));

		cartdao.updatecart(customer_id, item_id, qty, cust_id);

		return "ok";
	}

	@PostMapping("/choicedelete")
	@ResponseBody
	public String choicedelete(@RequestBody Map<String, List<String>> requestBody, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String customer_id = (String) session.getAttribute("uid");
		String id1 = (String) session.getAttribute("id");
		int cust_id = Integer.parseInt(id1);
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

				cartdao.deletecart(itemIdInt, customer_id, cust_id); // 데이터베이스에서 항목 삭제
			} catch (NumberFormatException e) {
				return "Invalid item ID: " + itemId;
			}
		}

		return "ok";
	}

	@PostMapping("/dostorepay")
	public String dostorepay(@RequestParam("productData") String productData,
			@RequestParam(value = "source", required = false) String source, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String customer_id = (String) session.getAttribute("uid");
		System.out.println("cust" + customer_id);

		ObjectMapper objectMapper = new ObjectMapper(); // JSON 데이터를 Java 객체로 변환하거나, Java 객체를 JSON으로 변환하는 데 사용.
		Map<String, Object> dataMap; // 키가 String이고 값이 Object인 Map 객체를 선언

		try {
			// JSON 문자열을 Map으로 변환
			dataMap = objectMapper.readValue(productData, new TypeReference<Map<String, Object>>() {
			});
			// JSON 문자열인 productData를 Map<String, Object> 형태로 변환하여 dataMap에 저장
			// - 각 JSON 키는 String 타입으로, 값은 Object 타입으로 매핑됨
			// - 예: {"totalPrice": 10000, "items": [...]}
		} catch (IOException e) {
			e.printStackTrace();
			// JSON 파싱 오류 처리
			dataMap = Map.of(); // 빈 Map으로 대체
		}

		// String source = (String) dataMap.get("source");

		// 변환된 데이터를 모델에 추가

		model.addAttribute("uid", customer_id);
		model.addAttribute("items", dataMap.get("items"));
		System.out.println(dataMap.get("items"));

		model.addAttribute("totalPrice", dataMap.get("totalPrice"));

		model.addAttribute("totalDiscount", dataMap.get("totalDiscount"));
		model.addAttribute("finalPrice", dataMap.get("finalPrice"));
		model.addAttribute("source", source);
		System.out.println("Source: " + source);

		System.out.println("Final Price: " + dataMap.get("finalPrice"));

		// JSP 파일명 반환
		return "store/storepay";
	}

	@PostMapping("/countcart")
	@ResponseBody
	public String conuntcart(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String customer_id = (String) session.getAttribute("uid");
		String id1 = (String) session.getAttribute("id");

		// 로그인하지 않았거나 id1이 null인 경우 0 반환
		if (customer_id == null || id1 == null || id1.isEmpty()) {
			return "0"; // 문자열 "0"을 반환
		}

		int cust_id = Integer.parseInt(id1);

		int n = cartdao.countcart(customer_id, cust_id);

		return "" + n;
	}

	@PostMapping("/selectitem")
	@ResponseBody
	public String selectitem(HttpServletRequest req) {
		int item_id = Integer.parseInt(req.getParameter("item_id"));
		System.out.println("item_id" + item_id);

		ArrayList<cartDTO> arCart = cartdao.selectitem(item_id);
		JSONArray ja = new JSONArray();
		for (cartDTO bdto : arCart) {
			JSONObject jo = new JSONObject();
			jo.put("id", bdto.getId());
			jo.put("discount_price", bdto.getDiscount_price());
			jo.put("price", bdto.getPrice());
			jo.put("composition", bdto.getComposition());
			jo.put("name", bdto.getItem_name());
			jo.put("image_path", bdto.getImage_path());

			ja.put(jo);
		}
		return ja.toString();
	}

	@PostMapping("/checkitem")
	@ResponseBody
	public String checkitem(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String customer_id = (String) session.getAttribute("uid");
		int item_id = Integer.parseInt(req.getParameter("item_id"));
		String id1 = (String) session.getAttribute("id");

		// id1이 null이거나 비어있을 경우 0 반환
		if (id1 == null || id1.isEmpty()) {
			return "0"; // 0을 반환
		}

		int cust_id = Integer.parseInt(id1);

		System.out.println("item: " + item_id);
		ArrayList<cartDTO> arCart = cartdao.checkitem(cust_id, item_id);

		JSONArray ja = new JSONArray();
		for (cartDTO bdto : arCart) {
			JSONObject jo = new JSONObject();
			jo.put("item_count", bdto.getItem_count());
			jo.put("item_qty", bdto.getItem_qty());
			ja.put(jo);
		}
		return ja.toString();
	}

	@GetMapping("/store/storecheck")
	public String storeCheckoutPage(@RequestParam("itemname") String itemname,
			@RequestParam("totalprice") String totalprice,
			@RequestParam(value = "source", required = false) String source,
			@RequestParam(value = "select", required = false) String select, // select 파라미터를 문자열로 받음

			HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String userid = (String) s.getAttribute("uid");
		storecustomerDTO arCustomer = customerdao.storecustomer(userid);

		model.addAttribute("id", arCustomer.getId());
		model.addAttribute("uid", arCustomer.getUid());
		model.addAttribute("passwd", arCustomer.getPasswd());
		model.addAttribute("realname", arCustomer.getRealname());
		model.addAttribute("nickname", arCustomer.getNickname());
		model.addAttribute("email", arCustomer.getEmail());
		model.addAttribute("mobile", arCustomer.getMobile());
		model.addAttribute("source", source); // source 값을 모델에 추가
		model.addAttribute("select", select);

		model.addAttribute("itemname", itemname);
		model.addAttribute("totalprice", totalprice);

		String orderId = UUID.randomUUID().toString();
		model.addAttribute("orderId", orderId);
		System.out.println("Source1111: " + source); // source 값 확인
		System.out.println("toto1" + totalprice);
		System.out.println("select" + select);
		return "store/storecheck";
	}

	@GetMapping("/storesuccess")
	public String storesuccess(@RequestParam Map<String, String> params, Model model) {
		// 파라미터 값 출력 (디버깅 용도)
		System.out.println("source: " + params.get("source"));
		System.out.println("orderId: " + params.get("orderId"));
		System.out.println("uid: " + params.get("uid"));
		System.out.println("itemname: " + params.get("itemname"));
		System.out.println("totalprice: " + params.get("totalprice"));
		System.out.println("select: " + params.get("select"));

		// 모델에 데이터 추가
		model.addAttribute("orderId", params.get("orderId"));
		model.addAttribute("uid", params.get("uid"));
		model.addAttribute("itemname", params.get("itemname"));
		model.addAttribute("totalprice", params.get("totalprice"));
		model.addAttribute("source", params.get("source")); // source 추가
		model.addAttribute("select", params.get("select"));

		return "store/storesuccess";
	}

	@GetMapping("/storeData")
	public String storeData(HttpServletRequest req) {

		String customer_id = req.getParameter("customer_id");
		String random_id = req.getParameter("random_id");
		String item_name = req.getParameter("item_name");
		String totalprice = req.getParameter("totalprice");

		int count = customerdao.checkIfExists(random_id);
		if (count > 0) {
			return "home/homepage"; // Or some appropriate response
		}

		customerdao.insertStorepay(customer_id, random_id, item_name, totalprice);

		return "store/store";

	}

	@PostMapping("/clearcart")
	@ResponseBody
	public String clearcart(HttpServletRequest req) {

		HttpSession s = req.getSession();
		String id1 = (String) s.getAttribute("id");
		int id = Integer.parseInt(id1);

		String customer_id = req.getParameter("customer_id");
		String select = req.getParameter("select");

		System.out.println("Received customer_id: " + customer_id);
		System.out.println("Received select: " + select);

		String[] selectArray = select.split(",");

		int[] itemIds = new int[selectArray.length];

		for (int i = 0; i < selectArray.length; i++) {
			// 문자열을 int로 변환
			itemIds[i] = Integer.parseInt(selectArray[i].trim());

		}

		for (int item_id : itemIds) {
			System.out.println("item_id" + item_id);
			// 여기에 itemId를 사용하여 필요한 처리를 수행합니다.
			// 예: 장바구니에서 특정 아이템 제거
			customerdao.clearcart(customer_id, item_id, id);
		}

		return "ok";
	}

	@PostMapping("/storeage")
	@ResponseBody
	public storecustomerDTO storeage(HttpServletRequest req) throws Exception {
		HttpSession s = req.getSession();
		String customer_id1 = (String) s.getAttribute("uid");
		String customer_id;

		String id1 = (String) s.getAttribute("id");
		int cust_id;

		if (customer_id1 != null) {
			customer_id = (String) s.getAttribute("uid"); // customer_id가 null이 아닐 때 uid를 설정
		} else {
			customer_id = ""; // customer_id가 null일 때 빈 문자열 설정

		}
		if (id1 != null) {
			// id1이 null이 아닐 때만 정수로 변환
			if (!id1.isEmpty()) {
				cust_id = Integer.parseInt(id1); // id1을 정수로 변환
			} else {
				cust_id = 0; // 빈 문자열일 경우 기본값 설정
			}
		} else {
			cust_id = 0; // id1이 null인 경우 기본값 설정
		}

		storecustomerDTO arAge = customerdao.storeage(customer_id, cust_id);

		// JSON으로 변환
		return arAge; // Spring이 자동으로 JSON으로 변환하여 반환합니다.
	}

}
