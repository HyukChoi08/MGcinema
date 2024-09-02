package com.cinema.service;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface NewsDAO {
    void insertNews(NewsDTO newsDTO);
    void updateNews(NewsDTO newsDTO);
    void deleteNews(@Param("id") Long id);
    NewsDTO getNewsById(@Param("id") Long id);
    List<NewsDTO> getAllNews(@Param("limit") int limit, @Param("offset") int offset); // 페이지네이션 매개변수 추가
    void incrementViewCount(@Param("id") Long id);
    int getTotalNewsCount(); // 전체 뉴스 수를 가져오는 메서드 추가
}
