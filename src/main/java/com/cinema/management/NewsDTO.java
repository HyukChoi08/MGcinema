package com.cinema.management;

import lombok.Data;

@Data
public class NewsDTO {
	int id;
	String title;
	String content;
	String created_at;
	int views;
}
