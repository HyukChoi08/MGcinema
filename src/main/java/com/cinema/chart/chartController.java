package com.cinema.chart;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.mc.bookDTO;

@Controller
public class chartController {
@Autowired chartListDAO cldao
	
	
@PostMapping("/chartList")
@ResponseBody
public String chartList() {
		ArrayList<chartListDTO> ar = cldao.selectChartList();
	
		JSONArray ja = new JSONArray();
		for(chartListDTO cldto : ar) {
			JSONObject jo =new JSONObject();
			jo.put("image",cldto.getId());		
			ja.put(jo);
			
	}
		return ja.toString();
}
