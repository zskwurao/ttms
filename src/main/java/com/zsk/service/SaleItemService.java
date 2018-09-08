package com.zsk.service;

import com.zsk.pojo.Saleitem;
import com.zsk.pojo.TTMS;
import com.zsk.pojo.User;
import com.zsk.utils.PageBean;

import java.util.List;

public interface SaleItemService {
    public void addSaleitem(String ids, User user);

    public List<Saleitem> selectListByUsrId(Integer user_id);

    public void pageQuery(PageBean pageBean);

    public List<String> selectListByTime(String sale_item_time);

    public List<Integer> sum(String sale_item_time);
}
