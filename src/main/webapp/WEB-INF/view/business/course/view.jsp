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
    <link rel = "shortcut Icon" href="${contextPath}/static/image/video_camera.ico" type="image/x-icon">
    <link rel="stylesheet" href="${contextPath}/static/layui/css/layui.css"  media="all">
    <style>
        tr{
        }

    </style>
</head>
<body>
    <div class="layui-layout layui-layout-admin">
        <%@include file="/WEB-INF/view/header.jsp" %>
        <%@include file="/WEB-INF/view/leftMenu.jsp" %>
        <div class="layui-body layui-tab-content site-demo site-demo-body" style="text-align: center;">
            <table  style="margin: 2px 120px;text-align:left;width: 80%;border-collapse:separate; border-spacing:10px; ">
                <tr>
                    <td colspan="4" style="text-align:center;font-size: 20px;font-weight: 800">${course.name}</td>
                </tr>
                <tr>
                    <td style="width:70px">课程代号：</td>
                    <td style="width:377px">${course.code}</td>
                    <td style="width:70px">所属专业：</td>
                    <td>${course.profession}</td>
                </tr>
                <tr>
                    <td>所属教师：</td>
                    <td>${course.teacher}</td>
                    <td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分：</td>
                    <td>${course.credit}</td>
                </tr>
                <tr>
                    <td>简介：</td>
                    <td colspan="3">${course.remark}</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <video style="width:100%; object-fit: fill"  controls>
                            <source src="${contextPath}/upload/video/${course.videoUrl}" type="video/mp4">
                            <source src="${contextPath}/upload/video/${course.videoUrl}" type="video/ogg">
                            您的浏览器不支持 HTML5 video 标签。
                        </video>
                    </td>
                </tr>
                <tr>
                    <td>详情：</td>
                    <td colspan="3">${course.content}</td>
                </tr>
            </table>
        </div>
    </div>
</body>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js" charset="utf-8"></script>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${contextPath}/static/vue/vue.js" charset="utf-8" ></script>
<script src="${contextPath}/static/base/common.js" charset="utf-8"></script>
<script>
</script>
</html>
