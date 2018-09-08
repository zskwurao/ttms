package com.zsk.dao;

import com.zsk.pojo.Play;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlayMapper {
    public void addPlay(Play play);

    List<Play> pageQuery(RowBounds rowBounds);

    public Long count();

    public void deletePlay(int id);

    public void editPlay(Play play);

    public List<Play> selectPlay();

    public Play selectById(Integer play_id);

    public Play selectPlayByName(String play_name);

    List<Play> getListById(Integer play_type_id);

    List<Play> getListBystatus(Integer play_status);
}
