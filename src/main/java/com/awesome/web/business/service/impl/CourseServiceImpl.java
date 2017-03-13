package com.awesome.web.business.service.impl;

import com.awesome.web.business.dao.CourseMapper;
import com.awesome.web.business.domain.Course;
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
}
