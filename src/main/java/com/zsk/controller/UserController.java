package com.zsk.controller;




import com.zsk.pojo.User;
import com.zsk.service.UserService;
import com.zsk.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/tologin.action")
    public String tologin(){
        return "html/login";
    }

    @RequestMapping("/tozhuce.action")
    public String tozhuce(){
        return "html/zhuce";
    }

    @RequestMapping("/login.action")
    public String login(Model model, User user, HttpServletRequest request){
        if(user==null){
            model.addAttribute("error","用户名不能为空！");
            return "html/login";
        }
        String password = MD5Utils.md5(user.getUser_password());
        user.setUser_password(password);
        User u = userService.login(user);
        if(u!=null){
            request.getSession().setAttribute("user",u);
            return "redirect:/play/toindex.action";

        }
        else{
            model.addAttribute("error","用户名或密码错误");
            return "html/login";
        }


    }
    @RequestMapping("/register.action")
    public String register(User user,Model model){
        if(user==null){
            model.addAttribute("error","用户名不能为空！");
            return "html/zhuce";
        }
        boolean isregistersuccess = userService.register(user);
        if(isregistersuccess){
            return "redirect:tologin.action";
        }
        else{
            return "redirect:tozhuce.action";
        }
    }
}
