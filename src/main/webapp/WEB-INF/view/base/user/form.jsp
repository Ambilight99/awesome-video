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
    <div class="layui-body layui-tab-content site-demo site-demo-body">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>用户添加</legend>
        </fieldset>
        <form id="form" class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="username" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">辅助文字</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input type="text" name="mobile" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="email" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">专业</label>
                <div class="layui-input-block">
                    <select name="major" lay-verify="required">
                        <option value=""></option>
                        <option value="理学">理学</option>
                        <option value="工学">工学</option>
                        <option value="农学">农学</option>
                        <option value="医学">医学</option>
                        <option value="艺术学">艺术学</option>
                    </select>
                </div>
            </div>
            <!--
            <div class="layui-form-item">
                <label class="layui-form-label">复选框</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="like[write]" title="写作">
                    <input type="checkbox" name="like[read]" title="阅读" checked>
                    <input type="checkbox" name="like[dai]" title="发呆">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开关</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="switch" lay-skin="switch">
                </div>
            </div>
            -->
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="0" title="女" checked>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">个人说明</label>
                <div class="layui-input-block">
                    <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" v-on:click="submit" >立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</body>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js" charset="utf-8"></script>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${contextPath}/static/vue/vue.js" charset="utf-8" ></script>
<script src="${contextPath}/static/jquery/jquery.form-3.51.0.js" charset="utf-8"></script>
<script>
    //Demo
    layui.use('form', function(){
       layui.form();
    });

    var form = new Vue({
        el: '#form',
//        data: {
//            name: 'Vue.js'
//        },
        // 在 `methods` 对象中定义方法
        methods: {
        submit: function (event) {
            formSubmit();
        }
    }
    })


    /**
     * 表单提交
     */
    function formSubmit() {
        $("#form").ajaxSubmit({
            url:"${contextPath}/user/saveOrUpdate",
            type:"post",
            dataType:"json",
            beforeSubmit:function(data){
                console.log(data);
            },
            success:function(data){
                if(data.status=="success"){
                    layer.msg(data.message);
                }else{
                    layer.msg(data.message);
                }
            }
        });
    }
</script>
</html>
