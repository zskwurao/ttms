package com.zsk.controller;

import com.zsk.dao.SaleItemMapper;
import com.zsk.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/ticket")
@Controller
public class TicketController {
    @Autowired
    private TicketService ticketService;
    @Autowired
    private SaleItemMapper saleItemMapper;
    @RequestMapping("/getTicketId.action")
    @ResponseBody
    public List getTicketId(Integer sched_id){
        List<Integer> list = ticketService.getTicketId(sched_id);
        return list;
    }
    @RequestMapping("/updateStatus.action")
    public String updateStatus(Integer ticket_id){
        ticketService.updateStatus(ticket_id);
        saleItemMapper.updateStatus(ticket_id);
        return "redirect:/saleitem/selectListByUserId.action";
    }
}
