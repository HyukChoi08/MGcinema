package com.cinema.service;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class FAQDTO {
    private Long id;
    private String title;
    private String content;
    private LocalDateTime createdAt;
    private int views;
    private String selected;
    
}
