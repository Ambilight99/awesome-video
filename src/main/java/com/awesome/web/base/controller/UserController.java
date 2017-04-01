package com.awesome.web.base.controller;

import com.alibaba.fastjson.JSON;
import com.awesome.web.base.domain.Pager;
import com.awesome.web.base.domain.ResultMessage;
import com.awesome.web.base.domain.Role;
import com.awesome.web.base.domain.User;
import com.awesome.web.base.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
       users.stream().forEach(user -> user.setRoles(userService.getRolesListByUid(user.getUid())) );
       modelMap.put("pageInfo",JSON.toJSON(new PageInfo(users)) );        //返回分页结果
       return "/base/user/list";
    }

    @RequestMapping("/add")
    public String add(ModelMap modelMap){
        modelMap.put("user",JSON.toJSON(new User()));
        modelMap.put("pager",JSON.toJSON(new Pager()));
        return "/base/user/form";
    }

    @RequestMapping("/edit")
    public String edit(ModelMap modelMap,Integer uid,Pager pager){
        User user = userService.findById(uid);
        modelMap.put("user", JSON.toJSON(user));
        modelMap.put("pager",JSON.toJSON(pager));
        return "/base/user/form";
    }

    @RequestMapping("/view")
    public String edit(ModelMap modelMap, Integer uid){
        User user=null;
        if(uid==null){
            Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
            user = (User)currentUser.getPrincipal();
            user = userService.findByUid(user.getUid());
        }
        modelMap.put("user", JSON.toJSON(user));
        return "/base/user/view";
    }

    /**
     * 保存或更新
     * @param user
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public ResultMessage saveOrUpdate(User user, @RequestParam("roleIds") Set<Integer> roleIds){
        int count =userService.saveOrUpdate(user,roleIds);
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

    /**
     * 获取老师
     * @return
     */
    @RequestMapping("/getTeacher")
    @ResponseBody
    public List<User> getTeacher(){
        return userService.getUserByRoleId(2);
    }
}
