package com.cinema.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
    private Long id;
    private String title;
    private String content;
    private int viewCount;
}
