package com.cinema.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class PageController {
   @Autowired
   MypageDAO mdao;

   @GetMapping("/myhome") // 홈 
   public String myhome() { 
      return "mypage/myhome";
   }
   @GetMapping("/reservation")// 나의 예매정보
   public String reservation() {
      return "mypage/reservation"; 
   }
   
   @GetMapping("/payment") //결제 내역
   public String payment() {
      return "mypage/payment";
   }
   @GetMapping("/inquiry") //1:1 문의 내역 
   public String inquiry() {
      return "mypage/inquiry";
   }
   @GetMapping("/profile") //회원 정보 변경
   public String profile() {
      return "mypage/profile";
   }
   @GetMapping("/cancel") //회원 탈퇴
   public String cancel() {
      return "mypage/cancel";
   }
   
   // 회원 id 통해 회원정보를 db에서 읽어와 customerDTO에 저장
   @PostMapping("/customerInfo")
   @ResponseBody
   public CustomerDTO getCustomerInfo(HttpServletRequest req) {
      int id = Integer.parseInt(req.getParameter("id"));
      System.out.println(id);
      CustomerDTO cusDTO = mdao.getCustomerInfo(id);
      System.out.println(cusDTO.getNickname());
      return cusDTO;
   }
   
   @PostMapping("/checkPasswd")
    public ModelAndView checkPassword(@RequestParam("passwd") String passwd,
                                      @RequestParam("redirectUrl") String redirectUrl,
                                      HttpServletRequest req) {
        ModelAndView modelAndView = new ModelAndView();

        // 로그인된 사용자 정보 가져오기
        int id = Integer.parseInt(req.getParameter("id"));
        CustomerDTO cusDTO = mdao.getCustomerInfo(id);

        // 패스워드 확인
        if (passwd.equals(cusDTO.getPasswd())) {
            // 패스워드가 맞다면 원래 가고자 했던 URL로 리다이렉트
            modelAndView.setViewName("redirect:" + redirectUrl);
        } else {
            // 패스워드가 틀리면 다시 패스워드 확인 페이지로 돌아감
            modelAndView.setViewName("passcheck");
            modelAndView.addObject("errorMessage", "Incorrect password. Please try again.");
        }
        return modelAndView;
    }
   
}
