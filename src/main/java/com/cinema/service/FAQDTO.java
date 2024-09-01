package com.cinema.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FAQDTO {
    private Long id;                // ID
    private String title;           // 제목
    private String content;         // 내용
    private int viewCount;          // 조회수
    private LocalDateTime created_at; // 생성일자
}
