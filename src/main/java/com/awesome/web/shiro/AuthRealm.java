package com.awesome.web.shiro;

import com.awesome.web.domain.base.Resource;
import com.awesome.web.domain.base.Role;
import com.awesome.web.domain.base.User;
import com.awesome.web.service.base.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author adam
 * @ClassName AuthRealm
 * @Description 身份校验核心类:
 * @create 2017/3/8 15:10
 */
public class AuthRealm extends AuthorizingRealm {
	@Autowired
	private UserService userService;

	//认证.登录
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken utoken=(UsernamePasswordToken) token;//获取用户输入的token
		String username = utoken.getUsername();
		User user = userService.findByUsername(username);
		return new SimpleAuthenticationInfo(user, user.getPassword(),this.getClass().getName());//放入shiro.调用CredentialsMatcher检验密码
	}
	//授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		System.out.println("授权！");
		User user=(User) principal.fromRealm(this.getClass().getName()).iterator().next();//获取session中的用户
		List<String> permissions=new ArrayList<>();
		Set<Role> roles = user.getRoles();
		Set<String> roleNames = new HashSet<>();
		if(roles.size()>0) {
			for(Role role : roles) {
				roleNames.add(role.getName());
				Set<Resource> resources = role.getResources();
				if(resources.size()>0) {
					for(Resource resource : resources) {
						permissions.add(resource.getName());
					}
				}
			}
		}
		SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
		info.addStringPermissions(permissions);//将权限放入shiro中.
		info.addRoles(roleNames);
		return info;
	}
}
