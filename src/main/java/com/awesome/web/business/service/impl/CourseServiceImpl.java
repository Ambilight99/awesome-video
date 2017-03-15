package com.awesome.web.business.service.impl;

import com.awesome.web.business.dao.CourseMapper;
import com.awesome.web.business.dao.StudentCourseMapper;
import com.awesome.web.business.domain.Course;
import com.awesome.web.business.domain.StudentCourse;
import com.awesome.web.business.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author adam
 * @ClassName CourseServiceImpl
 * @Description 课程Service实现
 * @create 2017/3/13 21:00
 */
@Service("courseService")
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private StudentCourseMapper studentCourseMapper;

    @Override
    public List<Course> getAll() {
        return courseMapper.getAll();
    }

    @Override
    public int saveOrUpdate(Course course) {
        if(course==null){
            return 0;
        }
        Integer id = course.getId();
        if(id==null || id==0){
            return courseMapper.insertSelective(course);
        }else{
            return courseMapper.updateByPrimaryKeySelective(course);
        }
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public Course findById(Integer id) {
        return courseMapper.findById(id);
    }

    @Override
    public Boolean insert(StudentCourse studentCourse) {
        if(studentCourse==null){
            return false;
        }
        try {
            studentCourseMapper.insert(studentCourse);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 查询关联
     *
     * @param studentCourse
     * @return
     */
    @Override
    public StudentCourse findByStudentCourse(StudentCourse studentCourse) {
        return studentCourseMapper.findByStudentCourse(studentCourse);
    }

    /**
     * 更新
     *
     * @param studentCourse
     * @return
     */
    @Override
    public Boolean update(StudentCourse studentCourse) {
        if(studentCourse==null){
            return false;
        }
        try {
            studentCourseMapper.update(studentCourse);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
