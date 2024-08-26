package com.cinema.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EAQDTO {
    private int id;
    private String category;
    private String title;
    private Date date;
}
