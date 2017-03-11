package com.awesome.web.dao.business;

import com.awesome.web.domain.StudentCourse;

public interface StudentCourseMapper {
    int insert(StudentCourse record);

    int insertSelective(StudentCourse record);
}