package com.zsk.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Seat implements Serializable{
/**
 * create table seat
(
   seat_id              int not null auto_increment,
   studio_id            int,
   seat_row             int,
   seat_column          int,
   seat_status          int
   primary key (seat_id)
);
 */
	private Integer seat_id;
	private Integer studio_id;
	private Integer seat_row;
	private Integer seat_column;
	private Integer seat_status =1;
	private Studio studio;//
	private List<Ticket> ticketlist=new ArrayList<Ticket>();
	public Integer getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(Integer seat_id) {
		this.seat_id = seat_id;
	}
	public Integer getStudio_id() {
		return studio_id;
	}
	public void setStudio_id(Integer studio_id) {
		this.studio_id = studio_id;
	}
	public Integer getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(Integer seat_row) {
		this.seat_row = seat_row;
	}
	public Integer getSeat_column() {
		return seat_column;
	}
	public void setSeat_column(Integer seat_column) {
		this.seat_column = seat_column;
	}
	public Integer getSeat_status() {
		return seat_status;
	}
	public void setSeat_status(Integer seat_status) {
		this.seat_status = seat_status;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	public List<Ticket> getTicketlist() {
		return ticketlist;
	}
	public void setTicketlist(List<Ticket> ticketlist) {
		this.ticketlist = ticketlist;
	}
	
	
}
