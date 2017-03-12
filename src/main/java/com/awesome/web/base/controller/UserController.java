package com.awesome.web.base.controller;

import com.awesome.web.base.domain.Pager;
import com.awesome.web.base.domain.ResultMessage;
import com.awesome.web.base.domain.User;
import com.awesome.web.base.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String list(ModelMap modelMap,Pager pager){
       PageHelper.startPage(pager.getPageNum(), pager.getPageSize());      //分页
       List<User> users = userService.getAll();
       modelMap.put("pageInfo",new PageInfo(users) );        //返回分页结果
       return "/base/user/list";
    }

    @RequestMapping("/add")
    public String add(ModelMap modelMap){
        modelMap.put("user",new User());
        return "/base/user/form";
    }

    @RequestMapping("/edit")
    public String edit(ModelMap modelMap,Integer uid,Pager pager){
        User user = userService.findById(uid);
        modelMap.put("user",user);
        modelMap.put("pager",pager);
        return "/base/user/form";
    }

    /**
     * 保存或更新
     * @param user
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public ResultMessage saveOrUpdate(User user){
        int count =userService.saveOrUpdate(user);
        if(count>0){
            return new ResultMessage(ResultMessage.SUCCESS,"保存成功！");
        }else{
            return new ResultMessage(ResultMessage.FAIL,"保存失败！");
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResultMessage delete(Integer id){
        int count = userService.delete(id);
        if(count>0){
            return new ResultMessage(ResultMessage.SUCCESS,"删除成功！");
        }else{
            return new ResultMessage(ResultMessage.FAIL,"删除失败！");
        }
    }
}
