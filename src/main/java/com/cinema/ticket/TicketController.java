package com.cinema.ticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @PostMapping("/reserveSeats")
    @ResponseBody
    public ResponseEntity<String> reserveSeats(@RequestBody Map<String, Object> seatData) {
        try {
            List<String> seats = (List<String>) seatData.get("seats");
            int movieId = (int) seatData.get("movieId");
            int theaterId = (int) seatData.get("theaterId");
            String date = (String) seatData.get("date");
            String time = (String) seatData.get("time");

            tdao.reserveSeats(seats, movieId, theaterId, date, time);
            return ResponseEntity.ok("예매가 완료되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("예매 처리 중 오류가 발생했습니다.");
        }
    }
	
	@GetMapping("/checkout")
	public String checkout() {
	    
	    return "ticketweb/checkout";
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
