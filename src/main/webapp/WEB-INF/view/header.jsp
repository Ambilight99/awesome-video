<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="${contextPath}/static/layui/css/global.css"  media="all">
<div class="layui-header header header-demo"  style="position: fixed;width: 100%;line-height: 60px;">
    <div class="layui-main">
        <div class="logo" style="font-size: 20px;color: #009688;top:0px" >
            在线课程<img src="${contextPath}/static/image/video_camera.png"  style="width: 40px;"/>
        </div>
        <div style="float:right;font-size: 15px;color: #009688;right:100px;position: absolute;">
            <ul class="layui-nav" style="width: 250px!important;color: #009688!important;text-align: right" >
                <li class="layui-nav-item" pc>
                    <a href="javascript:;"> 欢迎你,【${ sessionScope.user.name}】</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${contextPath}/user/view?pageNum=1" >个人中心</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <div style="float:right;margin-right: 50px;" title="退出">
            <a href="${contextPath}/logout" style="height:100%">
                <img src="${contextPath}/static/image/shutdown.png"  />
            </a>
        </div>
    </div>

</div>
