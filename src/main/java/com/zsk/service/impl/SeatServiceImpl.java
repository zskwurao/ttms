package com.zsk.service.impl;

import com.zsk.dao.SeatMapper;
import com.zsk.dao.StudioMapper;
import com.zsk.pojo.Seat;
import com.zsk.pojo.Studio;
import com.zsk.service.SeatService;
import com.zsk.utils.PageBean;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SeatServiceImpl implements SeatService {
    @Autowired
    private StudioMapper studioMapper;
    @Autowired
    private SeatMapper seatMapper;
    /*
    添加座位
     */
    public void addSeat(Seat seat) {
        seatMapper.addSeat(seat);
    }
    /*
    删除座位
     */
    public void deleteSeat(String id) {
        if(StringUtils.isNotBlank(id)){
            String[] strings = id.split(",");
            for(String id1 : strings){
                seatMapper.deleteSeat(Integer.parseInt(id1)) ;
            }
        }
    }

    @Override
    public Seat selectSeat(int id) {
        return null;
    }

    /*
    分页
     */
    public void pageQuery(PageBean pageBean) {
        Integer currentPage = pageBean.getPage();
        Integer pageSize = pageBean.getPageSize();
        int maxResults = pageSize;
        int firstResult = (currentPage-1)*pageSize;
        RowBounds rowBounds = new RowBounds(firstResult,maxResults);
        Long count = seatMapper.count();
        List<Seat> list = seatMapper.pageQuery(rowBounds);

        pageBean.setTotal(count.intValue());
        pageBean.setRows(list);
    }
    /*
    修改座位信息
     */
    public void editSeat(Seat seat) {
        seatMapper.editSeat(seat);
    }
}
