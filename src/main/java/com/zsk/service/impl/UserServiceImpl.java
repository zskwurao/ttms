package com.zsk.service.impl;

import com.zsk.dao.UserMapper;
import com.zsk.pojo.User;
import com.zsk.service.UserService;
import com.zsk.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService
{
    @Autowired
    private UserMapper userMapper;

    /**
     * 登录
     * @param user
     * @return
     */
    public User login(User user) {

        User exist = userMapper.getUser(user);
        if(exist==null){
            return null;
        }
        return exist;
    }

    @Override
    public boolean register(User user) {
        user.setUser_password(MD5Utils.md5(user.getUser_password()));

        int row = 0;
        row = userMapper.register(user);
        return row>0?true:false;
    }
}
