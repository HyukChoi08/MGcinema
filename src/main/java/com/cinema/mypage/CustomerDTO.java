package com.cinema.mypage;

import lombok.Data;
@Data
public class CustomerDTO {
	int id;
	String uid;
	String passwd;
	String realname;
	String nickname;
	String email;
	String address;//region 
	String favorite;
	String mobile;
	String tellecom;
	String created;
	String updated;
	String birthday;
	String profileimg;
	String fulladdress;
	String post;
}