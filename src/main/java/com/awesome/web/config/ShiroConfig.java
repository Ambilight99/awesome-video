package com.awesome.web.config;

import com.awesome.web.shiro.AuthRealm;
import com.awesome.web.shiro.CredentialsMatcher;
import com.awesome.web.shiro.filter.UrlAuthorizeFilter;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author 作者 z77z
 * @date 创建时间：2017年2月10日 下午1:16:38
 *
 */
@Configuration
public class ShiroConfig {
	@Bean(name="shiroFilter")
	public ShiroFilterFactoryBean shiroFilter(@Qualifier("securityManager") SecurityManager manager) {
		ShiroFilterFactoryBean bean=new ShiroFilterFactoryBean();
		bean.setSecurityManager(manager);

//		//设置拦截器链，用于自定义拦截
//		Map<String,Filter> filterMap = new HashMap<>();
//		Filter urlAuthorizeFilter = new UrlAuthorizeFilter();
//		filterMap.put("urlAuthorizeFilter",urlAuthorizeFilter);
//		bean.setFilters(filterMap);

		//配置登录的url和登录成功的url
		bean.setLoginUrl("/login");
		bean.setSuccessUrl("/index");
		bean.setUnauthorizedUrl("/403");
		//配置访问权限
		LinkedHashMap<String, String> filterChainDefinitionMap=new LinkedHashMap<>();
		filterChainDefinitionMap.put("/login", "anon"); //表示可以匿名访问
		filterChainDefinitionMap.put("/userLogin", "anon");
		filterChainDefinitionMap.put("/logout","anon");
		filterChainDefinitionMap.put("/static/**","anon");
		filterChainDefinitionMap.put("/upload/**","anon");
		filterChainDefinitionMap.put("/register/**","anon");
		filterChainDefinitionMap.put("/**", "authc");//表示需要认证才可以访问
		bean.setFilterChainDefinitionMap(filterChainDefinitionMap);

		return bean;
	}

	//配置核心安全事务管理器
	@Bean(name="securityManager")
	public SecurityManager securityManager(@Qualifier("authRealm") AuthRealm authRealm,@Qualifier("ehCacheManager") EhCacheManager ehCacheManager) {
		System.err.println("--------------shiro已经加载----------------");
		DefaultWebSecurityManager manager=new DefaultWebSecurityManager();
		manager.setRealm(authRealm);
		manager.setCacheManager(ehCacheManager);//设置缓存
		return manager;
	}

	//配置自定义的权限登录器
	@Bean(name="authRealm")
	public AuthRealm authRealm(@Qualifier("credentialsMatcher") CredentialsMatcher matcher) {
		AuthRealm authRealm=new AuthRealm();
		authRealm.setCredentialsMatcher(matcher);
		return authRealm;
	}
	//配置自定义的密码比较器
	@Bean(name="credentialsMatcher")
	public CredentialsMatcher credentialsMatcher() {
		return new CredentialsMatcher();
	}

	/**
	 * 缓存管理
	 * @return
	 */
	@Bean(name="ehCacheManager")
	public EhCacheManager ehCacheManager(){
		System.out.println("ShiroConfiguration.getEhCacheManager()");
		EhCacheManager cacheManager = new EhCacheManager();
		cacheManager.setCacheManagerConfigFile("classpath:config/ehcache-shiro.xml");
		return cacheManager;
	}

	@Bean
	public LifecycleBeanPostProcessor lifecycleBeanPostProcessor(){
		return new LifecycleBeanPostProcessor();
	}

	@Bean
	public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator(){
		DefaultAdvisorAutoProxyCreator creator=new DefaultAdvisorAutoProxyCreator();
		creator.setProxyTargetClass(true);
		return creator;
	}

	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("securityManager") SecurityManager manager) {
		AuthorizationAttributeSourceAdvisor advisor=new AuthorizationAttributeSourceAdvisor();
		advisor.setSecurityManager(manager);
		return advisor;
	}

	@Bean
	public UrlAuthorizeFilter urlAuthorizeFilter(){
		return new UrlAuthorizeFilter();
	}
}
