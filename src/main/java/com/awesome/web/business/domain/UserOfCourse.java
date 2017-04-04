package com.awesome.web.business.domain;

import com.awesome.web.base.domain.User;

/**
 * @author adam
 * @ClassName UserOfCourse
 * @Description 课程中的学生
 * @create 2017/4/3 23:06
 */
public class UserOfCourse extends User {
    private Integer totalTime;

    public Integer getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(Integer totalTime) {
        this.totalTime = totalTime;
    }
}
