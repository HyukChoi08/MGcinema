package com.cinema.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cinema.service.EAQDTO;
import com.cinema.service.FAQDTO;
import com.cinema.service.NewsDTO;
import com.cinema.service.ServiceHomeDTO;

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

    @GetMapping("/EAQ")
    public String showEAQPage(Model model) {
        // 예시 EAQ 데이터 생성
        List<EAQDTO> eaqList = new ArrayList<>();
        eaqList.add(new EAQDTO(1, "예매/매표", "예매하는 방법", new Date()));
        eaqList.add(new EAQDTO(2, "관람권/결제수단", "결제 수단 변경", new Date()));
        eaqList.add(new EAQDTO(3, "멤버쉽/클럽서비스", "회원가입 방법", new Date()));
        eaqList.add(new EAQDTO(4, "VIP관련", "VIP 전용 서비스", new Date()));

        // 모델에 EAQ 리스트를 추가
        model.addAttribute("faqList", eaqList); // 변수 이름 수정

        // JSP 페이지로 포워딩
        return "service/EAQ"; // JSP 파일 경로
    }
}
