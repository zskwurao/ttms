package com.zsk.controller;


import com.zsk.pojo.Seat;
import com.zsk.pojo.Studio;
import com.zsk.service.SeatService;
import com.zsk.utils.JsonUtils;
import com.zsk.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/seat")
public class SeatController {
    @Autowired
    private SeatService seatService;
    @RequestMapping("/seat.action")
    public String goTo(){
        return "base/seat";
    }
    @RequestMapping("/addSeat.action")
    public String addSeat(Seat seat){
        seatService.addSeat(seat);
        return "base/seat";
    }
    @RequestMapping("/pageQuery.action")
    public void pageQuery(int page, int rows, HttpServletRequest request, HttpServletResponse response){
        PageBean pageBean = new PageBean();
        pageBean.setPage(page);
        pageBean.setPageSize(rows);
        seatService.pageQuery(pageBean);
        String json = JsonUtils.java2Json(pageBean,new String[]{"ticketlist"});
        response.setContentType("text/json;charset=utf-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/editSeat.action")
    public String editSeat(Seat seat){
        seatService.editSeat(seat);
        return "base/seat";
    }
    @RequestMapping("/deleteSeat.action")
    public String deleteSeat(String ids){
        seatService.deleteSeat(ids);
        return "base/seat";
    }
    @RequestMapping("/toseat.action")
    public String toseat(){
        return "html/ticker";
    }
}
