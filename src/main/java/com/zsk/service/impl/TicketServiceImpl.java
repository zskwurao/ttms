package com.zsk.service.impl;

import com.zsk.dao.TicketMapper;
import com.zsk.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TicketServiceImpl implements TicketService {
    @Autowired
    private TicketMapper ticketMapper;
    @Override
    public void updateTicket(String ids) {
        String[] id = ids.split(",");
        for(String s1 :id){
            synchronized(this) {
                ticketMapper.updateTicket(Integer.parseInt(s1));
            }
        }
    }

    @Override
    public List<Integer> getTicketId(Integer sched_id) {
        return ticketMapper.getTicketId(sched_id);
    }

    @Override
    public void updateStatus(Integer ticket_id) {
        ticketMapper.updateStatus(ticket_id);
    }
}
