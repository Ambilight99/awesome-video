package com.awesome.web.domain;

public class StudentCourse {
    private Integer studentId;

    private Integer courseId;

    private Integer isCollect;

    private Integer isJoin;

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
}