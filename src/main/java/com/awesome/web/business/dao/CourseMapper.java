package com.awesome.web.business.dao;

import com.awesome.web.base.domain.User;
import com.awesome.web.business.domain.Course;
import com.awesome.web.business.domain.CourseSearch;
import com.awesome.web.business.domain.StudentCourse;
import com.awesome.web.business.domain.UserOfCourse;
import org.apache.ibatis.annotations.*;

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

    @Select(" SELECT u.*,sc.total_time  FROM student_course sc , user u WHERE sc.student_id =u.uid AND sc.is_join=1 AND sc.course_id =#{courseId} " )
    @Results({
            @Result(id=true ,property = "uid", column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "mobile", column = "mobile"),
            @Result(property = "email", column = "email"),
            @Result(property = "totalTime", column = "total_time")
    })
    List<UserOfCourse> getJoinStudentByCourseId(Integer courseId);

    List<Course> getAllByPublisher(List<Integer> teacherIds);
}