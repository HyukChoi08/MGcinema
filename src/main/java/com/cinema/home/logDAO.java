package com.cinema.home;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface logDAO {
	int loginCheck(String uid, String passwd);	// 로그인
	
    void insertSignup(String realname, String email, String uid, 
    		String passwd, String birthday, String mobile,
    		String region, String nickname, String favorite, String tellecom);	// 회원가입
    
    int checkUidExists(String uid); // 아이디 중복 체크
    
    String getNickname(String a);
	String getFindId (String z, String a, String b);
	
	String getFindP (String z, String a, String b);
}
