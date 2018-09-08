package com.zsk.service.impl;

import com.zsk.dao.ScheduleMapper;
import com.zsk.dao.SeatMapper;
import com.zsk.dao.TicketMapper;
import com.zsk.pojo.Schedule;
import com.zsk.pojo.Seat;
import com.zsk.pojo.Ticket;
import com.zsk.service.ScheduleService;
import com.zsk.utils.PageBean;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Autowired
    private SeatMapper seatMapper;
    @Autowired
    private TicketMapper ticketMapper;
    @Override
    public void addSchedule(Schedule sch) {
        int i = scheduleMapper.addSchedule(sch);
        //Schedule schedule = scheduleMapper.getScheduleBystudio(sch.getStudio_id());
        List<Seat> seats = seatMapper.selectById(sch.getStudio_id());
        for(Seat seat : seats){
            Ticket ticket = new Ticket();
            ticket.setSched_id(sch.getSched_id());
            ticket.setSeat_id(seat.getSeat_id());
            ticket.setTicket_price(sch.getSched_ticket_price());
            ticket.setTicket_locked_time(sch.getSched_time());
            ticketMapper.addTicket(ticket);
        }

    }


    @Override
    public boolean updateSchedule(int id, Schedule sch) {
        return false;
    }

    @Override
    public List<Schedule> selectSchedule(int id) {
        return null;
    }
    public void pageQuery(PageBean pageBean) {

        Integer currentPage = pageBean.getPage();
        Integer pageSize = pageBean.getPageSize();
        int maxResults = pageSize;
        int firstResult = (currentPage-1)*pageSize;
        RowBounds rowBounds = new RowBounds(firstResult,maxResults);
        Long count = scheduleMapper.count();
        List<Schedule> list = scheduleMapper.pageQuery(rowBounds);
        List<String> sched_time = new ArrayList<String>();
        for(int i =0 ;i<list.size();i++){
            Date time = list.get(i).getSched_time();

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sched_time.add(format.format(time));
        }

        //pageBean.setSched_time(sched_time);
        //System.out.println(list.get(0).getSched_time());
        /*for (int i=0;i<list.size();i++){
            Date sched_time = list.get(i).getSched_time();
            list.get(i).setSched_time(sched_time.toString());

        }*/


        pageBean.setTotal(count.intValue());
        pageBean.setRows(list);
    }

    @Override
    public Schedule getSchedule(String sched_id) {
        Schedule schedule = scheduleMapper.getSchedule(Integer.parseInt(sched_id));
        List<Seat> seats = seatMapper.selectById(schedule.getStudio().getStudio_id());
        schedule.getStudio().setSeatList(seats);
        return schedule;
    }

    @Override
    public List<Schedule> selectScheduleListByTime(String time, Integer play_id) {
        Schedule schedule = new Schedule();
        schedule.setPlay_id(play_id);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = sf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        schedule.setSched_time(date);
        return scheduleMapper.selectScheduleListByTime(schedule);
    }

    @Override
    public void deleteSchedule(String ids) {
        if(StringUtils.isNotBlank(ids)){
            String[] strings = ids.split(",");
            for(String id :strings){
                scheduleMapper.deleteSchedule(Integer.parseInt(id));
            }
        }
    }

    @Override
    public List<String> getTime(Integer id) {
        return scheduleMapper.getTime(id);
    }

}
