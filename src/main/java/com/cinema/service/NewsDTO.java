package com.cinema.service;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NewsDTO {
    private Long num; // 게시물 번호
    private String title; // 제목
    private String content; // 내용
    private Timestamp createdate; // 작성일
    private int click; // 조회수
}
