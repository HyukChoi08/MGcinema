package com.cinema.mypage;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;




public interface InquiryDAO {
	ArrayList<InquiryDTO> getList(int start);
}
 