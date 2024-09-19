package com.cinema.chartsecond;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class detailController {
	@Autowired DetailDAO ddao;
	
	@GetMapping("/chartdetail")
	public String chartdetail(HttpServletRequest req, Model model) {
		String movieid = req.getParameter("id");
		model.addAttribute("movieid",movieid);
		return "chart_second/chartdetail";
	}
	@GetMapping("/chartcut")
	public String chartcut(HttpServletRequest req, Model model) {
		String movieid = req.getParameter("id");
		model.addAttribute("movieid",movieid);
		return "chart_second/chartcut";
	}
	@GetMapping("/dirimg")
	@ResponseBody
	public String dirimg(@RequestParam("movieid") int movieid,@RequestParam("dirn") String dirn) {
		return ddao.dirimg(movieid,dirn);
	}
	@GetMapping("/cutimg")
	@ResponseBody
	public List<cutDTO> cutimg(@RequestParam("movieid") int movieid) {
		return ddao.getCutimg(movieid);
	}
	@GetMapping("/getCastImages")
	@ResponseBody
	public List<castDTO> getCastImages(@RequestParam("movieid") int movieid, @RequestParam("castNames") List<String> castNames) {
		return ddao.getCastImages(movieid, castNames);
	}
	
	@GetMapping("/detailmovies")
	@ResponseBody
	public List<movieDTO> getDetailMovies(@RequestParam("id") int movieid) {
		System.out.println(movieid);
		return ddao.getMovieAll(movieid);
	}

}
