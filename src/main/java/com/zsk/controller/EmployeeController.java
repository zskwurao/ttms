package com.zsk.controller;

import com.zsk.pojo.Employee;
import com.zsk.pojo.User;
import com.zsk.service.EmployeeService;
import com.zsk.utils.MD5Utils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @RequestMapping("/login.action")
    public String login(Employee employee, Model model, HttpServletRequest request) {
        String code = (String) request.getSession().getAttribute("key");
        if (StringUtils.isNotBlank(employee.getCheckcode()) && employee.getCheckcode().equals(code)) {
            String password = MD5Utils.md5(employee.getEmp_password());
            employee.setEmp_password(password);
            Employee emp = employeeService.login(employee);
            if (emp != null) {
                request.getSession().setAttribute("employee", emp);
                return "common/index1";

            } else {
                model.addAttribute("error", "用户名或密码错误");
                return "login";
            }
        }
        else {
            model.addAttribute("error","验证码错误！");
            return "login";
        }
    }
}
