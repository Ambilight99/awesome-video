package com.awesome.web.business.service;

import com.awesome.web.business.domain.Course;
import com.awesome.web.business.domain.StudentCourse;

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

	/**
	 * 根据id查找课程信息
	 * @param id
	 * @return
	 */
	Course findById(Integer id);

	/**
	 * 参与或收藏课程
	 * @param studentCourse
	 * @return
	 */
	Boolean insert(StudentCourse studentCourse);

	/**
	 * 查询关联
	 * @param studentCourse
	 * @return
	 */
	StudentCourse findByStudentCourse(StudentCourse studentCourse);

	/**
	 * 更新
	 * @param studentCourse
	 * @return
	 */
	Boolean update(StudentCourse studentCourse);

	/**
	 * 根据studentCourse中的条件获取对应的课程信息
	 * @param studentCourse
	 * @return
	 */
	List<Course> getAllByStudentCourse(StudentCourse studentCourse);
}
