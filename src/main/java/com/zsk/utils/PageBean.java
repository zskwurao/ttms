package com.zsk.utils;

import java.util.ArrayList;
import java.util.List;


/**
 * 封装分页信息
 *
 * @author ASUS
 */
public class PageBean {
    private Integer page;//当前页码
    private Integer total;//总页数
    private Integer pageSize  ;//每页显记录数
    private List rows = new ArrayList();//数据集合



    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
