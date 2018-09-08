package com.zsk.dao;

import com.zsk.pojo.Saleitem;
import com.zsk.pojo.TTMS;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface SaleItemMapper {

    public void addSaleItem(Saleitem saleitem);

    public List<Saleitem> selectListByUsrId(Integer user_id);

    public Long count();

    List<Saleitem> pageQuery(RowBounds rowBounds);
    public List<String> selectListByTime(String sale_item_time);

    public List<Integer> sum(String sale_item_time);

    void updateStatus(Integer ticket_id);
}
