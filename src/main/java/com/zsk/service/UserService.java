package com.zsk.service;

import com.zsk.pojo.User;

public interface UserService {

    public User login(User user);

    public boolean register(User user);
}
