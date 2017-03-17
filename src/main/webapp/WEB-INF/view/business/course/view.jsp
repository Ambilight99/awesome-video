<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("contextPath", request.getContextPath());//page域
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程展示</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${contextPath}/static/layui/css/layui.css"  media="all">
</head>
<body>
    <div class="layui-layout layui-layout-admin">
        <%@include file="/WEB-INF/view/header.jsp" %>
        <%@include file="/WEB-INF/view/leftMenu.jsp" %>
        <div class="layui-body layui-tab-content site-demo site-demo-body">
            <h1>${course.name}</h1>
            <div>
                <span>课程代号：${course.code}</span>
                <span>所属专业：${course.profession}</span>
            </div>
            <div>
                <span>所属教师：${course.teacher}</span>
                <span>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分：${course.credit}</span>
            </div>
            <div>
                <span>简介：${course.remark}</span>
            </div>
            <div style="margin:2px 150px">
                <video style="width:100%; object-fit: fill"  controls>
                    <source src="${contextPath}/upload/video/${course.videoUrl}" type="video/mp4">
                    <source src="${contextPath}/upload/video/${course.videoUrl}" type="video/ogg">
                    您的浏览器不支持 HTML5 video 标签。
                </video>
            </div>
            <div>
                <p>详情:${course.content}</p>
            </div>
        </div>
    </div>
</body>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js" charset="utf-8"></script>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${contextPath}/static/vue/vue.js" charset="utf-8" ></script>
<script>
</script>
</html>
