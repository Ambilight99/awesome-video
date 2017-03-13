package com.awesome.web.base.dao;

import com.awesome.web.base.domain.RoleResource;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoleResourceMapper {
    int insert(RoleResource record);

    int insertSelective(RoleResource record);
}