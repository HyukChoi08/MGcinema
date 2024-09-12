package com.cinema.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
        ServiceHomeDTO serviceHome = new ServiceHomeDTO();
        
        // 뉴스 목록 가져오기
        List<NewsDTO> newsList = newsDAO.getAllNews(9, 0); // 예시로 5개 뉴스 가져오기
        model.addAttribute("newsList", newsList);

        model.addAttribute("serviceHome", serviceHome);
        return "service/ServiceHome";
    }

    

    @GetMapping("/faq")
    public String showFAQPage(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "search", defaultValue = "") String search,
            @RequestParam(value = "selected", defaultValue = "") String selected,
            Model model) {

        int offset = (page - 1) * size;
        List<FAQDTO> faqList;
        int totalFAQCount;

        if (search.isEmpty() && selected.isEmpty()) {
            faqList = faqDAO.getAllFAQs(size, offset);
            totalFAQCount = faqDAO.getTotalFAQCount();
        } else if (!search.isEmpty()) {
            faqList = faqDAO.getFAQsByKeyword(search, size, offset);
            totalFAQCount = faqDAO.getTotalFAQCountByKeyword(search);
        } else {
            faqList = faqDAO.getFAQsBySelected(selected, size, offset);
            totalFAQCount = faqDAO.getTotalFAQCountBySelected(selected);
        }

        int totalPages = (int) Math.ceil((double) totalFAQCount / size);

        model.addAttribute("faqList", faqList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        model.addAttribute("search", search);
        model.addAttribute("selected", selected);
        model.addAttribute("totalFAQCount", totalFAQCount);
        return "service/FAQ";
    }

    @GetMapping("/faqcreate")
    public String showFAQCreatePage(Model model) {
        model.addAttribute("faqDTO", new FAQDTO());
        return "service/FAQcreate";
    }

    @PostMapping("/FAQcreate")
    public String createFAQ(@ModelAttribute FAQDTO faqDTO) {
        faqDTO.setCreatedAt(LocalDateTime.now());
        faqDTO.setViews(0);
        faqDAO.addFAQ(faqDTO);
        return "redirect:/faq";
    }

    @GetMapping("/FAQdetail")
    public String showFAQDetailPage(@RequestParam(value = "id") Long id, Model model) {
        FAQDTO faqDetail = faqDAO.getFAQById(id);
        if (faqDetail != null) {
            faqDetail.setViews(faqDetail.getViews() + 1);
            faqDAO.updateFAQ(faqDetail);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDate = (faqDetail.getCreatedAt() != null) ? faqDetail.getCreatedAt().format(formatter) : "날짜 정보 없음";

            model.addAttribute("faqDetail", faqDetail);
            model.addAttribute("formattedDate", formattedDate);
        } else {
            model.addAttribute("error", "FAQ 항목을 찾을 수 없습니다.");
        }

        return "service/FAQdetail";
    }

    @GetMapping("/FAQedit")
    public String showFAQEditPage(@RequestParam("id") Long id, Model model) {
        FAQDTO faqDetail = faqDAO.getFAQById(id);
        model.addAttribute("faqDetail", faqDetail);
        return "service/FAQedit";
    }

    @PostMapping("/FAQupdate")
    public String updateFAQ(@ModelAttribute FAQDTO faqDTO) {
        faqDAO.updateFAQ(faqDTO);
        return "redirect:/faq";
    }

    @GetMapping("/FAQdelete")
    public String deleteFAQ(@RequestParam("id") Long id) {
        faqDAO.deleteFAQ(id);
        return "redirect:/faq";
    }

    @GetMapping("/news")
    public String showNewsPage(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "search", defaultValue = "") String search,
            @RequestParam(value = "selected", defaultValue = "") String selected, // 추가된 부분
            Model model) {

        int offset = (page - 1) * size;
        List<NewsDTO> newsList;
        int totalNewsCount;

        if (search.isEmpty() && selected.isEmpty()) {
            // 검색어와 선택된 항목이 없는 경우
            newsList = newsDAO.getAllNews(size, offset);
            totalNewsCount = newsDAO.getTotalNewsCount();
        } else if (!search.isEmpty()) {
            // 검색어가 있는 경우
            newsList = newsDAO.getNewsByKeyword(search, size, offset);
            totalNewsCount = newsDAO.getTotalNewsCountByKeyword(search);
        } else {
            // 선택된 항목이 있는 경우
            newsList = newsDAO.getNewsBySelected(selected, size, offset);
            totalNewsCount = newsDAO.getTotalNewsCountBySelected(selected);
        }

        int totalPages = (int) Math.ceil((double) totalNewsCount / size);

        model.addAttribute("newsList", newsList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        model.addAttribute("search", search);
        model.addAttribute("selected", selected); // 추가된 부분
        model.addAttribute("totalNewsCount", totalNewsCount);

        return "service/News";
    }

    @GetMapping("/newsDetail")
    public String showNewsDetailPage(@RequestParam(value = "id") Long id, Model model) {
        newsDAO.incrementViewCount(id);
        NewsDTO newsDetail = newsDAO.getNewsById(id);
        model.addAttribute("newsDetail", newsDetail); 
        return "service/Newsdetail";
    }

    @GetMapping("/eaq")
    public String showEAQPage(Model model) {
        List<EAQDTO> eaqList = List.of(
            new EAQDTO(1L, "EAQ 제목 1", "EAQ 내용 1", 100)
        );
        model.addAttribute("eaqList", eaqList);
        return "service/EAQ";
    }
}
