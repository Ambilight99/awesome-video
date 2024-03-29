<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    pageContext.setAttribute("contextPath", request.getContextPath());//page域
%>
<link rel="stylesheet" href="${contextPath}/static/layui/css/layui.css" media="all">

<div id="left-menu" class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <ul id="menu-ul" class="layui-nav layui-nav-tree" lay-filter="demo" >
            <li v-for="(subItem,index) in items" class="layui-nav-item layui-nav-itemed">
                <a v-bind:href="subItem.url">{{subItem.name}}</a>
                <dl class="layui-nav-child">
                    <dd  v-for="(item, index) in subItem.items" >
                        <a  v-bind:href="item.url">&nbsp;&nbsp;&nbsp;--&nbsp;{{ item.name }}</a>
                    </dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js" charset="utf-8"></script>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${contextPath}/static/vue/vue.js" charset="utf-8" ></script>

<script>
    layui.use('element', function(){
        var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            layer.msg(elem.text());
        });
    });
    var menuData={
            items:[
                    {
                        name:"课程管理",
                        url:"javascriot:;",
                        subOpen:true, //子栏目是否展开
                        items: [
                            { name: '所有课程' ,url:"${contextPath}/course/list?pageSize=6"},
                            { name: '我的参与' ,url:"${contextPath}/course/list/join?pageSize=6"},
                            { name: '我的收藏' ,url:"${contextPath}/course/list/collect?pageSize=6"}
                        ]
                    },
                    {
                        name:"后台管理",
                        url:"javascriot:;",
                        subOpen:true, //子栏目是否展开
                        items: [
                            { name: '用户管理' ,url:"${contextPath}/user/list?pageNum=1"},
                            <%--{ name: '角色管理' ,url:"${contextPath}/role/list"},--%>
                            <%--{ name: '权限管理' ,url:"${contextPath}/resource/list"},--%>
                            <%--{ name: '文件上传' ,url:"${contextPath}/upload/view"},--%>
                            <%--{ name: '视频播放' ,url:"${contextPath}/upload/videoShow"}--%>
                        ]
                    }
            ]
    };
    <shiro:hasRole name="学生">
    menuData={
        items:[
            {
                name:"课程管理",
                url:"javascriot:;",
                subOpen:true, //子栏目是否展开
                items: [
                    { name: '所有课程' ,url:"${contextPath}/course/list?pageSize=6"},
                    { name: '我的参与' ,url:"${contextPath}/course/list/join?pageSize=6"},
                    { name: '我的收藏' ,url:"${contextPath}/course/list/collect?pageSize=6"}
                ]
            }
        ]
    };
    </shiro:hasRole>
    <shiro:hasRole name="教师">
    menuData={
        items:[
            {
                name:"课程管理",
                url:"javascriot:;",
                subOpen:true, //子栏目是否展开
                items: [
                    { name: '所有课程' ,url:"${contextPath}/course/list?pageSize=6"}
                ]
            },
        ]
    };
    </shiro:hasRole>


    var menu = new Vue({
        el: '#menu-ul',
        data: menuData
    })


    $(function(){
        var url = window.location.href;
        url =url.substring(url.indexOf("awesome"),url.indexOf("?")+1);
        console.log(  url)
        $(".layui-nav-child>dd>a").each(function(){
            if( $(this).attr("href").indexOf(url)!=-1 ){
                $(this).parent().addClass("layui-this");
            }
        });

    });
</script>
