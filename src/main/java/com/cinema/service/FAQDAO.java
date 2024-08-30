package com.cinema.service;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FAQDAO {
    // 모든 FAQ 목록 조회
    List<FAQDTO> getAllFAQs();
    
    // ID로 FAQ 조회
    FAQDTO getFAQById(@Param("id") Long id);
    
    // 새로운 FAQ 추가
    void addFAQ(FAQDTO faq);
    
    // FAQ 수정
    void updateFAQ(FAQDTO faq);
    
    // ID로 FAQ 삭제
    void deleteFAQ(@Param("id") Long id);
}
