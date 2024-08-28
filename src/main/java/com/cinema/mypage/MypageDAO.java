package com.cinema.mypage;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageDAO {
   CustomerDTO getCustomerInfo(int id);
   void updateCusInfo(CustomerDTO cusDTO);
   void deleteCustomer(int id);
   
   // 1:1 문의 관련
   ArrayList<InquiryDTO> getInquiryList(int customer_id);
}
