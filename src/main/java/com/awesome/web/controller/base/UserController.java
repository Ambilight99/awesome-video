package com.awesome.web.controller.base;

import com.alibaba.fastjson.JSON;
import com.awesome.web.domain.base.User;
import com.awesome.web.service.base.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author adam
 * @ClassName UserController
 * @Description 用户管理模块
 * @create 2017/3/8 19:52
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

   @RequestMapping("/list")
    public String list(ModelMap modelMap){
       List<User> users = userService.getAll();
       modelMap.put("users", JSON.toJSON(users));
       return "/base/user/list";
    }

    @RequestMapping("/add")
    public String add(){
        return "/base/user/add";
    }

    @RequestMapping("/edit")
    public String edit(){
        return "/base/user/edit";
    }
}
