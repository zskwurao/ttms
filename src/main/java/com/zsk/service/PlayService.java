package com.zsk.service;

import com.zsk.pojo.Play;
import com.zsk.utils.PageBean;

import java.util.List;
public interface PlayService {
    public void addPlay(Play play);
    public void deletePlay(String id);
    public List<Play> selectPlayList(String name);

    void pageQuery(PageBean pageBean);

    public void editPlay(Play play);

    public List<Play> selectPlayList();

    public Play selectPlay(String play_name);

    List<Play> getListById(Integer dict_id);

    List<Play> getListBystatus(Integer play_status);
}
