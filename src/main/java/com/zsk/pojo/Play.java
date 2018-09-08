package com.zsk.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Play implements Serializable {
    /*create table play
(
   play_id              int not null auto_increment,
   play_type_id         int,
   play_lang_id         int,
   play_name            varchar(200),
   play_introduction    varchar(2000),
   play_image           longblob,
   play_length          int,
   play_ticket_price    numeric(10,2),
   play_status          smallint comment '取值含义：
            0：待安排演出
            1：已安排演出
            -1：下线',
   primary key (play_id)
);*/
    private Integer play_id;
    private Integer play_type_id;
    private Integer play_lang_id;
    private String play_name;
    private String play_introduction;
    private String play_image;
    private Integer play_length;
    private Double play_ticket_price;
    private Integer play_status = 0;
    private String play_director;
    private String play_actor;
    private String play_shortintro;
    private List<Schedule> scheduleList = new ArrayList<Schedule>();
    private Datadict datadict;

    public Datadict getDatadict() {
        return datadict;
    }

    public void setDatadict(Datadict datadict) {
        this.datadict = datadict;
    }

    public List<Schedule> getScheduleList() {
        return scheduleList;
    }

    public void setScheduleList(List<Schedule> scheduleList) {
        this.scheduleList = scheduleList;
    }

    public Integer getPlay_id() {
        return play_id;
    }

    public void setPlay_id(Integer play_id) {
        this.play_id = play_id;
    }

    public void setPlay_type_id(Integer play_type_id) {
        this.play_type_id = play_type_id;
    }

    public Integer getPlay_lang_id() {
        return play_lang_id;
    }

    public void setPlay_lang_id(Integer play_lang_id) {
        this.play_lang_id = play_lang_id;
    }

    public Integer getPlay_type_id() {

        return play_type_id;
    }

    public String getPlay_name() {
        return play_name;
    }

    public void setPlay_name(String play_name) {
        this.play_name = play_name;
    }

    public String getPlay_introduction() {
        return play_introduction;
    }

    public void setPlay_introduction(String play_introduction) {
        this.play_introduction = play_introduction;
    }

    public String getPlay_image() {
        return play_image;
    }

    public void setPlay_image(String play_image) {
        this.play_image = play_image;
    }

    public Integer getPlay_length() {
        return play_length;
    }

    public void setPlay_length(Integer play_length) {
        this.play_length = play_length;
    }

    public Double getPlay_ticket_price() {
        return play_ticket_price;
    }

    public void setPlay_ticket_price(Double play_ticket_price) {
        this.play_ticket_price = play_ticket_price;
    }

    public Integer getPlay_status() {
        return play_status;
    }

    public void setPlay_status(Integer play_status) {
        this.play_status = play_status;
    }

    public String getPlay_director() {
        return play_director;
    }

    public void setPlay_director(String play_director) {
        this.play_director = play_director;
    }

    public String getPlay_actor() {
        return play_actor;
    }

    public void setPlay_actor(String play_actor) {
        this.play_actor = play_actor;
    }

    public String getPlay_shortintro() {
        return play_shortintro;
    }

    public void setPlay_shortintro(String play_shortintro) {
        this.play_shortintro = play_shortintro;
    }
}
