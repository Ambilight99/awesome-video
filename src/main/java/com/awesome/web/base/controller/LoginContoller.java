package com.awesome.web.base.controller;

import com.awesome.web.base.domain.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author adam
 * @ClassName LoginContoller
 * @Description 登录控制器
 * @create 2017/3/8 15:24
 */
@Controller
public class LoginContoller {

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
        return "index";
    }

    /**
     * 无权限跳转页面
     * @return
     */
    @RequestMapping(value="/403")
    public String noAuth(){
        return "403";
    }
}
