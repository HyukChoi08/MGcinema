package com.cinema.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ServiceController {
    @Autowired
    private FAQDAO faqDAO;
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
        // 데이터베이스에서 FAQ 목록 조회
        List<FAQDTO> faqList = faqDAO.getAllFAQs();

        model.addAttribute("faqList", faqList); // 모델에 데이터 추가
        return "service/FAQ"; // 반환되는 뷰 이름 (FAQ.jsp)
    }

    @GetMapping("/FAQdetail")
    public String showFAQDetailPage(@RequestParam(value = "id") Long id, Model model) {
        // FAQ 상세 정보를 가져오는 로직 추가
        FAQDTO faqDetail = faqDAO.getFAQById(id);

        model.addAttribute("faqDetail", faqDetail); // 모델에 데이터 추가
        return "service/FAQdetail"; // 반환되는 뷰 이름 (FAQdetail.jsp)
    }

    @GetMapping("/news")
    public String showNewsPage(Model model) {
        // 정적 데이터 생성 (예제 데이터)
        List<NewsDTO> newsList = List.of(
            new NewsDTO(1L, "공지사항 제목 1", "공지사항 내용 1", "2024-08-30 12:00:00", 123),
            new NewsDTO(2L, "공지사항 제목 2", "공지사항 내용 2", "2024-08-29 09:30:00", 456)
        );

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
}
