package com.awesome.web.shiro.filter;

import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * @author adam
 * @ClassName UrlAuthorizeFilter
 * @Description url验证拦截器
 * @create 2017/3/9 22:29
 */
public class UrlAuthorizeFilter extends AccessControlFilter {
    @Override
    protected boolean pathsMatch(String path, ServletRequest request) {
        return super.pathsMatch(path, request);
    }

    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
//        String path =this.getPathWithinApplication(request);
//        System.out.println(path);
//        Set<String> urls = new HashSet<>();
//        urls.add("/user/list");
//        if(urls.contains(path)){
//            WebUtils.issueRedirect(request,response,"/403");
//            return false;
//        }
        return super.preHandle(request, response);
    }

    @Override
    public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        System.out.println("####url match confi is "+ Arrays.toString((String[])mappedValue));
        return super.onPreHandle(request, response, mappedValue);
    }


    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        return false;
    }
}
