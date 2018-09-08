package com.zsk.controller;

import com.zsk.pojo.Play;
import com.zsk.pojo.Schedule;
import com.zsk.service.ScheduleService;
import com.zsk.utils.JsonUtils;
import com.zsk.utils.PageBean;
import net.sf.json.util.JSONUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    @Autowired
    private ScheduleService scheduleService;
    @RequestMapping("/schedule.action")
    public String goTo(){
        return "base/schedule";
    }
    @RequestMapping( "/addSched.action")
    public String addSched(Integer sched_id,Integer studio_id,Integer play_id,String sched_time,Double sched_ticket_price){
        System.out.println(sched_time);
        Schedule schedule = new Schedule();
        schedule.setPlay_id(play_id);
        schedule.setStudio_id(studio_id);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = sf.parse(sched_time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        schedule.setSched_time(date);
        schedule.setSched_ticket_price(sched_ticket_price);
        scheduleService.addSchedule(schedule);
        return "base/schedule";
    }
    @RequestMapping("/pageQuery.action")
    @ResponseBody
    public Object pageQuery(int page, int rows, HttpServletRequest request, HttpServletResponse response) {
        PageBean pageBean = new PageBean();
        pageBean.setPage(page);
        pageBean.setPageSize(rows);
        scheduleService.pageQuery(pageBean);
        return pageBean;
    }
    @RequestMapping("/getSchedule.action")
    public String getSchedule(Model model,String sched_id){
        Schedule schedule = scheduleService.getSchedule(sched_id);
        System.out.println(schedule.getList().size());
        model.addAttribute("schedule",schedule);
        return "html/ticker";
    }
    @RequestMapping(value = "/listajax.action",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<Schedule> listajax(String sched_time,Integer play_id, HttpServletResponse response){
        List<Schedule> list = scheduleService.selectScheduleListByTime(sched_time,play_id);
        for(Schedule schedule : list){
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(schedule.getSched_time());
            calendar.add(Calendar.MINUTE, +schedule.getPlay().getPlay_length());//+1今天的时间加一天
            schedule.setEnd_time((Date) calendar.getTime());
        }
        return list;
    }
    @RequestMapping("/deleteSchedule.action")
    public String deleteSchedule(String ids){
        //scheduleService.deleteSchedule(ids);
        System.out.println(ids);
        return "base/schedule";
    }
    @RequestMapping("/getTime.action")
    @ResponseBody
    public List getTime(Integer id){
        List<String> list = scheduleService.getTime(id);
        return list;
    }
}
