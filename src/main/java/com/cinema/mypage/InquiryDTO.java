package com.cinema.mypage;

import lombok.Data;

@Data
public class InquiryDTO {
	int id;
	int customer_id;
	String title;
	String content;
	String answer;
	String created;
	String ancreated;
	String current;

}