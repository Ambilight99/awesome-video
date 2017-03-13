package com.awesome.web.business.service;

import com.awesome.web.business.domain.Course;

import java.util.List;

/**
 * @author adam
 * @ClassName CourseService
 * @Description 课程Service
 * @create 2017/3/13 21:00
 */
public interface CourseService{
	/**
	 * 查询所有课程信息
	 * @return
	 */
	List<Course> getAll();

	/**
	 * 保存课程信息
	 * @param course
	 * @return
	 */
	int saveOrUpdate(Course course);

	/**
	 * 删除课程信息
	 * @param id
	 * @return
	 */
	int delete(Integer id);
}
