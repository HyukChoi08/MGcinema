package com.cinema.ticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

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

	@PostMapping("/reserve")
	@ResponseBody
	public String reserveTicket(@RequestParam int movieId, @RequestParam int theaterId, @RequestParam String date, @RequestParam String time) {
		// 예매 처리 로직 추가
		tdao.reserve(movieId, theaterId, date, time);
		return "Success";
	}
	
	@PostMapping("/ticket/")
	@ResponseBody
	public String ticketdata(@RequestParam String mname, @RequestParam String date, @RequestParam String time, @RequestParam String room) {
		
		System.out.println(mname + date + time + room);
		return "";
	}
	@SuppressWarnings("unchecked")
	@PostMapping("/reserveSeats")
    @ResponseBody
    public String reserveSeats(@RequestBody Map<String, Object> seatData) {
        List<String> seats = (List<String>) seatData.get("seats");
        int movieId = (int) seatData.get("movieId");
        int theaterId = (int) seatData.get("theaterId");
        String date = (String) seatData.get("date");
        String time = (String) seatData.get("time");

        // 예매 처리 로직 추가
        tdao.reserveSeats(seats, movieId, theaterId, date, time);
        
        return "예매가 완료되었습니다.";
    }
	
	@GetMapping("/seats")
    @ResponseBody
    public Map<String, Object> getSeats(@RequestParam("theaterId") String theaterId) {
        List<seatDTO> seats = tdao.getSeats(theaterId);
        Map<String, Object> response = new HashMap<>();
        response.put("seats", seats);
        return response;
    }
	
}
