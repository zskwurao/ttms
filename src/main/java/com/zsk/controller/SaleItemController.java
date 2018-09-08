package com.zsk.controller;

import com.zsk.dao.TicketMapper;
import com.zsk.pojo.Saleitem;
import com.zsk.pojo.TTMS;
import com.zsk.pojo.User;
import com.zsk.service.SaleItemService;
import com.zsk.service.TicketService;
import com.zsk.utils.JsonUtils;
import com.zsk.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/saleitem")
public class SaleItemController {
    @Autowired
    private SaleItemService saleItemService;
    @Autowired
    private TicketService ticketService;
    @RequestMapping("/saleitem.action")
    public String goTo(){
        return "base/saleitem";
    }

    @RequestMapping("/addSaleitem.action")
    public String addSaleitem(String ids, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        saleItemService.addSaleitem(ids,user);
        ticketService.updateTicket(ids);
        return "redirect:/saleitem/selectListByUserId.action";
    }
    @RequestMapping("/selectListByUserId.action")
    public String selectListByUserId(HttpServletRequest request, Model model){
        User user = (User) request.getSession().getAttribute("user");
        if(user==null){
            return "redirect:/user/tologin.action";
        }
        List<Saleitem> saleitemList = saleItemService.selectListByUsrId(user.getUser_id());
        model.addAttribute("saleitemList",saleitemList);
        return "html/dingdan";
    }
    @RequestMapping("/pageQuery.action")
    @ResponseBody
    public PageBean pageQuery(int page,int rows){
        PageBean pageBean = new PageBean();
        pageBean.setPage(page);
        pageBean.setPageSize(rows);
        saleItemService.pageQuery(pageBean);
        return pageBean;
    }
    @ResponseBody
    @RequestMapping("/selectListByTime.action")
    public List selectListByTime(String sale_item_time){
       // System.out.println(sale_item_time);
        List<String> saleitemList = saleItemService.selectListByTime(sale_item_time);
        List<Integer> list = saleItemService.sum(sale_item_time);
        List<TTMS> ttms = new ArrayList<TTMS>();
        int a = 0;
        for(int i = 0 ; i<saleitemList.size();i++){
            TTMS s = new TTMS();
            s.setName(saleitemList.get(i));
            s.setMoney(list.get(i));
            ttms.add(s);
        }
        System.out.println(ttms.size()==0);
        for(TTMS ttms1 : ttms){
            System.out.println(ttms1.getName());
            System.out.println(ttms1.getMoney());
        }
        String json = JsonUtils.java2Json(ttms,new String[]{});
        System.out.println(json);
        return ttms;
    }
}
