package com.awesome.web.base.dao;

import com.awesome.web.base.domain.UserRole;

public interface userRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);
}