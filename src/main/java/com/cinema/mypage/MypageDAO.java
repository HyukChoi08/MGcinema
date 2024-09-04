package com.cinema.mypage;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageDAO {
   CustomerDTO getCustomerInfo(int id);
   void updateCusInfo(CustomerDTO cusDTO);
   void deleteCustomer(int id);
   CustomerDTO getCustomerInfoByUid(String uid);  // 새로 추가
   
   // 1:1 문의 관련
   ArrayList<InquiryDTO> getInquiryList(int customer_id); // 문의글 목록 가져오기
   void inquiryWrite(InquiryDTO inqDTO); // 문의글 등록하기
   InquiryDTO getInquiryDetail(int id); // 문의글 상세내용 가져오기
   
   //예매 정보
   ArrayList<MovieGetDTO> getMovieList(String customer_id); // 예매 목록 
}
