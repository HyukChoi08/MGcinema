package com.cinema.mypage;

import lombok.Data;

@Data
public class MovieGetDTO {
     int id;
     String random_id;
     String customer_id;
     String movie_name;
     String room_name;
     String totalprice;
     String runningtime;
     String seat;
     String totalpeople;
     String begintime;
     String endtime;
     String datetime;
     String created;
}
