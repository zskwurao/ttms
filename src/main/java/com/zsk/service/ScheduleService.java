package com.zsk.service;

import com.zsk.pojo.Schedule;
import com.zsk.utils.PageBean;

import java.util.List;

public interface ScheduleService {
    public void addSchedule(Schedule sch);
    public boolean updateSchedule(int id,Schedule sch);
    public List<Schedule> selectSchedule(int id);

    public void pageQuery(PageBean pageBean);

    public Schedule getSchedule(String sched_id);

    List<Schedule> selectScheduleListByTime(String time, Integer play_id);

    public void deleteSchedule(String ids);

    List<String> getTime(Integer id);
}
