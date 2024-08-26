package com.cinema.service;

import java.util.List;

public interface NewsDAO {
    void insertNews(NewsDTO news);
    void updateNews(NewsDTO news);
    void deleteNews(int id);
    NewsDTO getNewsById(int id);
    List<NewsDTO> getAllNews();
}

