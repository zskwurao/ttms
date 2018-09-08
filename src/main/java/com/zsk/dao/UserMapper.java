package com.zsk.dao;

import com.zsk.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    public User getUser(User user);

    public int register(User user);
    public User selectById(Integer user_id);
}
