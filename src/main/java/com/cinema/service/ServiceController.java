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
            new FAQDTO(1L, "FAQ 제목 1", "FAQ 내용 1", 100),
            new FAQDTO(2L, "FAQ 제목 2", "FAQ 내용 2", 150),
            new FAQDTO(3L, "FAQ 제목 3", "FAQ 내용 3", 200)
        );

        model.addAttribute("faqList", faqList); // 모델에 데이터 추가
        return "service/FAQ"; // 반환되는 뷰 이름 (FAQ.jsp)
    }
    
    
    
}
