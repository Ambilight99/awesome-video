package com.awesome.web.business.dao;

import com.awesome.web.business.domain.StudentCourse;

public interface StudentCourseMapper {
    int insert(StudentCourse record);

    int insertSelective(StudentCourse record);
}