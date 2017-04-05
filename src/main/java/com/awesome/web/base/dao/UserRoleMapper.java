package com.awesome.web.base.dao;

import com.awesome.web.base.domain.UserRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * 用户角色Mapper
 */
@Mapper
public interface UserRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);

    int delete(UserRole record);

    /**
     * 根据用户id查询角色
     * @param uid
     * @return
     */
    Set<Integer> selectRoleIdByUserId(@Param("uid") Integer uid);

    @Delete(" delete from user_role where user_id =#{userId} ")
    int deleteByUserId(Integer userId);
}