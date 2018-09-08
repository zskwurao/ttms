package com.zsk.dao;

import com.zsk.pojo.Play;
import com.zsk.pojo.Studio;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface StudioMapper {
    public Long count();

    public List<Studio> pageQuery(RowBounds rowBounds);

    public void addStudio(Studio studio);

    public void deleteStudio(int id);

    public void editStudio(Studio studio);

    public List<Studio> getList();

    public Studio selectById(Integer studio_id);

    Studio selectByName(String studio_name);
}
