package com.zsk.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Studio implements Serializable {
    /*create table studio
    (
       studio_id            int not null auto_increment,
       studio_name          varchar(100) not null,
       studio_row_count     int,
       studio_col_count     int,
       studio_introduction  varchar(2000),
       studio_flag          smallint comment    'ȡֵ���壺
       primary key (studio_id)
    );
    */
    private Integer studio_id;
    private String studio_name;
    private Integer studio_row_count;
    private Integer studio_col_count;
    private String studio_introduction;
    private Integer studio_flag = 0;
    private List<Seat> seatList = new ArrayList<Seat>();//一个演出厅多个座位
    private List<Schedule> scheduleList = new ArrayList<Schedule>();//一个演出厅多个剧目

    public Integer getStudio_id() {
        return studio_id;
    }

    public void setStudio_id(Integer studio_id) {
        this.studio_id = studio_id;
    }

    public String getStudio_name() {
        return studio_name;
    }

    public void setStudio_name(String studio_name) {
        this.studio_name = studio_name;
    }

    public Integer getStudio_row_count() {
        return studio_row_count;
    }

    public void setStudio_row_count(Integer studio_row_count) {
        this.studio_row_count = studio_row_count;
    }

    public Integer getStudio_col_count() {
        return studio_col_count;
    }

    public void setStudio_col_count(Integer studio_col_count) {
        this.studio_col_count = studio_col_count;
    }

    public String getStudio_introduction() {
        return studio_introduction;
    }

    public void setStudio_introduction(String studio_introduction) {
        this.studio_introduction = studio_introduction;
    }

    public Integer getStudio_flag() {
        return studio_flag;
    }

    public void setStudio_flag(Integer studio_flag) {
        this.studio_flag = studio_flag;
    }

    public List<Seat> getSeatList() {
        return seatList;
    }

    public void setSeatList(List<Seat> seatList) {
        this.seatList = seatList;
    }

    public List<Schedule> getScheduleList() {
        return scheduleList;
    }

    public void setScheduleList(List<Schedule> scheduleList) {
        this.scheduleList = scheduleList;
    }

}
