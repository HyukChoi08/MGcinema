package com.cinema.chart;

import lombok.Data;

@Data
public class chartPutCommentDTO {
int id;
int moviechart;
String content;
String writer;
String created_at;
int liked;
}
