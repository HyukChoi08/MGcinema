package com.cinema.mypage;
import org.apache.ibatis.annotations.Param;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageDAO {
   CustomerDTO getCustomerInfo(int id);
   void updateCusInfo(CustomerDTO cusDTO);
   void deleteCustomer(int id);
   CustomerDTO getCustomerInfoByUid(String uid);  // 새로 추가
   // 닉네임 업데이트 메서드
   void updateNickname(@Param("uid") String uid, @Param("nickname") String newNickname);
   // 1:1 문의 관련
   ArrayList<InquiryDTO> getInquiryList(int customer_id); // 문의글 목록 가져오기
   void inquiryWrite(InquiryDTO inqDTO); // 문의글 등록하기
   InquiryDTO getInquiryDetail(int id); // 문의글 상세내용 가져오기
   
   //예매 정보
   ArrayList<MovieGetDTO> getMovieList(String customer_id); // 예매 목록 
   // 예매 정보 삭제
   void deleteMovieReservation(int id);

   // 예매 정보를 moviedelete 테이블로 이동
   void moveToMovieDelete(int id);
   
// 취소된 예매 내역 조회
   ArrayList<MovieGetDTO> getCanceledMovieList(String customer_id);
}

