package com.awesome.web.base.service.impl;

import com.awesome.web.base.dao.UserMapper;
import com.awesome.web.base.domain.User;
import com.awesome.web.base.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author adam
 * @ClassName UserServiceImpl
 * @Description 用户实现类
 * @create 2017/3/7 22:32
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public List<User> getAll() {
        return userMapper.getAll();
    }
}
