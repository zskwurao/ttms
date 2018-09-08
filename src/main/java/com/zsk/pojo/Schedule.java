package com.zsk.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Schedule implements Serializable{
	/**
	 * create table schedule
(
   sched_id             int not null auto_increment,
   studio_id            int,
   play_id              int,
   sched_time           datetime not null,
   sched_ticket_price   numeric(10,2),
   primary key (sched_id)
);
	 */
	private Integer sched_id;
	private Integer studio_id;
	private Integer play_id;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date  sched_time;
	private  Date end_time;
	private Double sched_ticket_price;
	private Play play;
	private Studio studio;//һ���ݳ��ƻ�һ���ݳ������ݳ����ж���ݳ��ƻ�
	private List<Ticket> list = new ArrayList<Ticket>();



	public Integer getSched_id() {
		return sched_id;
	}
	public void setSched_id(Integer sched_id) {
		this.sched_id = sched_id;
	}
	public Integer getStudio_id() {
		return studio_id;
	}
	public void setStudio_id(Integer studio_id) {
		this.studio_id = studio_id;
	}
	public Integer getPlay_id() {
		return play_id;
	}
	public void setPlay_id(Integer play_id) {
		this.play_id = play_id;
	}

	public Play getPlay() {
		return play;
	}

	public void setPlay(Play play) {
		this.play = play;
	}

	public Date getSched_time() {
		return sched_time;
	}
	public void setSched_time(Date sched_time) {
		this.sched_time = sched_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public Double getSched_ticket_price() {
		return sched_ticket_price;
	}
	public void setSched_ticket_price(Double sched_ticket_price) {
		this.sched_ticket_price = sched_ticket_price;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	public List<Ticket> getList() {
		return list;
	}
	public void setList(List<Ticket> list) {
		this.list = list;
	}


}
