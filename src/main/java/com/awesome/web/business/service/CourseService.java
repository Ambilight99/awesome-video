package com.awesome.web.business.service;

import com.awesome.web.base.domain.User;
import com.awesome.web.business.domain.Course;
import com.awesome.web.business.domain.CourseSearch;
import com.awesome.web.business.domain.StudentCourse;
import com.awesome.web.business.domain.UserOfCourse;

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
	List<Course> getAll(CourseSearch courseSearch);

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
	List<Course> getAllByStudentCourse(StudentCourse studentCourse,CourseSearch courseSearch);

	/**
	 * 根据课程发布人查询所有信息
	 * @return
	 */
    List<Course> getAllByPublisher(List<Integer> teacherIds);

	/**
	 * 根据课程id获取所有参与的人员
	 * @param courseId
	 * @return
	 */
	List<UserOfCourse> getJoinStudentByCourseId(Integer courseId);

	/**
	 * 根据学生id和课程id 获取学生课程关系
	 * @param courseId
	 * @return
	 */
	StudentCourse getStudentCourseByStudentIdAndCourseId(Integer studentId,Integer courseId);

	/**
	 * 更新学生和课程关系表
	 * @param sc
	 * @return
	 */
	int updateTotalTime(StudentCourse sc);
}
