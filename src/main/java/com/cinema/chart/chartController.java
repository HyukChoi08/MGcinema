package com.cinema.chart;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class chartController {
	@Autowired
	chartDAO cdao;
	@Autowired
	chartPutCommentDAO cpcdao;

	@GetMapping("/chart")
	public String test() {
		return "chart/chartList";
	}

	@GetMapping("/chartList1")
	public String chartList1(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("uid");
		int id = Integer.parseInt(req.getParameter("id"));

		String cust_id = (String) session.getAttribute("id");
		
		  if(cust_id==null) { 
			  cust_id=""; 
		  }
		  else { 
		  int customer_id =Integer.parseInt(cust_id);
		  }

		chartPutCommentDTO movieReview = cpcdao.selectMovieReview(userId, id, cust_id);

		session.setAttribute("dataId", id);
		System.out.println("id" + id);

		String archart = cdao.chartList2(id);
		model.addAttribute("chartList2", archart);
		chartDTO putchart = cdao.chartList3(id);
		model.addAttribute("chartList3", putchart);
//	ArrayList<chartappearanceinfoDTO> putinfoprod =cainfodao.chartappearanceinfo(String.valueOf(id));
//	model.addAttribute("cainfoprod", putinfoprod);
//	ArrayList<chartappearanceinfoDTO> putinfoactor =cainfodao.chartappearanceinfo1(String.valueOf(id));
//	model.addAttribute("cainfoactor", putinfoactor);
		int countreview = cpcdao.count(String.valueOf(id));
		model.addAttribute("countreview", countreview);
		model.addAttribute("movieReview", movieReview);
		model.addAttribute("movieAverageRate", cpcdao.selectMovieAverageRate(id));
		return "chart/chartList1";
	}

	@GetMapping("/AverageRate")
	@ResponseBody
	public String Averagerate(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println("what?" + id);
		double AverageRate = cpcdao.selectMovieAverageRate(id);
		return String.valueOf(AverageRate);
	}

	private String AverageRate() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * @RequestParam ( value = "front에서 보낸 parameter 명", required=필수값인지 defaultValue
	 * = 기본값 ) 변수타입 변수명
	 */
	@PostMapping("/chartList") // 무비 차트 정렬시키는것
	@ResponseBody
	public String chartList(@RequestParam(value = "selectedSortCriteria", required = false) String sortCriteria,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			@RequestParam(value = "pageNumber", required = false, defaultValue = "0") int pageNumber) {
		pageNumber = getStartPageNumber(pageNumber, pageSize);

		ArrayList<chartDTO> movieList = cdao.chartList(sortCriteria, pageSize, pageNumber);

		JSONArray ja = new JSONArray();
		for (chartDTO cdto : movieList) {
			JSONObject jo = new JSONObject();
			jo.put("id", cdto.getId());
			jo.put("imagepath", cdto.getImagepath());
			jo.put("reservation", cdto.getReservation());
			jo.put("mname", cdto.getMname());
			jo.put("releasedate", cdto.getReleasedate());

			ja.put(jo);
		}
		return ja.toString();
	}

	public int getStartPageNumber(int pageNumber, int pageSize) {
		if (pageNumber == 0) {
			return 0;
		} else {
			return 7 + ((pageNumber - 1) * pageSize);
		}
		
	}

	@PostMapping("/chartList11")
	@ResponseBody
	public String chartList11() {
		ArrayList<chartDTO> ar = cdao.chartList1();

		JSONArray ja = new JSONArray();
		for (chartDTO cdto : ar) {
			JSONObject jo = new JSONObject();
			jo.put("id", cdto.getId());
			jo.put("imagepath", cdto.getImagepath());
			jo.put("reservation", cdto.getReservation());
			jo.put("mname", cdto.getMname());
			jo.put("releasedate", cdto.getReleasedate());

			ja.put(jo);
		}
		return ja.toString();
	}

	@PostMapping("/insertselectcomment") // 리뷰 리뷰란에 셀렉트
	@ResponseBody
	public String insertselectcomment(HttpServletRequest req, Model model) {

		int id = Integer.parseInt(req.getParameter("id1"));
		System.out.println("insert" + id);

		ArrayList<chartPutCommentDTO> ar = cpcdao.selectputcomment(id);

		JSONArray ja = new JSONArray();
		for (chartPutCommentDTO cpcdto : ar) {
			JSONObject jo = new JSONObject();
			jo.put("id", cpcdto.getId());
			jo.put("content", cpcdto.getContent());
			jo.put("writer", cpcdto.getWriter());
			jo.put("created_at", cpcdto.getCreated_at());
			jo.put("customer_uid", cpcdto.getCustomer_uid());
			jo.put("rate", cpcdto.getRate());
			jo.put("customer_id", cpcdto.getCustomer_id());
			ja.put(jo);
		}
		return ja.toString();
	}

//리뷰 작성
	@PostMapping("/putcomment")
	@ResponseBody
	public String update(HttpServletRequest req, Model model) {

		int moviechart = Integer.parseInt(req.getParameter("moviechart"));

		String content = req.getParameter("content");

		String writer = req.getParameter("writer");
		String uid = req.getParameter("uid");
		int rate = Integer.parseInt(req.getParameter("rate"));
		String customer_id1 = req.getParameter("customer_id");
		int customer_id = Integer.parseInt(customer_id1);

		cpcdao.putcomment(moviechart, content, writer, uid, rate, customer_id);
		return "ok";
	}

//리뷰 수정
	@PostMapping("/updatereview")
	@ResponseBody
	public String updatereview(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("uid");
		int id = Integer.parseInt(req.getParameter("id"));
		int rate = Integer.parseInt(req.getParameter("rate"));

		String content = req.getParameter("content");

		cpcdao.updatereview(id, content, rate, userId);
		return "ok";
	}

//리뷰 삭제
	@PostMapping("/deletereview")
	@ResponseBody
	public String deletereview(HttpServletRequest req, Model model) {
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
	@PostMapping("/updatereservation") // 예매율 업데이트
	@ResponseBody
	public String updatereservation(HttpServletRequest req, Model model) {
		String getmname = req.getParameter("getmname");
		System.out.println(getmname);
		cdao.updatereservation(getmname);
		return "ok";
	}

	@PostMapping("/updaterenewal") // 전체예매율 갱신
	@ResponseBody
	public String updaterenewal(HttpServletRequest req, Model model) {
		cdao.updaterenewal();
		return "ok";
	}

	@PostMapping("/reviewCheck")
	@ResponseBody
	public String reviewCheck(HttpServletRequest req, Model model) {
		int id = Integer.parseInt(req.getParameter("id"));
		String uid = req.getParameter("uid");
		String moviename = req.getParameter("moviename");

		int n = cpcdao.buyTicketCheck(id, uid, moviename);
		return "" + n;
	}

}
