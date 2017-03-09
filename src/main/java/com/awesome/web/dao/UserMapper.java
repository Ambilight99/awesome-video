package com.awesome.web.dao;

import com.awesome.web.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author adam
 * @ClassName TestDao
 * @Description 测试用例
 * @create 2017/3/7 21:10
 */
@Mapper
public interface UserMapper {
    // @Select("select * from awesome.user where name = #{name}")
    User findByUsername(@Param("username")String username);

    /**
     * 获取所有人员信息
     * @return
     */
    @Select("select * from user ")
    List<User> getAll();
}
