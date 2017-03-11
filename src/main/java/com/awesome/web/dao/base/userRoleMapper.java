package com.awesome.web.dao.base;

import com.awesome.web.domain.base.userRole;

public interface userRoleMapper {
    int insert(userRole record);

    int insertSelective(userRole record);
}