package com.awesome.web.business.domain;

/**
 * 学生课程中间类 fxw
 * @author lenovo
 *
 */
public class StudentCourse {
    /** 学生id */
    private Integer studentId;
    /** 课程id */
    private Integer courseId;
    /** 是否收藏 1是0否 */
    private Integer isCollect;
    /** 是否参与 1是0否 */
    private Integer isJoin;
    /** 观看的总时间(分钟为单位) */
    private Integer totalTime;

    public StudentCourse() {
    }

    public StudentCourse(Integer studentId, Integer courseId, Integer isCollect, Integer isJoin) {
        this.studentId = studentId;
        this.courseId = courseId;
        this.isCollect = isCollect;
        this.isJoin = isJoin;
    }

    public StudentCourse(Integer studentId, Integer courseId, Integer isCollect, Integer isJoin,Integer totalTime) {
        this.studentId = studentId;
        this.courseId = courseId;
        this.isCollect = isCollect;
        this.isJoin = isJoin;
        this.totalTime = totalTime;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getIsCollect() {
        return isCollect;
    }

    public void setIsCollect(Integer isCollect) {
        this.isCollect = isCollect;
    }

    public Integer getIsJoin() {
        return isJoin;
    }

    public void setIsJoin(Integer isJoin) {
        this.isJoin = isJoin;
    }

    public Integer getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(Integer totalTime) {
        this.totalTime = totalTime==null?0:totalTime;
    }
}