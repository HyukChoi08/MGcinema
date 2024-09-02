package com.cinema.home;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class HomepageController {
	
	@Autowired
	public logDAO ldao; 
	
	@GetMapping("/")
	public String home(HttpServletRequest req,Model model) {
		String linkstr = "";
		HttpSession s = req.getSession();
		String id = (String) s.getAttribute("uid");
		System.out.println(id);
		String Nickname = ldao.getNickname(id);
		System.out.println(Nickname);
		
		s.setAttribute("Nick", Nickname);
		
		if(id == null || id.equals("")) {
			linkstr = "<li><a href='/login'>로그인</a>&nbsp;&nbsp;&nbsp;"+
					"<a href='/signup'>회원가입</a></li>";
		}else {
			linkstr = "<li>사용자 ["+Nickname+"]&nbsp;&nbsp;&nbsp;"+
					"<a href='/logout'>로그아웃</a></li>";
		}
		model.addAttribute("linkstr",linkstr);
		return "home/homepage";
	}
	
	@GetMapping("/login")
	public String login() {
		return "home/login";
	}

	
	@PostMapping("/doLogin")
	public String doLogin(HttpServletRequest req) {
		String uid = req.getParameter("uid");
		String passwd = req.getParameter("passwd");
		
		if (uid==null || uid.equals("")) return "redirect:/login";
		if (passwd==null || passwd.equals("")) return "redirect:/login";
		int n = ldao.loginCheck(uid,passwd);
		System.out.println("n= "+n);
		
		if(n>0) {
			HttpSession s = req.getSession();
			s.setAttribute("uid", uid);
			return "redirect:/";
		} else {	// login 실패
			return "redirect:/login";
		}
	}




	
	
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession s = req.getSession();
		s.invalidate();
		return "redirect:/";
	}

	
	/*
	 * @GetMapping("/signup") public String signup(HttpServletRequest req) {
	 * return"home/signup"; }
	 */ 
	 
	

	@GetMapping("/signup")
	public String signup(HttpServletRequest req, Model model) {
		model.addAttribute("currentStep","1");
	    return "home/signup"; // JSP 파일 경로
	}

	@PostMapping("/signupPost")
	public String signupPost(HttpServletRequest req,Model model) {
		String currentStep = req.getParameter("currentStep");
	    if (currentStep == null) {
	    	currentStep = "1"; // 기본적으로 STEP 1
	    }

	    if ("2".equals(currentStep)) {
	        	
	   } else if ("3".equals(currentStep)) {
		   String realname = req.getParameter("realname");
		   
		   
		   
	       String email = req.getParameter("email");
	       String uid = req.getParameter("uid");

	       
	       String passwd = req.getParameter("passwd");
	       String birthday = req.getParameter("birthday");
	       String mobile = req.getParameter("mobile");
	       String region = req.getParameter("region");
	       String nickname = req.getParameter("nickname");
	       String favorite = req.getParameter("favorite");
	       String tellecom = req.getParameter("tellecom");
	       
	       if (uid == null || uid.trim().isEmpty()) {
	    	    throw new IllegalArgumentException("UID cannot be null or empty");
	   
	       } 	         
	       
	       int uidCount = ldao.checkUidExists(uid);
	        if (uidCount > 0) {
	            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
	            req.setAttribute("currentStep", "2"); // 다시 Step 2로 이동
	            // 폼 데이터 유지
	            model.addAttribute("formData", Map.of(
	                "realname", realname,
	                "email", email,
	                "uid", uid,
	                "passwd", passwd

	            ));
	            return "home/signup";
	        }
	       
	       
	       ldao.insertSignup(realname, email, uid, passwd, birthday, mobile, region, nickname, favorite, tellecom);
	   }

	       // 다음 단계로 이동하기 위해 JSP에 currentStep 전달
	       req.setAttribute("currentStep", currentStep);
	       return "home/signup"; // JSP 파일 경로
	    }
	


}