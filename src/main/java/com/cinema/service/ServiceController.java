package com.cinema.service;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ServiceController {

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
        // 예시 뉴스 데이터 생성
    	List<NewsDTO> newsList = List.of(
    	        new NewsDTO(1L, "일단 ", "상세 내용 1", 1),
    	        new NewsDTO(2L, "아무거나", "상세 내용 2", 1),
    	        new NewsDTO(3L, "채워넣고", "상세 내용 3", 1),
    	        new NewsDTO(4L, "생각하자", "상세 내용 4", 1)
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
