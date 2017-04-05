package com.awesome.web.base.service.impl;

import com.awesome.web.base.dao.RoleMapper;
import com.awesome.web.base.dao.UserMapper;
import com.awesome.web.base.dao.UserRoleMapper;
import com.awesome.web.base.domain.Role;
import com.awesome.web.base.domain.User;
import com.awesome.web.base.domain.UserRole;
import com.awesome.web.base.service.UserService;
import com.awesome.web.util.CompareUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author adam
 * @ClassName UserServiceImpl
 * @Description 用户实现类
 * @create 2017/3/7 22:32
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public List<User> getAll() {
        return userMapper.getAll();
    }

    @Override
    public int saveOrUpdate(User user) {
        if(user==null){
            return 0;
        }
        if(user.getUid()==null || user.getUid()==0){
           return userMapper.insertSelective(user);
        }else{
           return userMapper.updateByPrimaryKeySelective(user);
        }
    }

    @Override
    public int delete(Integer id) {
        if(id==null || id<=0){
            return 0;
        }else{
            userRoleMapper.deleteByUserId(id);
            return  userMapper.deleteByPrimaryKey(id);
        }
    }

    @Override
    public User findById(Integer id) {
        if(id==null || id<=0){
            return null;
        }else{
            return userMapper.selectByPrimaryKey(id);
        }
    }

    @Override
    public User findByUid(Integer id) {
        if(id==null || id<=0){
            return null;
        }else{
            return userMapper.findByUid(id);
        }
    }

    @Transactional
    @Override
    public int saveOrUpdate(User user, Set<Integer> roleIds) {
        if(user==null){
            return 0;
        }
        Integer uid = user.getUid();
        if(uid==null || uid==0){
            int count =userMapper.insertSelective(user);
            roleIds.forEach(roleId ->userRoleMapper.insert(new UserRole(user.getUid(),roleId)));
            return count;
        }else{
            Set<Integer> roleIdsInDb = userRoleMapper.selectRoleIdByUserId(uid);
            Map<String,Set<Integer>> map =new CompareUtils<Integer>().diffSet(roleIds,roleIdsInDb);
            Set<Integer> add = map.get("add");
            Set<Integer> delete = map.get("delete");
            if(!add.isEmpty()){
                add.forEach(roleId-> userRoleMapper.insert(new UserRole(uid,roleId)));
            }
            if(!delete.isEmpty()){
                delete.forEach(roleId-> userRoleMapper.delete(new UserRole(uid,roleId)));
            }

            return userMapper.updateByPrimaryKeySelective(user);
        }
    }

    @Override
    public Set<Role> getRolesListByUid(Integer uid) {
        Set<Role> roles = roleMapper.getRolesListByUid(uid);
        return roles;
    }

    /**
     * 根据角色id获取用户
     *
     * @param roleId
     * @return
     */
    @Override
    public List<User> getUserByRoleId(Integer roleId) {
        if(roleId==null){
            return new ArrayList<>();
        }
        return userMapper.getUserByRoleId(roleId);
    }
}
