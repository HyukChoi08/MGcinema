package com.cinema.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EAQDTO {
    private Long id;
    private String title;
    private String content;
    private int someField; // 필요에 따라 다른 필드를 추가할 수 있습니다.
}
