package com.zsk.pojo;

import java.io.Serializable;
import java.util.Date;

public class Ticket implements Serializable{
/**
 * create table ticket
(
   ticket_id            bigint not null auto_increment,
   seat_id              int,
   sched_id             int,
   ticket_price         numeric(10,2),
   ticket_status        smallint comment '�������£�
            0��������
            1������
            9������',
   ticket_locked_time   datetime,
   primary key (ticket_id)
);
 */
	private Integer ticket_id;
	private Integer seat_id;
	private Integer sched_id;
	private Double  ticket_price ;
	private Integer ticket_status = 0;
	private Date ticket_locked_time;
	private Seat seat;
	private Schedule schedule;

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public Integer getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(Integer ticket_id) {
		this.ticket_id = ticket_id;
	}
	public Integer getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(Integer seat_id) {
		this.seat_id = seat_id;
	}
	public Integer getSched_id() {
		return sched_id;
	}
	public void setSched_id(Integer sched_id) {
		this.sched_id = sched_id;
	}
	public Double getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(Double ticket_price) {
		this.ticket_price = ticket_price;
	}
	public Integer getTicket_status() {
		return ticket_status;
	}
	public void setTicket_status(Integer ticket_status) {
		this.ticket_status = ticket_status;
	}
	public Date getTicket_locked_time() {
		return ticket_locked_time;
	}
	public void setTicket_locked_time(Date ticket_locked_time) {
		this.ticket_locked_time = ticket_locked_time;
	}
	public Seat getSeat() {
		return seat;
	}
	public void setSeat(Seat seat) {
		this.seat = seat;
	}
	
	
	
}
