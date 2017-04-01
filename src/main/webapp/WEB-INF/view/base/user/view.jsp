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
    <title>我的资料</title>
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
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>个人信息</legend>
            </fieldset>
            <table  style="margin: 2px 120px;text-align:left;width: 80%;border-collapse:separate; border-spacing:30px;font-size: 18px; ">
                <tr>
                    <td style="width:70px">账号：</td>
                    <td style="width:377px">${user.username}</td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td>${user.name}</td>
                </tr>
                <tr>
                    <td>手机号：</td>
                    <td>${user.mobile}</td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <td>专业：</td>
                    <td>${user.major} </td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>${user.sex==0?"男":"女"}</td>
                </tr>
                <tr>
                    <td>个人说明：</td>
                    <td>${user.description}</td>
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
