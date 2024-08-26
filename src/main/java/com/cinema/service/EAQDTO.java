package com.cinema.service;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class EAQDTO {
    private String name;
    private String phone;
    private String email;
    private String inquiryType;
    private String theater;
    private String title;
    private String content;
    private MultipartFile attachment;
}
