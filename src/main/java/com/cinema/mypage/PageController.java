package com.cinema.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class PageController {
   @Autowired
   MypageDAO mdao;


   @GetMapping("/myhome") // 홈 페이지 매핑
   public String myhome() { 
      return "mypage/myhome";
   }
   
   @GetMapping("/reservation")// 나의 예매정보 페이지 매핑
   public String reservation() {
      return "mypage/reservation"; 
   }
   
   @GetMapping("/payment") //결제 내역 페이지 매핑
   public String payment() {
      return "mypage/payment";
   }
   
   @GetMapping("/inquiry") //1:1 문의 내역 페이지 매핑
   public String inquiry() {
      return "mypage/inquiry";
   }
   
   @GetMapping("/profile") //회원 정보 변경 페이지 매핑
   public String profile(HttpSession session) {
      // 패스워드 확인 여부를 세션에서 확인
        if (session.getAttribute("passwordChecked") == null) {
            return "redirect:/passcheck?redirectUrl=/profile";
        }
        // 패스워드 확인됐으면 확인여부 정보는 다시 세션에서 삭제
        session.removeAttribute("passwordChecked");
      return "mypage/profile";
   }
   
   // 회원 정보 변경 처리(update)
   @PostMapping("/profileUpdate")
   public String profileUpdate(CustomerDTO cusDTO, HttpSession session, RedirectAttributes redirectAttributes) {
      try {
         mdao.updateCusInfo(cusDTO);
         redirectAttributes.addFlashAttribute("message", "수정되었습니다");
         return "redirect:/myhome";
      } catch (Exception e) {
           redirectAttributes.addFlashAttribute("errorMessage", "다시 시도해주세요");
           session.setAttribute("passwordChecked", true);
           return "redirect:/profile";
       }
      
   }
   
   @GetMapping("/cancel") //회원 탈퇴 페이지 매핑
   public String cancel(HttpSession session) {
      // 패스워드 확인 여부를 세션에서 확인
        if (session.getAttribute("passwordChecked") == null) {
            return "redirect:/passcheck?redirectUrl=/cancel";
        }
        // 패스워드 확인됐으면 확인여부 정보는 다시 세션에서 삭제
        session.removeAttribute("passwordChecked");
      return "mypage/cancel";
   }
   
   @GetMapping("/passcheck") // 패스워드 확인 페이지 매핑
   public String passcheck() {
      return "mypage/passcheck";
   }
   
   
   
   // 회원 id 통해 회원정보를 db에서 읽어와 customerDTO에 저장하여 세션에 저장&반환
   @PostMapping("/customerInfo")
   @ResponseBody
   public CustomerDTO getCustomerInfo(HttpServletRequest req) {
      int id = Integer.parseInt(req.getParameter("id"));
      System.out.println(id);
      CustomerDTO cusDTO = mdao.getCustomerInfo(id);
      HttpSession session = req.getSession();
      session.setAttribute("cusDTO", cusDTO);
      System.out.println("로그인유저 id: " + cusDTO.getId() + ", 닉네임: " + cusDTO.getNickname());
      return cusDTO;
   }
   
   // 프로필 수정, 회원 탈퇴 전 패스워드확인 요청 처리
   @PostMapping("/checkPasswd")
    public ModelAndView checkPassword(@RequestParam("passwd") String passwd,
                                      @RequestParam("redirectUrl") String redirectUrl,
                                      HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        // 로그인된 사용자 정보 가져오기
        CustomerDTO cusDTO = (CustomerDTO)session.getAttribute("cusDTO");
        //System.out.println("패스워드 확인된 유저 id: " + cusDTO.getId() + ", 패스워드: " + cusDTO.getPasswd());

        // 패스워드 확인
        if (passwd.equals(cusDTO.getPasswd())) {
            // 패스워드가 맞다면 세션에 저장, 원래 가고자 했던 URL로 리다이렉트
           session.setAttribute("passwordChecked", true);
            modelAndView.setViewName("redirect:" + redirectUrl);
        } else {
            // 패스워드가 틀리면 다시 패스워드 확인 페이지로 돌아감
            modelAndView.setViewName("mypage/passcheck");
            modelAndView.addObject("errorMessage", "패스워드가 일치하지 않습니다. 다시 시도하세요.");
        }
        return modelAndView;
    }
   
   @PostMapping("/deleteCustomer")
    public String deleteCustomer(HttpServletRequest req, 
                        @RequestParam("passwd") String passwd, 
                        @RequestParam("passwd1") String passwd1, 
                        RedirectAttributes redirectAttributes) {
       HttpSession session = req.getSession();

       // 세션에서 사용자 정보를 가져옴
       CustomerDTO cusDTO = (CustomerDTO) session.getAttribute("cusDTO");
       
       // 패스워드와 패스워드 확인 값이 일치하지 않으면 오류 메시지와 함께 페이지로 리다이렉트
       if (!passwd.equals(passwd1)) {
           redirectAttributes.addFlashAttribute("error", "패스워드가 일치하지 않습니다.");
           return "redirect:/cancel";
       }

       // 입력된 패스워드가 데이터베이스의 패스워드와 일치하는지 확인
       if (!cusDTO.getPasswd().equals(passwd)) {
           redirectAttributes.addFlashAttribute("error", "패스워드가 일치하지 않습니다.");
           return "redirect:/cancel";
       }

       // 사용자 정보 삭제
       mdao.deleteCustomer(cusDTO.getId());
       System.out.println("삭제완료");

       // 세션 무효화 (로그아웃 효과)
       session.invalidate();

       // 홈 페이지로 리다이렉트
       return "redirect:/myhome";  // 홈 페이지 경로가 맞는지 확인 필요
       }

   
} 
