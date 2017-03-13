package com.awesome.web.business.service;

import java.awt.List;

/**
 * 课程管理
 * @author lenovo
 *
 */
public interface CourseServiceI {
	/**
	 * 根据老师id获取课程列表信息
	 * @return
	 */
	public List dataGird(String teacherId);
	/**
	 * 保存课程信息
	 */
	public void doAdd();
	/**
	 * 删除课程信息
	 */
	public void doDel();
}
