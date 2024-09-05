package com.cinema.service;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FAQDAO {
    List<FAQDTO> getAllFAQs(@Param("size") int size, @Param("offset") int offset);
    int getTotalFAQCount();
    FAQDTO getFAQById(@Param("id") Long id);
    void addFAQ(FAQDTO faq);
    void updateFAQ(FAQDTO faq);
    void deleteFAQ(@Param("id") Long id);
    
    // 검색어를 기반으로 FAQ 목록을 가져오는 메서드
    List<FAQDTO> getFAQsByKeyword(@Param("keyword") String keyword, @Param("size") int size, @Param("offset") int offset);
    
    // 검색어를 기반으로 FAQ 총 개수를 가져오는 메서드
    int getTotalFAQCountByKeyword(@Param("keyword") String keyword);
    
    // 선택된 항목을 기반으로 FAQ 목록을 가져오는 메서드
    List<FAQDTO> getFAQsBySelected(@Param("selected") String selected, @Param("size") int size, @Param("offset") int offset);
    
    // 선택된 항목을 기반으로 FAQ 총 개수를 가져오는 메서드
    int getTotalFAQCountBySelected(@Param("selected") String selected);
}
