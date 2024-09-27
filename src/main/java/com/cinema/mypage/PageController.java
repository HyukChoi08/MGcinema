package com.cinema.mypage;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cinema.chart.chartDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class PageController {

	@Autowired
	MypageDAO mdao;

	@GetMapping("/myhome")
	public String myhome(HttpSession session, Model model) { 
		String uid = (String)session.getAttribute("uid");

		// uid가 null이 아닌 경우 세션에 cusDTO 저장
		if (uid != null) {
			CustomerDTO cusDTO = mdao.getCustomerInfoByUid(uid);
			session.setAttribute("cusDTO", cusDTO);

			// 예매 목록 가져오기
			ArrayList<MovieGetDTO> arrmovieDTO = mdao.getMovieList(uid);
			model.addAttribute("getMovies", arrmovieDTO);  // 전체 예매 목록을 Model에 추가
			/* System.out.println(arrmovieDTO); */
			// 최근 5건의 예매 목록을 가져오기
			List<MovieGetDTO> recentMovies = mdao.getRecentMovies(uid);
			model.addAttribute("recentMovies", recentMovies);
			model.addAttribute("totalMoviesCount", arrmovieDTO.size());

			// 상위 3개의 영화 가져오기
			List<chartDTO> topMovies = mdao.getTop3MoviesByReservation();
			model.addAttribute("topMovies", topMovies);
			/* System.out.println(topMovies); */
			/* System.out.println(arrmovieDTO); */ // cusDTO 값 출력
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


	/*
	 * @GetMapping("/payment") // 결제 내역 페이지 매핑 public String payment() { return
	 * "mypage/payment"; }
	 */

	// 예매 리스트 
	@GetMapping("/reservation")
	public String movieGetList(HttpSession session, Model model, 
			@RequestParam(value = "page", defaultValue = "1") int page, 
			@RequestParam(value = "canceledPage", defaultValue = "1") int canceledPage) {

		String customer_id = (String) session.getAttribute("uid");

		int limit = 10;  // 한 페이지에 10개씩
		int offset = (page - 1) * limit;

		// 페이징된 예매 리스트 가져오기
		ArrayList<MovieGetDTO> arrmovieDTO = mdao.getMovieListWithPaging(customer_id, limit, offset);
		model.addAttribute("getMovies", arrmovieDTO);

		// 총 예매 수 구하기 (페이지네이션을 위해 필요)
		int totalReservations = mdao.getTotalReservationCount(customer_id);
		int listTotalPages = (int) Math.ceil((double) totalReservations / limit);

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", listTotalPages);
		// 현재 시간 추가
		model.addAttribute("currentTime", LocalDateTime.now());
		/* System.out.println(LocalDateTime.now()); */

		// 취소된 예매 리스트 조회 및 페이징
		int canceledOffset = (canceledPage - 1) * limit;
		ArrayList<MovieGetDTO> canceledMoviesDTO = mdao.getCanceledMovieListWithPaging(customer_id, limit, canceledOffset);
		model.addAttribute("canceledMovies", canceledMoviesDTO);

		// 총 취소된 예매 수 구하기 (페이지네이션을 위해 필요)
		int totalCanceledReservations = mdao.getTotalCanceledReservationCount(customer_id);
		int totalCanceledPages = (int) Math.ceil((double) totalCanceledReservations / limit);

		model.addAttribute("currentCanceledPage", canceledPage);
		model.addAttribute("totalCanceledPages", totalCanceledPages);

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
	public String getInquiryList(HttpSession session, Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		CustomerDTO cusDTO = (CustomerDTO) session.getAttribute("cusDTO");
		int customer_id = cusDTO.getId(); 

		int limit = 5; // 한 페이지에 5개씩 출력되도록 변경
		int offset = (page - 1) * limit; // 페이지에 따른 offset 계산


		List<InquiryDTO> arrInqDTO = mdao.getInquiryList(customer_id, offset, limit);
		model.addAttribute("inquiries", arrInqDTO);


		int totalCount = mdao.getTotalInquiryCount(customer_id); // 총 문의 내역 수 가져옴
		int totalPages = (int) Math.ceil((double) totalCount / limit); // 전체 페이지 수 계산
		model.addAttribute("currentPage", page); // 현재 페이지를 모델에 추가
		model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가

		return "mypage/inquirylist";
	}

	// 1:1문의 작성폼
	@GetMapping("/inquirywrite")
	public String getInquiryForm(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page) {

		int limit = 5; // 한 페이지에 5개씩 출력되도록 변경
		int offset = (page - 1) * limit; // 페이지에 따른 offset 계산

		model.addAttribute("view", "inquirywrite");
		CustomerDTO cusDTO = (CustomerDTO)(session.getAttribute("cusDTO"));
		int customer_id = cusDTO.getId(); 

		//문의 목록 표출  HttpSession session) 세션에 정보를 담아서 페이지로 넘김 페이징 offset, limit +
		List<InquiryDTO> arrInqDTO = mdao.getInquiryList(customer_id, offset, limit);
		System.out.println("arrInqDTO size="+ arrInqDTO.size());
		model.addAttribute("inquiries", arrInqDTO);

		int totalCount = mdao.getTotalInquiryCount(customer_id); // 총 문의 내역 수 가져옴
		int totalPages = (int) Math.ceil((double) totalCount / limit); // 전체 페이지 수 계산
		model.addAttribute("currentPage", page); // 현재 페이지를 모델에 추가
		model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가

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
	public String inquiryDetail(@PathVariable("id") int id, Model model,HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page) {
		InquiryDTO inqDTO = mdao.getInquiryDetail(id);
		/* System.out.println("문의 title: " + inqDTO.getTitle()); */

		model.addAttribute("inquiry", inqDTO);
		model.addAttribute("view", "inquirydetail");

		//게시글 불러오는 부분을 복 붙
		CustomerDTO cusDTO = (CustomerDTO)(session.getAttribute("cusDTO"));
		int customer_id = cusDTO.getId(); 

		int limit = 5; // 한 페이지에 5개씩 출력되도록 변경
		int offset = (page - 1) * limit; // 페이지에 따른 offset 계산

		List<InquiryDTO> arrInqDTO = mdao.getInquiryList(customer_id, offset, limit);
		/* System.out.println("arrInqDTO size="+ arrInqDTO.size()); */
		//모델에 문의 목록 추가 
		model.addAttribute("inquiries", arrInqDTO);

		int totalCount = mdao.getTotalInquiryCount(customer_id); // 총 문의 내역 수 가져옴
		int totalPages = (int) Math.ceil((double) totalCount / limit); // 전체 페이지 수 계산
		model.addAttribute("currentPage", page); // 현재 페이지를 모델에 추가
		model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가

		return "mypage/inquirydetail";
	} 


	// 회원 정보 변경 페이지
	@GetMapping("/profile")
	public String profile(HttpSession session) {
		
		 if (session.getAttribute("passwordChecked") == null) { return
		 "redirect:/passcheck?redirectUrl=/profile"; }
		 session.removeAttribute("passwordChecked");
		return "mypage/profile";
	}
	// 회원 정보 변경 처리
	@PostMapping("/profileUpdate")
	public String profileUpdate(CustomerDTO cusDTO, @RequestParam("profileImage") MultipartFile profileImage, HttpSession session, RedirectAttributes redirectAttributes) {
	    try {
	        // 프로필 이미지가 업로드되지 않은 경우 처리
	        if (profileImage.isEmpty()) {
	            // 이미지가 업로드되지 않으면 기존 이미지를 데이터베이스에서 가져옴
	            String existingImage = mdao.getProfileImage(cusDTO.getId());
	            cusDTO.setProfileimg(existingImage); // 기존 이미지 경로를 다시 설정
	        } else {
	            // 새 이미지가 업로드된 경우
	            String uploadDir = "src/main/resources/static/mypage_image/";
	            File uploadDirectory = new File(uploadDir);
	            if (!uploadDirectory.exists()) {
	                uploadDirectory.mkdirs(); // 디렉토리가 없으면 생성
	            }

	            // 파일 이름 중복 방지를 위해 UUID 사용
	            String originalFilename = profileImage.getOriginalFilename();
	            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
	            String newFilename = UUID.randomUUID().toString() + fileExtension;
	            Path filePath = Paths.get(uploadDir, newFilename);

	            // 파일을 지정한 경로에 저장
	            Files.copy(profileImage.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	            // 웹에서 접근 가능한 경로로 설정 (프로필 이미지 URL)
	            String profileImagePath = "/mypage_image/" + newFilename;
	            cusDTO.setProfileimg(profileImagePath); // DTO에 새 이미지 경로 설정
	        }

	        // 고객 정보 업데이트
	        mdao.updateCusInfo(cusDTO);

	        // 성공 메시지를 설정하고 마이홈 페이지로 리다이렉트
	        redirectAttributes.addFlashAttribute("message", "수정되었습니다");
	        return "redirect:/myhome";
	    } catch (Exception e) {
	        e.printStackTrace(); // 에러 발생 시 콘솔에 출력

	        // 에러 메시지를 설정하고 프로필 페이지로 리다이렉트
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

	    // 로그인 여부 확인
	    if (cusDTO == null) {
	        redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
	        return "redirect:/login";
	    }

	    // 패스워드 확인
	    if (!passwd.equals(passwd1)) {
	        redirectAttributes.addFlashAttribute("error", "패스워드가 일치하지 않습니다.");
	        return "redirect:/cancel";
	    }

	    if (!cusDTO.getPasswd().equals(passwd)) {
	        redirectAttributes.addFlashAttribute("error", "패스워드가 일치하지 않습니다.");
	        return "redirect:/cancel";
	    }

	    // 순차적으로 각 테이블에서 데이터를 삭제

	    mdao.deleteCustomer(cusDTO.getId());  // customer 삭제

	    // 세션 무효화
	    session.invalidate();

	    return "redirect:/cinema"; // 홈 페이지로 리다이렉트
	}


	//스토어 결제내역 목록
	@GetMapping("/payment")
	public String getStoreList(HttpSession session, Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		CustomerDTO cusDTO = (CustomerDTO) session.getAttribute("cusDTO"); // 세션에서 사용자 정보 가져옴
		if (cusDTO == null) {
			return "redirect:/login"; // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
		}

		String customerId = cusDTO.getUid(); // 고객 ID 가져옴
		int limit = 5; // 한 페이지에 5개씩 출력되도록 변경
		int offset = (page - 1) * limit; // 페이지에 따른 offset 계산

		// 결제 내역 리스트 가져옴
		List<StoreListDTO> storeList = mdao.getStoreList(customerId, offset, limit); 

		// item_name 필드를 분리하여 itemName과 composition에 값 할당
		for (StoreListDTO store : storeList) {
			store.parseItemName(store.getItem_name()); // item_name을 나누어서 itemName과 composition 설정
		}

		model.addAttribute("storeList", storeList); // 뷰에 storeList 전달

		int totalCount = mdao.getTotalCount(customerId); // 총 결제 내역 수 가져옴
		int totalPages = (int) Math.ceil((double) totalCount / limit); // 전체 페이지 수 계산
		model.addAttribute("currentPage", page); // 현재 페이지를 모델에 추가
		model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가

		// 취소된 결제 내역 가져오기
		List<StoreListDTO> canceledPayments = mdao.getCanceledPayments(customerId);
		for (StoreListDTO payment : canceledPayments) {
			payment.parseItemName(payment.getItem_name());
		}
		model.addAttribute("canceledPayments", canceledPayments); // 취소된 결제 내역을 모델에 추가

		return "mypage/payment"; // 결제 내역 페이지로 이동
	}

	//결제취소
	@PostMapping("/cancelPayment")
	@ResponseBody
	public String cancelPayment(@RequestParam("id") int id) {
		// DAO를 이용해 결제 내역을 가져옴
		StoreListDTO payment = mdao.getPaymentById(id);

		if (payment != null) {
			// 결제 내역을 storepaydelete 테이블로 옮기고, 원래 결제 내역을 삭제
			mdao.insertCanceledPayment(payment);
			mdao.deletePayment(id);
		}

		return "success";
	}
}