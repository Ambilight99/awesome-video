package com.awesome.web.business.dao;

import com.awesome.web.business.domain.Course;
import com.awesome.web.business.domain.CourseSearch;
import com.awesome.web.business.domain.StudentCourse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKeyWithBLOBs(Course record);

    int updateByPrimaryKey(Course record);

    List<Course> getAll(@Param("studentCourse") StudentCourse studentCourse,@Param("courseSearch") CourseSearch courseSearch);

    Course findById(Integer id);

    List<Course> getAllByStudentCourse(@Param("studentCourse") StudentCourse studentCourse,@Param("courseSearch") CourseSearch courseSearch);

    List<Course> getAllByPublisher(List<Integer> teacherIds);
}