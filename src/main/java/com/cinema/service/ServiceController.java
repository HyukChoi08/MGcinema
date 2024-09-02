package com.cinema.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ServiceController {
    @Autowired
    private FAQDAO faqDAO;
    @Autowired
    private NewsDAO newsDAO;

    @GetMapping("/serviceHome")
    public String getServiceHome(@RequestParam(value = "id", defaultValue = "1") int id, Model model) {
        ServiceHomeDTO serviceHome = new ServiceHomeDTO("고객센터", "아직아직아직");
        model.addAttribute("serviceHome", serviceHome);
        return "service/ServiceHome";
    }
////////////////////////////News///////////////////////
    
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
    @GetMapping("/FAQedit")
    public String showFAQEditPage(@RequestParam("id") Long id, Model model) {
        FAQDTO faqDetail = faqDAO.getFAQById(id);
        model.addAttribute("faqDetail", faqDetail);
        return "service/FAQedit"; // 수정 페이지 뷰 이름
    }
    @PostMapping("/FAQupdate")
    public String updateFAQ(@ModelAttribute FAQDTO faqDTO) {
        faqDAO.updateFAQ(faqDTO);
        return "redirect:/faq";
    }
    @GetMapping("/FAQdelete")
    public String deleteFAQ(@RequestParam("id") Long id) {
        faqDAO.deleteFAQ(id);
        return "redirect:/faq"; // 삭제 후 FAQ 목록 페이지로 리다이렉트
    }
/////////////////////////News/////////////////////

    
    // FAQ 관련 메서드들

    @GetMapping("/news")
    public String showNewsPage(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model) {

        int offset = (page - 1) * size;
        List<NewsDTO> newsList = newsDAO.getAllNews(size, offset);
        int totalNewsCount = newsDAO.getTotalNewsCount();
        int totalPages = (int) Math.ceil((double) totalNewsCount / size);

        model.addAttribute("newsList", newsList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        return "service/News";
    }

    @GetMapping("/newsDetail")
    public String showNewsDetailPage(@RequestParam(value = "id") Long id, Model model) {
        newsDAO.incrementViewCount(id);
        NewsDTO newsDetail = newsDAO.getNewsById(id);
        model.addAttribute("newsDetail", newsDetail);
        return "service/Newsdetail";
    } 
    ㄱ
    
/////////////////////////////EAQ////////////////////////
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
