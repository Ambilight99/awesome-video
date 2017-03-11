package com.awesome.web.dao.base;

import com.awesome.web.domain.base.RoleResource;

public interface RoleResourceMapper {
    int insert(RoleResource record);

    int insertSelective(RoleResource record);
}