package com.awesome.web.service.base;

import com.awesome.web.domain.base.User;

import java.util.List;

/**
 * @author adam
 * @ClassName UserService
 * @Description 用户服务接口
 * @create 2017/3/7 22:31
 */
public interface UserService {

    /**
     * 根据用户名查询用户信息
     * @param username
     * @return
     */
    User findByUsername(String username);

    /**
     * 查询所有用户信息
     * @return
     */
    List<User> getAll();
}
