package com.cinema.ticket;


import lombok.Data;

@Data
public class ticketDTO {
	public int id;
    public int movieId;
    public int theaterId;
    public String date;
    public String time;
}
