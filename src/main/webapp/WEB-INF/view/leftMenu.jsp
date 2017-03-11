<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link rel="stylesheet" href="${contextPath}/static/layui/css/layui.css" media="all">
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <ul class="layui-nav layui-nav-tree" lay-filter="demo">
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">默认展开</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">选项一</a></dd>
                    <dd><a href="javascript:;">选项二</a></dd>
                    <dd><a href="javascript:;">选项三</a></dd>
                    <dd><a href="javascript:;">跳转项</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">解决方案</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;"> --移动模块</a></dd>
                    <dd><a href="javascript:;"> --后台模版</a></dd>
                    <dd><a href="javascript:;"> --111xxxxx</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">后台管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${contextPath}/user/list">用户管理</a></dd>
                    <dd><a href="javascript:;">角色管理</a></dd>
                    <dd><a href="javascript:;">权限管理</a></dd>
                    <dd><a href="${contextPath}/upload/view">文件上传</a></dd>
                    <dd><a href="${contextPath}/upload/videoShow">视频播放</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${contextPath}/logout">退出</a></li>
        </ul>
    </div>
</div>

<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('element', function(){
        var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
