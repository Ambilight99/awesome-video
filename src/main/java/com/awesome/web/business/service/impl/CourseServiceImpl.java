package com.awesome.web.business.service.impl;

import com.awesome.web.base.dao.UserMapper;
import com.awesome.web.base.domain.User;
import com.awesome.web.business.dao.CourseMapper;
import com.awesome.web.business.dao.StudentCourseMapper;
import com.awesome.web.business.domain.Course;
import com.awesome.web.business.domain.CourseSearch;
import com.awesome.web.business.domain.StudentCourse;
import com.awesome.web.business.domain.UserOfCourse;
import com.awesome.web.business.service.CourseService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Course> getAll(CourseSearch courseSearch) {
        Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
        User user = (User)currentUser.getPrincipal();
        StudentCourse studentCourse = new StudentCourse();
        studentCourse.setStudentId(user.getUid());
        return courseMapper.getAll(studentCourse,courseSearch);
    }

    @Override
    public int saveOrUpdate(Course course) {
        if(course==null){
            return 0;
        }
        Integer id = course.getId();
        if(id==null || id==0){
            Subject currentUser = SecurityUtils.getSubject(); //当前“用户”主体
            User user = (User)currentUser.getPrincipal();
            course.setTeacher(user.getUid());
            int count = courseMapper.insertSelective(course);
            //关联所有专业的学生
            if(count>0){
                int courseId = course.getId();
                String profession = course.getProfession();
                if(StringUtils.isNotBlank(profession)){
                    List<User> userList = userMapper.findByMajor(profession);
                    StudentCourse studentCourse;
                    for(User student : userList){
                        studentCourse = new StudentCourse();
                        studentCourse.setStudentId(student.getUid());
                        studentCourse.setCourseId(courseId);
                        studentCourse.setIsJoin(1);
                        studentCourseMapper.insert(studentCourse);
                    }
                }
            }
            return count;
        }else{
            return courseMapper.updateByPrimaryKeySelective(course);
        }
    }

    @Override
    public int delete(Integer id) {
        return courseMapper.deleteByPrimaryKey(id);
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

    /**
     * 根据studentCourse中的条件获取对应的课程信息
     *
     * @param studentCourse
     * @return
     */
    @Override
    public List<Course> getAllByStudentCourse(StudentCourse studentCourse,CourseSearch courseSearch) {
        List<Course> courseList = new ArrayList<>();
        try{
            if(studentCourse!=null){
                courseList =courseMapper.getAllByStudentCourse(studentCourse,courseSearch);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return courseList;
    }

    /**
     * 根据课程发布人查询所有信息
     *
     * @param teacherIds
     * @return
     */
    @Override
    public List<Course> getAllByPublisher(List<Integer> teacherIds) {
        if(teacherIds.isEmpty()){
            return new ArrayList<>();
        }
        return courseMapper.getAllByPublisher(teacherIds);
    }

    /**
     * 根据课程id获取所有参与的人员
     *
     * @param courseId
     * @return
     */
    @Override
    public List<UserOfCourse> getJoinStudentByCourseId(Integer courseId) {
        if(courseId==null){
            return  new ArrayList<>();
        }
        return courseMapper.getJoinStudentByCourseId(courseId);
    }

    /**
     * 根据学生id和课程id 获取学生课程关系
     *
     * @param studentId
     * @param courseId
     * @return
     */
    @Override
    public StudentCourse getStudentCourseByStudentIdAndCourseId(Integer studentId, Integer courseId) {
        if(studentId==null || courseId ==null){
            return null;
        }
        StudentCourse sc = new StudentCourse();
        sc.setStudentId(studentId);
        sc.setCourseId(courseId);
        return studentCourseMapper.findByStudentCourse(sc);
    }

    /**
     * 更新学生和课程关系表
     *
     * @param sc
     * @return
     */
    @Override
    public int updateTotalTime(StudentCourse sc) {
        if(sc == null || sc.getStudentId()==null || sc.getCourseId()==null){
            return 0;
        }
        return studentCourseMapper.updateTotalTime(sc);
    }


}
