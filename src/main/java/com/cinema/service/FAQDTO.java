package com.cinema.service;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class FAQDTO {
    private Long id;
    private String title;
    private String content;
    private String created_at;
    private int views;
    private String selected;
    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
  
}
