package com.zsk.pojo;

import java.io.Serializable;
import java.util.Date;

public class Saleitem implements Serializable {
    private Integer sale_item_id;
    private Integer ticket_id;
    private Double sale_item_price;
    private Date sale_item_time;
    private Integer sale_item_status = 1;
    private User user;
    private Ticket ticket;
    private Play play;

    public Play getPlay() {
        return play;
    }

    public void setPlay(Play play) {
        this.play = play;
    }

    public Integer getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(Integer ticket_id) {
        this.ticket_id = ticket_id;
    }

    public Integer getSale_item_id() {
        return sale_item_id;
    }

    public void setSale_item_id(Integer sale_item_id) {
        this.sale_item_id = sale_item_id;
    }

    public Double getSale_item_price() {
        return sale_item_price;
    }

    public void setSale_item_price(Double sale_item_price) {
        this.sale_item_price = sale_item_price;
    }

    public Date getSale_item_time() {
        return sale_item_time;
    }

    public void setSale_item_time(Date sale_item_time) {
        this.sale_item_time = sale_item_time;
    }

    public Integer getSale_item_status() {
        return sale_item_status;
    }

    public void setSale_item_status(Integer sale_item_status) {
        this.sale_item_status = sale_item_status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }
}
