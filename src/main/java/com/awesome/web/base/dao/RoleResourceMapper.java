package com.awesome.web.base.dao;

import com.awesome.web.base.domain.RoleResource;

public interface RoleResourceMapper {
    int insert(RoleResource record);

    int insertSelective(RoleResource record);
}