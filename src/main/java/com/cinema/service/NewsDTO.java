package com.cinema.service;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class NewsDTO {
    private Long id;
    private String title;
    private String content;
    private String created_at;
    private int views;
    private String selected;
    
}
