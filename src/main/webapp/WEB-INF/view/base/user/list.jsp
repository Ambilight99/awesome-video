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
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${contextPath}/static/layui/css/layui.css"  media="all">
</head>
<body>
    <%@include file="/WEB-INF/view/leftMenu.jsp" %>
    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="50">
                <col width="150">
                <col width="150">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                <th>编号</th>
                <th>用户名</th>
                <th>密码</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user" >
                <tr>
                    <td><input type="checkbox" name="" lay-skin="primary"></td>
                    <td>${user.uid}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</body>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('form', function(){
        var $ = layui.jquery, form = layui.form();
        //全选
        form.on('checkbox(allChoose)', function(data){
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function(index, item){
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });

    });
</script>
</html>
