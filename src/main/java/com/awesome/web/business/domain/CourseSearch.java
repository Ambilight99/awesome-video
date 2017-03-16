package com.awesome.web.business.domain;


import org.apache.commons.lang.StringUtils;

import java.io.Serializable;

/**
 * @author adam
 * @ClassName CourseSearch
 * @Description 课程搜索参数对象
 * @create 2017/3/16 19:54
 */
public class CourseSearch implements Serializable{
    private String courseName;

    private Integer teacher;

    private String startDate;

    private String endDate;



    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = StringUtils.isBlank(courseName)?null:courseName.trim();
    }

    public Integer getTeacher() {
        return teacher;
    }

    public void setTeacher(Integer teacher) {
        this.teacher = teacher<0?null:teacher;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = StringUtils.isEmpty(startDate)?null:startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate =StringUtils.isEmpty(endDate)?null:endDate;
    }
}
