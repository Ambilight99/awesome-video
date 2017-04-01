package com.awesome.web.base.controller;

import com.alibaba.fastjson.JSON;
import com.awesome.web.base.domain.Pager;
import com.awesome.web.base.domain.ResultMessage;
import com.awesome.web.base.domain.User;
import com.awesome.web.base.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/**
 * @author adam
 * @ClassName LoginContoller
 * @Description 登录控制器
 * @create 2017/3/8 15:24
 */
@Controller
public class LoginContoller {
    @Autowired
    private UserService userService;

    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * 登录方法
     * @param username
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/userLogin")
    @ResponseBody
    public Map<String,String> userLogin(String username, String password, HttpSession session) {
        Map<String, String> resultMap = new LinkedHashMap<>();
        UsernamePasswordToken usernamePasswordToken=new UsernamePasswordToken(username,password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(usernamePasswordToken);   //完成登录
            User user=(User) subject.getPrincipal();
            session.setAttribute("user", user);
            resultMap.put("status", "200");
            resultMap.put("message", "登录成功");
        } catch(Exception e) {
            resultMap.put("status", "500");
            resultMap.put("message", "登录失败");
        }
        return resultMap;
    }

    /**
     * 登出方法
     * @return
     */
    @RequestMapping("/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "login";
    }

    /**
     * 登录成功后跳转到首页
     * @return
     */
    @RequestMapping(value="index")
    public String index() {
        return "redirect:/course/list?pageSize=15";
//        return "index";
    }

    /**
     * 无权限跳转页面
     * @return
     */
    @RequestMapping(value="/403")
    public String noAuth(){
        return "403";
    }

    /**
     * 注册
     * @return
     */
    @RequestMapping(value="register/form")
    public String register(ModelMap modelMap){
        modelMap.put("user", JSON.toJSON(new User()));
        modelMap.put("pager",JSON.toJSON(new Pager()));
        return "/register";
    }

    /**
     * 注册保存
     * @param user
     * @return
     */
    @RequestMapping(value="register/save")
    @ResponseBody
    public ResultMessage registerSave(User user){
        Set<Integer>  roleIds= new HashSet<Integer>(){{
           add(3);//学生
        }};
        try {
            int count =userService.saveOrUpdate(user,roleIds);
            if(count>0){
                return new ResultMessage(ResultMessage.SUCCESS,"注册成功！");
            }else{
                return new ResultMessage(ResultMessage.FAIL,"注册失败！");
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResultMessage(ResultMessage.FAIL,"账号已存在！");
        }

    }

}
