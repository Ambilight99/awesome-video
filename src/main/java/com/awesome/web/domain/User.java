package com.awesome.web.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * @author adam
 * @ClassName User
 * @Description 用户
 * @create 2017/3/8 14:29
 */
public class User {
    private int uid;
    private String username;
    private String password;
    private Set<Role> roles = new HashSet<>();

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
