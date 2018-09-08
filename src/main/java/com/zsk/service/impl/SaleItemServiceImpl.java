package com.zsk.service.impl;

import com.zsk.dao.SaleItemMapper;
import com.zsk.dao.TicketMapper;
import com.zsk.pojo.*;
import com.zsk.service.SaleItemService;
import com.zsk.utils.PageBean;
import com.zsk.utils.TTMSUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class SaleItemServiceImpl implements SaleItemService {
    @Autowired
    private SaleItemMapper saleItemMapper;
    @Autowired
    private TicketMapper ticketMapper;

    public void addSaleitem(String ids, User user) {
        if(StringUtils.isNotBlank(ids)){
             String[] id = ids.split(",");
            Ticket ticket = ticketMapper.selectById(Integer.parseInt(id[0]));
            for(String s : id){

                Saleitem saleitem = new Saleitem();
                 saleitem.setUser(user);
                 saleitem.setTicket_id(Integer.parseInt(s));
                 saleitem.setPlay(ticket.getSchedule().getPlay());
                 saleitem.setSale_item_time(new Date());
                 saleitem.setSale_item_price(ticket.getSchedule().getSched_ticket_price());
                 saleItemMapper.addSaleItem(saleitem);

             }

        }
    }

    /*
    根据用户id查询订单信息
     */
    public List<Saleitem> selectListByUsrId(Integer user_id) {
        return saleItemMapper.selectListByUsrId(user_id);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        Integer currentPage = pageBean.getPage();
        Integer pageSize = pageBean.getPageSize();
        int maxResults = pageSize;
        int firstResult = (currentPage-1)*pageSize;
        RowBounds rowBounds = new RowBounds(firstResult,maxResults);
        Long count = saleItemMapper.count();
        List<Saleitem> list = saleItemMapper.pageQuery(rowBounds);
        pageBean.setTotal(count.intValue());
        pageBean.setRows(list);
    }

    @Override
    public List<String> selectListByTime(String sale_item_time) {
        return saleItemMapper.selectListByTime(sale_item_time);
    }

    @Override
    public List<Integer> sum(String sale_item_time) {
        return saleItemMapper.sum(sale_item_time);
    }
}
