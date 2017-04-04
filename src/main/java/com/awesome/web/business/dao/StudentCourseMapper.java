package com.awesome.web.business.dao;

import com.awesome.web.business.domain.StudentCourse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface StudentCourseMapper {
    int insert(StudentCourse record);

    int insertSelective(StudentCourse record);

    int update(StudentCourse record);

    StudentCourse findByStudentCourse(StudentCourse studentCourse);

    @Update(" update student_course set total_time = #{totalTime} where student_id = #{studentId} and course_id = #{courseId} ")
    int updateTotalTime(StudentCourse sc);
}