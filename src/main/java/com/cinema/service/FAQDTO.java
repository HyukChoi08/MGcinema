package com.cinema.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FAQDTO {
    private Long id;         // ID
    private String title;    // 제목
    private String content;  // 내용
    private int views;       // 조회수
}
