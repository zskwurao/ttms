package com.zsk.controller;

import com.zsk.dao.DictMapper;
import com.zsk.pojo.*;
import com.zsk.service.DictService;
import com.zsk.service.PlayService;
import com.zsk.service.SeatService;
import com.zsk.utils.JsonUtils;
import com.zsk.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class PlayController {
    @Autowired
    private DictService dictService;
    @Autowired
    private PlayService playService;
    @RequestMapping("/play/play.action")
    public String goTo(){
        return "base/play";
    }
    @RequestMapping("/play/addplay.action")
    public String addPlay(Play play){
        playService.addPlay(play);
        return "base/play";
    }
    @RequestMapping("/play/pageQuery.action")
    public void pageQuery(int page,int rows, HttpServletRequest request, HttpServletResponse response)  {
        PageBean pageBean = new PageBean();
        pageBean.setPage(page);
        pageBean.setPageSize(rows);
        playService.pageQuery(pageBean);
        String json = JsonUtils.java2Json(pageBean,new String[]{});
        //String json1 = JsonUtils.java2Json(pageBean.getList(),new String[]{"page","total"});
        response.setContentType("text/json;charset=utf-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //response.getWriter().print(json1);
        //System.out.println(pageBean.getRows().size());
    }
    @RequestMapping("/play/deletePlay.action")
    public String deletePlay(String ids){
       // System.out.println(ids);
        playService.deletePlay(ids);
        return "base/play";
    }
    @RequestMapping("/play/editplay.action")
    public String editPlay(Play play){
        playService.editPlay(play);
        return "base/play";
    }
    @RequestMapping("/play/listAjax.action")
    public void listAjax(HttpServletRequest request, HttpServletResponse response){
        List<Play> list = playService.selectPlayList();
        String json = JsonUtils.java2Json(list,new String[]{});
        response.setContentType("text/json;charset=utf-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/play/selectPlay.action")
    public String selectPlay(Model model,String play_name,HttpServletRequest request) throws UnsupportedEncodingException {
        String play_name1=new String(request.getParameter("play_name").getBytes("ISO-8859-1") ,"UTF-8");
        //System.out.println(play_name);
        Play play = playService.selectPlay(play_name1);
        //System.out.println(play_name);
        //System.out.println(play.getPlay_image());
        List<Schedule> list = play.getScheduleList();
        for (Schedule schedule :list){
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(schedule.getSched_time());
            calendar.add(Calendar.MINUTE, +play.getPlay_length());//+1今天的时间加一天
            schedule.setEnd_time((Date) calendar.getTime());
        }
        play.setScheduleList(list);
        model.addAttribute("play",play);
        return "html/mover1";
    }
    @RequestMapping("/play/toindex.action")
    public String toindex(Model model,HttpServletRequest request) throws UnsupportedEncodingException {

        List<Play> plays = playService.selectPlayList();
        model.addAttribute("plays",plays);
        return "html/index";
    }
    @RequestMapping("/play/getListById.action")
    @ResponseBody
    public List<Play> getListById(String name,Model model,HttpServletResponse response){
        List<Play> list = null;
        if(name.equals("热映")){
             list= playService.getListBystatus(1);
        }else {
            Datadict datadict = dictService.getIdByName(name);
            list = playService.getListById(datadict.getDict_id());
        }
        //model.addAttribute("list",list);
        return list;
    }
    @RequestMapping("/play/getListBystatus.action")
    @ResponseBody
    public List<Play> getListBystatus(Integer play_status){
        List<Play> playList = playService.getListBystatus(play_status);
        return playList;
    }
}
