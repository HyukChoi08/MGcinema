package com.cinema.mypage;

import java.sql.Date;

import lombok.Data;
@Data
public class StorePayDeleteDTO {
    private int id;
    private String customer_id;
    private String random_id;
    private String item_name;
    private int totalprice;
    private Date created;
    private Date updated;

}