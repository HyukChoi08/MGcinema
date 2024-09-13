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

    List<FAQDTO> getFAQsByKeyword(@Param("keyword") String keyword, @Param("size") int size, @Param("offset") int offset);
    int getTotalFAQCountByKeyword(@Param("keyword") String keyword);

    List<FAQDTO> getFAQsBySelected(@Param("selected") String selected, @Param("size") int size, @Param("offset") int offset);
    int getTotalFAQCountBySelected(@Param("selected") String selected);
}
