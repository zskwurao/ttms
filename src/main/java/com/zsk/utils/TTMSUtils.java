package com.zsk.utils;

import com.zsk.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class TTMSUtils {
    @Autowired
    private HttpServletRequest request;

    public HttpSession getSession() {
        return request.getSession();
    }

    public User getLoginUser() {
        return (User) getSession().getAttribute("user");
    }
}
