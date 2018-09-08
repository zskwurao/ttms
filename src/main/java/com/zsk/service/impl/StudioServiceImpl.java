package com.zsk.service.impl;

import com.zsk.dao.SeatMapper;
import com.zsk.dao.StudioMapper;
import com.zsk.pojo.Play;
import com.zsk.pojo.Seat;
import com.zsk.pojo.Studio;
import com.zsk.service.StudioService;
import com.zsk.utils.PageBean;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudioServiceImpl implements StudioService{
    @Autowired
    private StudioMapper studioMapper;
    @Autowired
    private SeatMapper seatMapper;
    /*
    分页
     */
    public void pageQuery(PageBean pageBean) {
        Integer currentPage = pageBean.getPage();
        Integer pageSize = pageBean.getPageSize();
        int maxResults = pageSize;
        int firstResult = (currentPage-1)*pageSize;
        RowBounds rowBounds = new RowBounds(firstResult,maxResults);
        Long count = studioMapper.count();
        List<Studio> list = studioMapper.pageQuery(rowBounds);
        pageBean.setTotal(count.intValue());
        pageBean.setRows(list);
    }
    /*
    添加演出厅
     */
    public void addStudio(Studio studio) {
        studioMapper.addStudio(studio);
        Studio studio1 = studioMapper.selectByName(studio.getStudio_name());
        for (int i=0;i<studio.getStudio_row_count();i++){
            for(int j=0;j<studio.getStudio_col_count();j++){
                Seat seat = new Seat();
                seat.setStudio_id(studio1.getStudio_id());
                seat.setSeat_row(i);
                seat.setSeat_column(j);
                seat.setSeat_status(1);
                seatMapper.addSeat(seat);

            }
        }
    }
    /*
    删除演出厅
     */
    public void deleteStudio(String ids) {
        if(StringUtils.isNotBlank(ids)){
            String[] strings = ids.split(",");
            for(String id : strings){
                studioMapper.deleteStudio(Integer.parseInt(id));
            }
        }
    }
    /*
    修改演出厅信息
     */
    public void editStudio(Studio studio) {
        studioMapper.editStudio(studio);
    }

    /*
    加载
     */
    public List<Studio> getList() {
        return studioMapper.getList();
    }
}
