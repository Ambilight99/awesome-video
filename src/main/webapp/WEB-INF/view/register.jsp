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
    <title>注册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${contextPath}/static/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${contextPath}/static/layui/css/global.css"  media="all">
    <style>
        .layui-body{
            left: 0px!important;
            top:0px!important;
        }

    </style>
</head>
<body>
    <div >
        <div class="layui-body layui-tab-content site-demo site-demo-body">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>用户注册</legend>
            </fieldset>
            <form id="form" class="layui-form" action="">
                <input type="hidden" name="uid" value="${user.uid}" >
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" value="${user.username}" lay-verify="username"
                               placeholder="请输入账号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" value="${user.password}"  lay-verify="password"
                               placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" value="${user.name}" lay-verify="name"
                               placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input type="text" name="mobile" value="${user.mobile}"  lay-verify="mobile"
                               placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" value="${user.email}" lay-verify="email"
                               placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">专业</label>
                    <div class="layui-input-block">
                        <select name="major" lay-verify="required" value="${user.major}">
                            <option value=""></option>
                            <option value="理学" ${user.major=='理学'?'selected':''} >理学</option>
                            <option value="工学" ${user.major=='工学'?'selected':''} >工学</option>
                            <option value="农学" ${user.major=='农学'?'selected':''} >农学</option>
                            <option value="医学" ${user.major=='医学'?'selected':''} >医学</option>
                            <option value="艺术学" ${user.major=='艺术学'?'selected':''} >艺术学</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="0" title="男" ${user.sex==0?'checked':''} />
                        <input type="radio" name="sex" value="1" title="女" ${user.sex!=0?'checked':''} />
                    </div>
                </div>
                <%--
                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">角色</label>
                    <div class="layui-input-block">
                        <!--
                        <input type="checkbox" name="roleIds" value="1" lay-skin="primary" title="管理员" />
                        -->
                        <input type="checkbox" name="roleIds" value="2" lay-skin="primary" title="老师" />
                        <input type="checkbox" name="roleIds" value="3" lay-skin="primary" title="学生" />
                    </div>
                </div>
                --%>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">个人说明</label>
                    <div class="layui-input-block">
                        <textarea name="desc" value="" placeholder="请输入内容" class="layui-textarea" lay-verify="desc" ></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <a class="layui-btn" lay-submit="" v-on:click="submit" >立即提交</a>
                        <a class="layui-btn layui-btn-primary"  v-on:click="reset">重置</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js" charset="utf-8"></script>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${contextPath}/static/vue/vue.js" charset="utf-8" ></script>
<script src="${contextPath}/static/jquery/jquery.form-3.51.0.js" charset="utf-8"></script>
<script src="${contextPath}/static/base/common.js" charset="utf-8"></script>
<script>
    var pager = ${pager};
    var user =${user};

    //选中checkbox
    var roles = user.roles;
    for(var i in roles){
        $(":checkbox[name='roleIds'][value='"+roles[i].id+"']").attr("checked",true);
    }

    layui.use(['form'], function(){
        var form = layui.form();
        //自定义验证规则
        form.verify({
            username: function(value){
                if(value.length < 4){
                    return '用户名至少得4个字符啊';
                }
            }
            ,password: [/(.+){6,12}$/, '密码必须6到12位']
            ,desc: function(value){
                if(value.length >200  ){
                    return '个人说明最多200个字符';
                }
            }
            ,name: function(value){
                if(value.length ==0  ){
                    return '姓名不为空';
                }
                if(value.length>10){
                    return '姓名最多10个字符';
                }
            }
            ,mobile: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！']
            ,email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
        });
    });

    var form = new Vue({
        el: '#form',
        //data: user,
        // 在 `methods` 对象中定义方法
        methods: {
            submit: function (event) {
                setTimeout(function(){
                   if($(".layui-form-danger").length==0){
                       formSubmit();
                    }
                },100);
            }
            ,reset:function(){
                document.getElementById("form").reset();
            }
        }
    });


    /**
     * 表单提交
     */
    function formSubmit() {
        $("#form").ajaxSubmit({
            url:"${contextPath}/register/save",
            type:"get",
            dataType:"json",
            beforeSubmit:function(data){
                console.log(data);
            },
            success:function(data){
                if(data.status=="success"){
                    layer.msg(data.message,{
                        time:1000,
                        end:function(){
                            location.href="${contextPath}/login";
                        }
                    });
                }else{
                    layer.msg(data.message);
                }
            }
        });
    }
</script>
</html>
