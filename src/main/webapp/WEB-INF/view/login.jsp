<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("contextPath", request.getContextPath());//page域
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html">
	<meta charset="UTF-8">
	<title>登录页</title>
    <link rel = "shortcut Icon" href="${contextPath}/static/image/video_camera.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${contextPath}/static/base/css/login.css">
</head>
<body class="login-body">
<div class="wrap">
    <div class="container">
        <h1>Welcome</h1>
        <form>
            <input type="text"  id="username" placeholder="用户名"/>
            <input type="password"  id="password" placeholder="密码"/>
            <input type="button" value="登录" onclick="userLogin()" style="font-size:20px;font-weight:800;cursor: pointer;"  />
            <input type="button" value="注册" onclick="register()" style="font-size:20px;font-weight:800;cursor: pointer;"  />
        </form>
    </div>
    <ul>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
</body>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js"></script>
<script>
    function userLogin(){
        var username = $("#username").val();
        var password = $("#password").val();
      //  var vcode = $("#vcode").val();
      //  var rememberMe =$('#rememberMe').is(':checked');
        $.ajax({
            type : "POST",
            data : {
                "username" : username,
                "password" : password,
           //     "vcode" : vcode,
           //     "rememberMe" : rememberMe
            },
            dataType : "json",
            url : "${contextPath}/userLogin",
            success:function(result){
                if(result.status == "200"){
                    location.href="${contextPath}/index";
                }else{
                    alert(result.message);
                }
            },
            error:function(){
                alert("error")
            }
        });
    }

    /**
     * 触法事件
     */
    $("#password").keydown(function(e){
        if(e.keyCode ==13){//触发键盘事件enter 防止冒泡产生
            userLogin();
            return false;
        }
    });

    /**
     * 注册
     */
    function register(){
        location.href="${contextPath}/register/form";
    }
</script>
</html>