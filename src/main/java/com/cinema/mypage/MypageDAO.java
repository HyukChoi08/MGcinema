package com.cinema.mypage;
import org.apache.ibatis.annotations.Param;

import com.cinema.chart.chartDTO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageDAO {
	CustomerDTO getCustomerInfo(int id);
	void updateCusInfo(CustomerDTO cusDTO);
	void deleteCustomer(int id); //고객정보 삭제	

	
	CustomerDTO getCustomerInfoByUid(String uid);  // 새로 추가
	// 닉네임 업데이트 메서드
	void updateNickname(@Param("uid") String uid, @Param("nickname") String newNickname);
	// 기존 프로필 이미지 가져오기
	String getProfileImage(@Param("id") int id);
	
	// 1:1 문의 관련
	ArrayList<InquiryDTO> getInquiryList(int customer_id); // 문의글 목록 가져오기
	// 페이징을 고려한 스토어 내역 조회 메소드
	List<InquiryDTO> getInquiryList(@Param("customerId") int customerId, @Param("offset") int offset, @Param("limit") int limit);	
	void inquiryWrite(InquiryDTO inqDTO); // 문의글 등록하기
	InquiryDTO getInquiryDetail(int id); // 문의글 상세내용 가져오기
	// 전체 데이터 수를 가져오는 메소드
	int getTotalInquiryCount(@Param("customerId") int customerId);	
	
	
	//예매 정보
	ArrayList<MovieGetDTO> getMovieList(String customer_id); // 예매 목록 
	// 예매 정보 삭제
	void deleteMovieReservation(int id);
	// 예매 정보를 moviedelete 테이블로 이동
	void moveToMovieDelete(int id);
	// 취소된 예매 내역 조회
	ArrayList<MovieGetDTO> getCanceledMovieList(String customer_id);
	//예매 목록을 페이징과 정렬로 가져오기
	ArrayList<MovieGetDTO> getMovieListWithPaging(@Param("customer_id") String customer_id, @Param("limit") int limit, @Param("offset") int offset);
	// 총 예매 수 가져오기
	int getTotalReservationCount(@Param("customer_id") String customer_id);
	// DAO에 취소된 예매 목록을 페이징 처리하는 메서드 추가
	ArrayList<MovieGetDTO> getCanceledMovieListWithPaging(@Param("customer_id") String customer_id, @Param("limit") int limit, @Param("offset") int offset);
	// 취소된 예매 총 개수 구하기 메서드 추가
	int getTotalCanceledReservationCount(@Param("customer_id") String customer_id);

	
	// 스토어 결제 목록을가져오기 
	ArrayList<StoreListDTO> getStoreList(String customer_id);
	// 페이징을 고려한 스토어 내역 조회 메소드
	List<StoreListDTO> getStoreList(@Param("customerId") String customerId, @Param("offset") int offset, @Param("limit") int limit);
	// 전체 데이터 수를 가져오는 메소드
	int getTotalCount(@Param("customerId") String customerId);	
	// 결제 내역 조회 메소드 수정 (id 기반)
	StoreListDTO getPaymentById(int id);
	// 결제 취소 내역을 storepaydelete 테이블에 추가하는 메소드
	void insertCanceledPayment(StoreListDTO payment);
	// 결제 내역을 storepay 테이블에서 삭제하는 메소드 (id 기반)
	void deletePayment(int id);
	
	//취소된 결제내역 가져오기 
	List<StoreListDTO> getCanceledPayments(String customerId);
	List<MovieGetDTO> getRecentMovies(String uid);
	
	//영화 상위 가져오기
	 List<chartDTO> getTop3MoviesByReservation();

}