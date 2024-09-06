package com.cinema.ticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TicketController {
	@Autowired TicketDAO tdao;
	
	@GetMapping("/ticket")
	public String ticket() {
		return "ticketweb/ticket";
	}
	
	@GetMapping("/movies")
	@ResponseBody
	public List<movieDTO> getMovies() {
		return tdao.getMovies();
	}
	@GetMapping("/movieimage")
	@ResponseBody
	public String getMovieimage(@RequestParam("movieId") int movieId) {
		return tdao.getMovieimage(movieId);
	}

	@GetMapping("/theaters")
	@ResponseBody
	public List<theaterDTO> getTheaters(@RequestParam("movieId") int movieId, @RequestParam("date") String date) {
		return tdao.getTheaters(movieId, date);
	}

	@GetMapping("/dates")
	@ResponseBody
	public List<String> getDates(@RequestParam int theaterId) {
		return tdao.getDates(theaterId);
	}

	@GetMapping("/times")
	@ResponseBody
	public List<timesDTO> getTimes(@RequestParam("movieId") int movieId, @RequestParam("date") String date, @RequestParam("roomId") String roomId) {
		return tdao.getTimes(movieId, date, roomId);
	}
	
	@GetMapping("/ticket/")
	public String ticketdata(HttpServletRequest req, Model model) {
		String mname = req.getParameter("mname");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		String room = req.getParameter("room");
		model.addAttribute("mname", mname);
	    model.addAttribute("date", date);
	    model.addAttribute("time", time);
	    model.addAttribute("room", room);
		System.out.println(mname + date + time + room);
		return "ticketweb/ticket";
	}
	
//    @PostMapping("/reserveSeats")
//    @ResponseBody
//    public ResponseEntity<String> reserveSeats(@RequestBody Map<String, Object> seatData) {
//        try {
//            List<String> seats = (List<String>) seatData.get("seats");
//            int movieId = (int) seatData.get("movieId");
//            int theaterId = (int) seatData.get("theaterId");
//            String date = (String) seatData.get("date");
//            String time = (String) seatData.get("time");
//
//            tdao.reserveSeats(seats, movieId, theaterId, date, time);
//            return ResponseEntity.ok("예매가 완료되었습니다.");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("예매 처리 중 오류가 발생했습니다.");
//        }
//    }
	
	@GetMapping("/ticketweb/checkout")
    public String showCheckoutPage(@RequestParam("moviename") String moviename,
            						@RequestParam("Aticket") String Aticket,
            						@RequestParam("Yticket") String Yticket,
            						@RequestParam("resultprice") String resultprice,
            						@RequestParam("resultseat") String resultseat,
            						@RequestParam("roomname") String roomname,
            						@RequestParam("people") String people,
            						@RequestParam("begintime") String begintime,
            						@RequestParam("endtime") String endtime,
            						@RequestParam("runningtime") String runningtime,
            						@RequestParam("datetime") String datetime,
            						HttpServletRequest req, Model model) {
		HttpSession s =req.getSession();
		String userid = (String) s.getAttribute("uid");
		customerDTO customer = tdao.getCustomer(userid);
		
		model.addAttribute("id", customer.getId());
        model.addAttribute("uid", customer.getUid());
        model.addAttribute("passwd", customer.getPasswd());
        model.addAttribute("realname", customer.getRealname());
        model.addAttribute("nickname", customer.getNickname());
        model.addAttribute("email", customer.getEmail());
        model.addAttribute("mobile", customer.getMobile());
        
        model.addAttribute("moviename", moviename);
        model.addAttribute("Aticket", Aticket);
        model.addAttribute("Yticket", Yticket);
        model.addAttribute("resultprice", resultprice);
        model.addAttribute("resultseat", resultseat);
        model.addAttribute("roomname", roomname);
        model.addAttribute("people", people);
        model.addAttribute("begintime", begintime);
        model.addAttribute("endtime", endtime);
        model.addAttribute("runningtime", runningtime);
        model.addAttribute("datetime", datetime);
        
        String orderId = UUID.randomUUID().toString();
        
        model.addAttribute("orderId", orderId);
        return "ticketweb/checkout";
    }
	
	@GetMapping("/success")
	public String paymentSuccess(@RequestParam Map<String, String> params, Model model) {
	    // 파라미터로 전달된 값을 모델에 추가
	    model.addAttribute("orderId", params.get("orderId"));
	    model.addAttribute("uid", params.get("uid"));
	    model.addAttribute("moviename", params.get("moviename"));
	    model.addAttribute("roomname", params.get("roomname"));
	    model.addAttribute("resultprice", params.get("resultprice"));
	    model.addAttribute("runningtime", params.get("runningtime"));
	    model.addAttribute("resultseat", params.get("resultseat"));
	    model.addAttribute("people", params.get("people"));
	    model.addAttribute("begintime", params.get("begintime"));
	    model.addAttribute("endtime", params.get("endtime"));
	    model.addAttribute("datetime", params.get("datetime"));

	    return "ticketweb/success";
	}
	
	@GetMapping("/saveData")
	public String saveData(HttpServletRequest req) {
	    String random_id = req.getParameter("random_id");
	    String customer_id = req.getParameter("customer_id");
	    String movie_name = req.getParameter("movie_name");
	    String room_name = req.getParameter("room_name");
	    String totalprice = req.getParameter("totalprice");
	    String runningtime = req.getParameter("runningtime");
	    String seat = req.getParameter("seat");
	    String totalpeople = req.getParameter("totalpeople");
	    String begintime = req.getParameter("begintime");
	    String endtime = req.getParameter("endtime");
	    String datetime = req.getParameter("datetime");
	    
	    int count = tdao.checkIfExists(random_id);
	    if (count > 0) {
	        return "home/homepage"; // Or some appropriate response
	    }
	    
	    tdao.insertData(random_id, customer_id, movie_name, room_name, totalprice, runningtime, seat, totalpeople, begintime, endtime, datetime);
	    return "home/homepage";
	}
	
	@GetMapping("/changeSeat")
	public String changeSeat(HttpServletRequest req) {
		String movie_name = req.getParameter("movie_name");
		String room_name = req.getParameter("room_name");
		String moviedate = req.getParameter("moviedate");
		String begintime = req.getParameter("begintime");
		int people = Integer.parseInt(req.getParameter("people"));
		
		tdao.updateSeat(movie_name, room_name, moviedate, begintime, people);
		return "ok";
	}
	
	
	@GetMapping("/occupiedSeats")
	@ResponseBody
	public List<nowseatDTO> getOccupiedSeats(@RequestParam("movieName") String movieName, @RequestParam("roomName") String roomName, @RequestParam("beginTime") String beginTime, @RequestParam("dateTime") String dateTime) {
		return tdao.getOccupiedSeats(movieName, roomName, beginTime, dateTime);
	}

	
    @GetMapping("/fail")
    public String paymentFail() {
        return "ticketweb/fail";
    }
	
	@GetMapping("/seats")
    @ResponseBody
    public Map<String, Object> getSeats(@RequestParam("theaterId") String theaterId) {
        List<seatDTO> seats = tdao.getSeats(theaterId);
        Map<String, Object> response = new HashMap<>();
        response.put("seats", seats);
        return response;
    }
	
	@GetMapping("/totalprice")
	@ResponseBody
	public List<priceDTO> getTotalPrice(@RequestParam("movieId") int movieId, @RequestParam("roomId") String roomId, @RequestParam("moviedate") String moviedate, @RequestParam("begintime") String begintime) {
		return tdao.getTotalPrice(movieId, roomId, moviedate, begintime);
	}
}
