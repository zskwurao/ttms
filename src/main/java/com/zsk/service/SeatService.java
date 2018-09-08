package com.zsk.service;

import com.zsk.pojo.Seat;
import com.zsk.utils.PageBean;

public interface SeatService {
    public void addSeat(Seat seat);
    public void deleteSeat(String id);
    public Seat selectSeat(int id);

    public void pageQuery(PageBean pageBean);

    public void editSeat(Seat seat);
}
