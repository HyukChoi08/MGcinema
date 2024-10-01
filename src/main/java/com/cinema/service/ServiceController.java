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

import com.cinema.mypage.CustomerDTO;
import com.cinema.mypage.MypageDAO;

import jakarta.servlet.http.HttpSession;
@Controller
public class ServiceController {
	@Autowired
	private MypageDAO mdao;
    private static final String String = null;
	@Autowired
    private FAQDAO faqDAO;
    @Autowired
    private NewsDAO newsDAO;

    @GetMapping("/serviceHome")
    public String getServiceHome(@RequestParam(value = "id", defaultValue = "1") int id, Model model, HttpSession session) {
        ServiceHomeDTO serviceHome = new ServiceHomeDTO();

        // 뉴스 목록 가져오기
        List<NewsDTO> newsList = newsDAO.getAllNews(10, 0); // 예시로 10개 뉴스 가져오기
        model.addAttribute("newsList", newsList);

        // 고객 정보 세션에 저장
        String uid = (String) session.getAttribute("uid"); // uid를 세션에서 가져옴
        if (uid != null) {
            CustomerDTO cusDTO = mdao.getCustomerInfoByUid(uid);
            session.setAttribute("cusDTO", cusDTO);
        }

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
        // 현재 날짜와 시간 가져오기
        LocalDateTime now = LocalDateTime.now();
        
        // 원하는 날짜와 시간 포맷 정의하기
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        // LocalDateTime을 String으로 변환하기
        String formattedDate = now.format(formatter);
        
        // created_at에 변환된 날짜 문자열 설정하기
        faqDTO.setCreated_at(formattedDate);
        
        // 초기 조회수 설정하기
        faqDTO.setViews(0);
        
        // FAQ를 데이터베이스에 추가하기
        faqDAO.addFAQ(faqDTO);
        
        // FAQ 페이지로 리다이렉트하기
        return "redirect:/faq";
    }
    @GetMapping("/FAQdetail")
    public String showFAQDetailPage(@RequestParam(value = "id") Long id, 
                                     @RequestParam(value = "page", defaultValue = "1") int currentPage, 
                                     Model model) {
        FAQDTO faqDetail = faqDAO.getFAQById(id);
        if (faqDetail != null) {
            // 조회수 증가 및 FAQ 업데이트
            faqDetail.setViews(faqDetail.getViews() + 1);
            faqDAO.updateFAQ(faqDetail);
            
            // 날짜 포맷 설정
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDate = (faqDetail.getCreated_at() != null) ? faqDetail.getCreated_at() : "날짜 정보 없음";

            // 모델에 속성 추가
            model.addAttribute("faqDetail", faqDetail);
            model.addAttribute("formattedDate", formattedDate);
            model.addAttribute("currentPage", currentPage); // currentPage 추가
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
    public String showNewsDetailPage(
            @RequestParam(value = "id") Long id, 
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "search", defaultValue = "") String search, 
            Model model) {

        newsDAO.incrementViewCount(id);
        NewsDTO newsDetail = newsDAO.getNewsById(id);
        model.addAttribute("newsDetail", newsDetail);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("size", size);
        model.addAttribute("search", search);
        return "service/Newsdetail";
    }
}