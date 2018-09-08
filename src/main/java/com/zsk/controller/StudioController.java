package com.zsk.controller;

import com.zsk.pojo.Studio;
import com.zsk.service.StudioService;
import com.zsk.utils.JsonUtils;
import com.zsk.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/studio")
public class StudioController {
    @Autowired
    private StudioService studioService;
    @RequestMapping("/studio.action")
    public String goTo(){
        return "base/studio";
    }
    @RequestMapping("/addStudio.action")
    public String addStudio(Studio studio){
        studioService.addStudio(studio);
        return "base/studio";
    }
    @RequestMapping("pageQuery.action")
    public void pageQuery(int page, int rows, HttpServletRequest request, HttpServletResponse response){
        PageBean pageBean = new PageBean();
        pageBean.setPage(page);
        pageBean.setPageSize(rows);
        studioService.pageQuery(pageBean);
        String json = JsonUtils.java2Json(pageBean,new String[]{"seatList","scheduleList"});
        response.setContentType("text/json;charset=utf-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/deleteStudio.action")
    public String deleteStudio(String ids){
        studioService.deleteStudio(ids);
        return "base/studio";
    }
    @RequestMapping("/editStudio.action")
    public String editStudio(Studio studio){
        studioService.editStudio(studio);
        return "base/studio";
    }
    @RequestMapping("/listAjax.action")
    public void listAjax(HttpServletRequest request, HttpServletResponse response){
        List<Studio> list = studioService.getList();
        String json = JsonUtils.java2Json(list,new String[]{});
        response.setContentType("text/json;charset=utf-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
