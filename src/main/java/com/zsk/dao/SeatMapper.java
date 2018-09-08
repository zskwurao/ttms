package com.zsk.dao;

import com.zsk.pojo.Seat;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SeatMapper {
    public void addSeat(Seat seat);

    public Long count();

    List<Seat> pageQuery(RowBounds rowBounds);

    public void editSeat(Seat seat);

    public void deleteSeat(int i);

    public List<Seat> selectById(Integer studio_id);

    public Seat selectSeatById(Integer seat_id);
}
