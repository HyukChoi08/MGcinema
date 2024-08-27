package com.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ServiceController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/serviceHome")
    public String getServiceHome(@RequestParam(value = "id", defaultValue = "1") int id, Model model) {
        ServiceHomeDTO serviceHome = new ServiceHomeDTO("고객센터", "아직아직아직");
        model.addAttribute("serviceHome", serviceHome);
        return "service/ServiceHome";
    }

    @GetMapping("/faq")
    public String showFAQPage(Model model) {
        // 정적 데이터 생성
        List<FAQDTO> faqList = List.of(
            new FAQDTO(1L, "FAQ 제목 1", "FAQ 내용 1", 100)
        );

        model.addAttribute("faqList", faqList); // 모델에 데이터 추가
        return "service/FAQ"; // 반환되는 뷰 이름 (FAQ.jsp)
    }

    @GetMapping("/news")
    public String showNewsPage(Model model) {
        // 뉴스 데이터베이스에서 조회
        String selectQuery = "SELECT * FROM notice ORDER BY num DESC";
        List<NewsDTO> newsList = jdbcTemplate.query(selectQuery, new BeanPropertyRowMapper<>(NewsDTO.class));
        
        model.addAttribute("newsList", newsList); // 모델에 데이터 추가
        return "service/News"; // 반환되는 뷰 이름 (News.jsp)
    }

    @GetMapping("/eaq")
    public String showEAQPage(Model model) {
        // 예시 EAQ 데이터 생성
        List<EAQDTO> eaqList = List.of(
            new EAQDTO(1L, "EAQ 제목 1", "EAQ 내용 1", 100)
        );

        model.addAttribute("eaqList", eaqList); // 모델에 데이터 추가
        return "service/EAQ"; // 반환되는 뷰 이름 (EAQ.jsp)
    }
    @GetMapping("/board")
    public String showBoardPage(Model model) {
        // 단순히 Board 페이지를 표시하기만 할 수 있습니다.
        return "service/Board"; // 반환되는 뷰 이름 (Board.jsp)
    
    }
}
