package com.awesome.web.base.service;

import com.awesome.web.base.domain.User;

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

    /**
     * 保存用户
     * @param user
     * @return
     */
    int saveOrUpdate(User user);

    /**
     * 删除用户
     * @param id
     * @return
     */
    int delete(Integer id);

    /**
     * 根据id查找用户
     * @param id
     * @return
     */
    User findById(Integer id);
}
