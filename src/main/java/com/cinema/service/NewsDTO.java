package com.cinema.service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NewsDTO {
    private Long id;         // ID
    private String title;    // 제목
    private String content;  // 내용
    private int views;       // 조회수
}
