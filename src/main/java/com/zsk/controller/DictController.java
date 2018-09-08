package com.zsk.controller;

import com.zsk.pojo.Datadict;
import com.zsk.service.DictService;
import com.zsk.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/base")
public class DictController {
    @Autowired
    private DictService dictService;
    @RequestMapping("/listAjax.action")
    public void listajax(String dict_parent_id,HttpServletRequest request, HttpServletResponse response)  {
        List<Datadict> list = dictService.getDictListByid(dict_parent_id);
        String json = JsonUtils.java2Json(list,new String[]{});
        response.setContentType("text/json;charset=utf-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/getListById.action")
    public void getlistById(String dict_parent_id,HttpServletResponse response){
        System.out.println(dict_parent_id);
        List<Datadict> list = dictService.getlistById(dict_parent_id);
        String json  = JsonUtils.java2Json(list,new String[]{"playList"});
        response.setContentType("text/html;charset=utf-8");
        try {
            response.getWriter().write(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
