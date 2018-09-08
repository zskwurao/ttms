package com.zsk.service;

import com.zsk.pojo.Studio;
import com.zsk.utils.PageBean;

import java.util.List;

public interface StudioService {

    public void pageQuery(PageBean pageBean);

    public void addStudio(Studio studio);

    public void deleteStudio(String ids);

    public void editStudio(Studio studio);

    public List<Studio> getList();
}
