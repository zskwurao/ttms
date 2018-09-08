package com.zsk.service.impl;

import com.zsk.dao.PlayMapper;
import com.zsk.dao.ScheduleMapper;
import com.zsk.pojo.Play;
import com.zsk.pojo.Schedule;
import com.zsk.service.PlayService;
import com.zsk.utils.PageBean;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service
@Transactional
public class PlayServiceImpl implements PlayService {
    @Autowired
    private PlayMapper playMapper;
    @Autowired
    private ScheduleMapper scheduleMapper;
    /**
     * 添加剧目
     * @param play
     */
    public void addPlay(Play play) {
        playMapper.addPlay(play);
    }
    /*
    删除剧目
     */
    public void deletePlay(String id) {
        if(StringUtils.isNotBlank(id)){
            String[] strings = id.split(",");
            for(String ids :strings){
                playMapper.deletePlay(Integer.parseInt(ids));
            }
        }
    }


    @Override
    public List<Play> selectPlayList(String name) {
        return null;
    }

    @Override
    public void pageQuery(PageBean pageBean) {

        Integer currentPage = pageBean.getPage();
        Integer pageSize = pageBean.getPageSize();
        int maxResults = pageSize;
        int firstResult = (currentPage-1)*pageSize;
        RowBounds rowBounds = new RowBounds(firstResult,maxResults);
        Long count = playMapper.count();
        List<Play> list = playMapper.pageQuery(rowBounds);
        pageBean.setTotal(count.intValue());
        pageBean.setRows(list);
    }
    /*
    修改剧目
     */
    public void editPlay(Play play) {
        playMapper.editPlay(play);
    }

    @Override
    public List<Play> selectPlayList() {
        return playMapper.selectPlay();
    }

    public Play selectPlay(String play_name) {

        Play play = playMapper.selectPlayByName(play_name);
        System.out.println(play.getPlay_id());
        /*List<Schedule> schedules = scheduleMapper.selectListByPlayId(play.getPlay_id());*/
       /* play.setScheduleList(schedules);*/
        return play;
    }

    @Override
    public List<Play> getListById(Integer play_type_id) {
        return playMapper.getListById(play_type_id);
    }

    @Override
    public List<Play> getListBystatus(Integer play_status) {
        return playMapper.getListBystatus(play_status);
    }
}

