package com.awesome.web.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * @author adam
 * @ClassName Model
 * @Description 资源
 * @create 2017/3/8 14:31
 */
public class Resource {
    private int id;
    private String name;
    private String url;
    private Set<Role> roles = new HashSet<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
