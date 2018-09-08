package com.zsk.dao;

import com.zsk.pojo.Ticket;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketMapper {
    void addTicket(Ticket ticket);
    public List<Ticket> selectListById(Integer sched_id);

    Ticket selectById(Integer s);

    public void updateTicket(Integer i);

    public List<Integer> getTicketId(Integer sched_id);

    public void updateStatus(Integer ticket_id);
}
