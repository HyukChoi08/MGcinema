package com.cinema.management;

import lombok.Data;

@Data
public class NewsDTO {
	int id;
	String title;
	String selected;
	String content;
	String created_at;
	int views;
}
