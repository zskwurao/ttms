package com.zsk.dao;

import com.zsk.pojo.Play;
import com.zsk.pojo.Schedule;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ScheduleMapper {
    public int addSchedule(Schedule sch);

    public Long count();

    public List<Schedule> pageQuery(RowBounds rowBounds);

    public List<Schedule> selectListByPlayId(Integer play_id);

    public Schedule getSchedule(Integer sched_id);

    Schedule getScheduleBystudio(Integer studio_id);

    List<Schedule> selectScheduleListByTime(Schedule schedule);

    public void deleteSchedule(int i);

    List<String> getTime(Integer id);
}
