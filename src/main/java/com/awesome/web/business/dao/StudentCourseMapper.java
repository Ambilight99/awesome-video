package com.awesome.web.business.dao;

import com.awesome.web.business.domain.StudentCourse;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentCourseMapper {
    int insert(StudentCourse record);

    int insertSelective(StudentCourse record);

    int update(StudentCourse record);

    StudentCourse findByStudentCourse(StudentCourse studentCourse);
}