package com.cinema.mypage;

import java.sql.Date;

import lombok.Data;
@Data
public class StoreListDTO {
    private int id;
    private String customer_id;
    private String ramdom_id;
    private String item_name;
    private int totalprice;
    private Date created;
    private Date updated;
}
