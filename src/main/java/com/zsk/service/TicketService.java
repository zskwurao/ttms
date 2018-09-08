package com.zsk.service;

import com.zsk.pojo.Ticket;

import java.util.List;

public interface TicketService {

    void updateTicket(String ids);

    public List<Integer> getTicketId(Integer sched_id);

    public void updateStatus(Integer ticket_id);
}
