package com.cinema.management;

import lombok.Data;

@Data
public class InquiryDTO {
	int id;
	String nickname;
	String title;
	String current;
	String content;
	String answer;
	String created;
	String ancreated;
}
