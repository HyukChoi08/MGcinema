package com.cinema.mypage;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String myhome(HttpSession session, Model model) { 
		String uid = (String)session.getAttribute("uid");

		// uid가 null이 아닌 경우 세션에 cusDTO 저장
		if (uid != null) {
			CustomerDTO cusDTO = mdao.getCustomerInfoByUid(uid);
			session.setAttribute("cusDTO", cusDTO);

			// 예매 목록 가져오기
			ArrayList<MovieGetDTO> arrmovieDTO = mdao.getMovieList(uid);
			model.addAttribute("getMovies", arrmovieDTO);  // 예매 목록을 Model에 추가

			System.out.println(arrmovieDTO);  // cusDTO 값 출력
		} else {
			return "redirect:/login";
		}
		return "mypage/myhome";
	}

	//   @GetMapping("/reservation") // 나의 예매정보 페이지 매핑
	//   public String reservation() {
	//      return "mypage/reservation"; 
	//   }


	// 닉네임 업데이트 처리
	@PostMapping("/updateNickname")
	@ResponseBody
	public String updateNickname(@RequestParam("nickname") String newNickname, HttpSession session) {
		String uid = (String) session.getAttribute("uid");

		if (uid != null && newNickname != null && !newNickname.isEmpty()) {
			// DAO를 통해 닉네임 업데이트
			mdao.updateNickname(uid, newNickname);
			return "닉네임이 성공적으로 변경되었습니다.";
		} else {
			return "닉네임 변경에 실패했습니다.";
		}
	}

	@GetMapping("/payment") // 결제 내역 페이지 매핑
	public String payment() {
		return "mypage/payment";
	}

	//예매 리스트 조회
	@GetMapping("/reservation")
	public String movieGetList(HttpSession session, Model model) {
		String customer_id = (String)session.getAttribute("uid");
		System.out.println(customer_id);
		ArrayList<MovieGetDTO> arrmovieDTO = mdao.getMovieList(customer_id);
		model.addAttribute("getMovies", arrmovieDTO);
		System.out.println(arrmovieDTO); 

		// 취소된 예매 리스트 조회
		ArrayList<MovieGetDTO> canceledMoviesDTO = mdao.getCanceledMovieList(customer_id);
		model.addAttribute("canceledMovies", canceledMoviesDTO);
		return "mypage/reservation";
	}

	// 예매 취소 처리
	@PostMapping("/reservation/cancel")
	@ResponseBody
	public String cancelReservation(@RequestParam("id") int id) {
		// 영화 예매 정보를 moviedelete 테이블로 이동
		mdao.moveToMovieDelete(id);
		// moviepay 테이블에서 영화 예매 정보 삭제
		mdao.deleteMovieReservation(id);

		return "success";
	}
	// 1:1문의 리스트 조회
	@GetMapping("/inquiry") 
	public String getInquiryList(HttpSession session, Model model) {
		CustomerDTO cusDTO = (CustomerDTO) session.getAttribute("cusDTO");
		int customer_id = cusDTO.getId(); 
		ArrayList<InquiryDTO> arrInqDTO = mdao.getInquiryList(customer_id);
		model.addAttribute("inquiries", arrInqDTO);
		return "mypage/inquirylist";
	}

	// 1:1문의 작성폼
	@GetMapping("/inquirywrite")
	public String getInquiryForm(Model model, HttpSession session) {
		model.addAttribute("view", "inquirywrite");
		CustomerDTO cusDTO = (CustomerDTO)(session.getAttribute("cusDTO"));
		int customer_id = cusDTO.getId(); 

		//문의 목록 표출  HttpSession session) 세션에 정보를 담아서 페이지로 넘김 
		ArrayList<InquiryDTO> arrInqDTO = mdao.getInquiryList(customer_id);
		System.out.println("arrInqDTO size="+ arrInqDTO.size());
		model.addAttribute("inquiries", arrInqDTO);
		return "mypage/inquirydetail";
	}

	// 1:1 문의 DB 등록
	@PostMapping("/inquirywrite")
	public String inquiryWrite(HttpSession session, InquiryDTO inqDTO) {
		CustomerDTO cusDTO = (CustomerDTO) session.getAttribute("cusDTO");
		int customer_id = cusDTO.getId();
		inqDTO.setCustomer_id(customer_id);
		mdao.inquiryWrite(inqDTO);
		return "redirect:/inquiry";
	}

	// 1:1 문의글 상세 내용 확인
	@GetMapping("/inquirydetail/{id}")
	public String inquiryDetail(@PathVariable("id") int id, Model model,HttpSession session) {
		InquiryDTO inqDTO = mdao.getInquiryDetail(id);
		System.out.println("문의 title: " + inqDTO.getTitle());

		model.addAttribute("inquiry", inqDTO);
		model.addAttribute("view", "inquirydetail");
		//게시글 불러오는 부분을 복 붙
		CustomerDTO cusDTO = (CustomerDTO)(session.getAttribute("cusDTO"));
		int customer_id = cusDTO.getId(); 
		ArrayList<InquiryDTO> arrInqDTO = mdao.getInquiryList(customer_id);
		System.out.println("arrInqDTO size="+ arrInqDTO.size());
		//모델에 문의 목록 추가 
		model.addAttribute("inquiries", arrInqDTO);
		return "mypage/inquirydetail";
	} 


	// 회원 정보 변경 페이지
	@GetMapping("/profile")
	public String profile(HttpSession session) {
		if (session.getAttribute("passwordChecked") == null) {
			return "redirect:/passcheck?redirectUrl=/profile";
		}
		session.removeAttribute("passwordChecked");
		return "mypage/profile";
	}

	// 회원 정보 변경 처리
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

	// 회원 탈퇴 페이지
	@GetMapping("/cancel")
	public String cancel(HttpSession session) {
		if (session.getAttribute("passwordChecked") == null) {
			return "redirect:/passcheck?redirectUrl=/cancel";
		}
		session.removeAttribute("passwordChecked");
		return "mypage/cancel";
	}

	// 패스워드 확인 페이지
	@GetMapping("/passcheck")
	public String passcheck() {
		return "mypage/passcheck";
	}



	// 프로필 수정 - 회원 id로 정보 조회 및 세션 저장
	@PostMapping("/customerInfo")
	@ResponseBody
	public CustomerDTO getCustomerInfo(HttpSession session) {
		String uid = (String)session.getAttribute("uid");
		System.out.println("uid: "+uid);

		CustomerDTO cusDTO = mdao.getCustomerInfoByUid(uid);
		session.setAttribute("cusDTO", cusDTO);

		return cusDTO;
	}

	// 패스워드 확인 후 리다이렉트
	@PostMapping("/checkPasswd")
	public ModelAndView checkPassword(@RequestParam("passwd") String passwd,
			@RequestParam("redirectUrl") String redirectUrl,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		CustomerDTO cusDTO = (CustomerDTO) session.getAttribute("cusDTO");

		if (passwd.equals(cusDTO.getPasswd())) {
			session.setAttribute("passwordChecked", true);
			modelAndView.setViewName("redirect:" + redirectUrl);
		} else {
			modelAndView.setViewName("mypage/passcheck");
			modelAndView.addObject("errorMessage", "패스워드가 일치하지 않습니다. 다시 시도하세요.");
		}
		return modelAndView;
	}

	// 회원 탈퇴 처리
	@PostMapping("/deleteCustomer")
	public String deleteCustomer(HttpServletRequest req, 
			@RequestParam("passwd") String passwd, 
			@RequestParam("passwd1") String passwd1, 
			RedirectAttributes redirectAttributes) {
		HttpSession session = req.getSession();

		CustomerDTO cusDTO = (CustomerDTO) session.getAttribute("cusDTO");

		if (cusDTO == null) {
			redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
			return "redirect:/login";
		}

		if (!passwd.equals(passwd1)) {
			redirectAttributes.addFlashAttribute("error", "패스워드가 일치하지 않습니다.");
			return "redirect:/cancel";
		}

		if (!cusDTO.getPasswd().equals(passwd)) {
			redirectAttributes.addFlashAttribute("error", "패스워드가 일치하지 않습니다.");
			return "redirect:/cancel";
		}

		mdao.deleteCustomer(cusDTO.getId());
		session.invalidate();

		return "redirect:/cinema"; // 홈 페이지로 리다이렉트
	}
}

