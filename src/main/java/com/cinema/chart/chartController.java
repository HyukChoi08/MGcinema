package com.cinema.chart;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class chartController {
@Autowired chartDAO cdao;
@Autowired chartArrayDAO cadao;	

@GetMapping("/chart")
public String test() {
	return "chart/chartList";
}
@GetMapping("/chartList1")
public String chartList1(HttpServletRequest req, Model model) {
	int id = Integer.parseInt(req.getParameter("id"));
	System.out.println("id"+id);
	
	String archart = cdao.chartList2(id);
	
	model.addAttribute("chartList2",archart);
	
	return "chart/chartList1";
}
@PostMapping("/chartList")//무비 차트 정렬시키는것
@ResponseBody
public String chartList() {
	ArrayList<chartDTO> ar = cdao.chartList();
	
	JSONArray ja = new JSONArray();
	for(chartDTO cdto : ar) {
		JSONObject jo =new JSONObject();
		jo.put("id", cdto.getId());
		jo.put("image",cdto.getImage());
		jo.put("reservationrate",cdto.getReservationrate());
		jo.put("title", cdto.getTitle());
				
		ja.put(jo);
	}
	return ja.toString();
}

@PostMapping("/chartArray")//select의 option넣는것
@ResponseBody
public String chartArray() {
	ArrayList<chartArrayDTO> ar = cadao.chartArray();
	
	JSONArray ja = new JSONArray();
	for(chartArrayDTO cadto : ar) {
		JSONObject jo =new JSONObject();
		jo.put("id",cadto.getId());
		jo.put("text",cadto.getText());
				
		ja.put(jo);
	}
	return ja.toString();
}

@PostMapping("/chartList11")
@ResponseBody
public String chartList11() {
	ArrayList<chartDTO> ar = cdao.chartList1();
	
	
	
	JSONArray ja = new JSONArray();
	for(chartDTO cdto : ar) {
		JSONObject jo =new JSONObject();
		jo.put("id", cdto.getId());
		jo.put("image",cdto.getImage());
		jo.put("reservationrate",cdto.getReservationrate());
		jo.put("title", cdto.getTitle());
		
		ja.put(jo);
	}
	return ja.toString(); 
}

}