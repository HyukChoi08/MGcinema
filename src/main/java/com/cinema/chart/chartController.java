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
import jakarta.servlet.http.HttpSession;

@Controller
public class chartController {
@Autowired chartDAO cdao;
@Autowired chartArrayDAO cadao;	
@Autowired commentArrayDAO commentadao;
@Autowired chartPutCommentDAO cpcdao;
@Autowired chartappearanceinfoDAO cainfodao;

@GetMapping("/chart")
public String test() {
	return "chart/chartList";
}

@GetMapping("/chartList1")
public String chartList1(HttpServletRequest req, Model model) {
	HttpSession session = req.getSession();
	int id = Integer.parseInt(req.getParameter("id"));
	session.setAttribute("dataId", id);
	System.out.println("id"+id);
	
	String archart = cdao.chartList2(id);
	model.addAttribute("chartList2",archart);
	chartDTO putchart = cdao.chartList3(id);
	model.addAttribute("chartList3", putchart);
	ArrayList<chartappearanceinfoDTO> putinfoprod =cainfodao.chartappearanceinfo(String.valueOf(id));
	model.addAttribute("cainfoprod", putinfoprod);
	ArrayList<chartappearanceinfoDTO> putinfoactor =cainfodao.chartappearanceinfo1(String.valueOf(id));
	model.addAttribute("cainfoactor", putinfoactor);
	int countreview = cpcdao.count(String.valueOf(id));
	model.addAttribute("countreview",countreview);
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
		jo.put("imagepath",cdto.getImagepath());
		jo.put("reservation",cdto.getReservation());
		jo.put("mname", cdto.getMname());
		jo.put("releasedate", cdto.getReleasedate());
				
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
@PostMapping("/commentArray")//select의 option넣는것
@ResponseBody
public String commentArray() {
	ArrayList<commentArrayDTO> ar = commentadao.commentArray();
	
	JSONArray ja = new JSONArray();
	for(commentArrayDTO cadto : ar) {
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
		jo.put("imagepath",cdto.getImagepath());
		jo.put("reservation",cdto.getReservation());
		jo.put("mname", cdto.getMname());
		jo.put("releasedate", cdto.getReleasedate());
		
		ja.put(jo);
	}
	return ja.toString(); 
}

@PostMapping("/insertselectcomment")//리뷰 리뷰란에 셀렉트
@ResponseBody
public String insertselectcomment(HttpServletRequest req, Model model) {
	int id = Integer.parseInt(req.getParameter("id1"));
	ArrayList<chartPutCommentDTO> ar = cpcdao.selectputcomment(id);
	
	
	
	JSONArray ja = new JSONArray();
	for(chartPutCommentDTO cpcdto : ar) {
		JSONObject jo =new JSONObject();
		jo.put("id", cpcdto.getId());
		jo.put("content",cpcdto.getContent());
		jo.put("writer",cpcdto.getWriter());
		jo.put("created_at", cpcdto.getCreated_at());
		jo.put("customer_uid",cpcdto.getCustomer_uid());
		ja.put(jo);
	}
	return ja.toString(); 
}

//리뷰 작성
@PostMapping("/putcomment")
@ResponseBody 
public String update (HttpServletRequest req, Model model) {
	int moviechart = Integer.parseInt(req.getParameter("moviechart"));
	
	String content = req.getParameter("content");
	
	String writer = req.getParameter("writer");
	String uid = req.getParameter("uid");
	cpcdao.putcomment(moviechart, content, writer,uid);
	return "ok";
}
//리뷰 수정
@PostMapping("/updatereview")
@ResponseBody
public String updatereview (HttpServletRequest req, Model model) {
	int id = Integer.parseInt(req.getParameter("id"));
	
	String content = req.getParameter("content");
	
	cpcdao.updatereview(id, content);
	return "ok";
}
//리뷰 삭제
@PostMapping("/deletereview")
@ResponseBody
public String deletereview (HttpServletRequest req, Model model) {
	int id = Integer.parseInt(req.getParameter("id"));
	
	cpcdao.deletereview(id);
	return "ok";
}

/*
 * @PostMapping("/putreservation")//예매율 계산
 * 
 * @ResponseBody public double putreservation (HttpServletRequest req, Model
 * model) { String getmname = req.getParameter("getmname");
 * 
 * chartmoviepayDTO chartmoviepay = cdao.putreservation(getmname); double ratio
 * = chartmoviepay.getRatio(); return ratio; }
 */
@PostMapping("/updatereservation")//예매율 업데이트
@ResponseBody
public String updatereservation (HttpServletRequest req, Model model) {
	String getmname = req.getParameter("getmname");
	System.out.println(getmname);
 cdao.updatereservation(getmname);
 return "ok";
}
@PostMapping("/updaterenewal")//전체예매율 갱신
@ResponseBody
public String updaterenewal (HttpServletRequest req, Model model) {
	cdao.updaterenewal();
return "ok";	
}

}
