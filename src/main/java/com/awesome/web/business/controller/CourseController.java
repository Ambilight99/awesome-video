package com.awesome.web.business.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author adam
 * @ClassName FileUploadController
 * @Description 选课信息 lyz
 * @create 2017/3/12 11:01
 */
@Controller
@RequestMapping("/courseController")
public class CourseController {
	
    /**
     * 跳转到课程管理页面
     * @return
     */
    @RequestMapping("/courseList")
    public String courseList() {
    	
        return "business/courseList";
    }
    
    /**
     * 跳转课程管理添加页面
     * @return
     */
    @RequestMapping("/goAdd")
    public String goAdd(HttpServletRequest req) {
		//TODO 跳转添加页面方法
    		
        return "course-add";
    }
    
    /**
     * 课程管理添加方法
     * @return
     */
    @RequestMapping("/doAdd")
    public void doAdd(HttpServletRequest req) {
    	try {
			//TODO 课程添加
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
    /**
     * 跳转编辑页面方法
     * @return
     */
    @RequestMapping("/goUpdate")
    public String goUpdate(HttpServletRequest req) {
		//TODO 课程编辑
    	return "";
    }
    
    
    /**
     * 课程管理删除方法(单选删除)
     * @return
     */
    @RequestMapping("/doUpdate")
    public void doUpdate(HttpServletRequest req) {
    	try {
			//TODO 课程编辑
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    /**
     * 课程管理删除方法(单选删除)
     * @return
     */
    @RequestMapping("/doDel")
    public void doDel(HttpServletRequest req) {
    	try {
			//TODO 课程删除
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

}
