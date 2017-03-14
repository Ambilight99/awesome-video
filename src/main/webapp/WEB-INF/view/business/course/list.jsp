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
    <link rel="stylesheet" href="${contextPath}/static/layui/css/global.css"  media="all">
    <style>
        .layui-laypage-default{
            width:100%;
        }
    </style>
</head>
<body>
    <%@include file="/WEB-INF/view/leftMenu.jsp" %>
    <div id="course-list" class="layui-body layui-form layui-tab-content site-demo site-demo-body">
        <div class="layui-btn-group" style="width:100%">
            <a class="layui-btn layui-btn-radius"  href="${contextPath}/course/add" about="">增加</a>
            <%--<a class="layui-btn layui-btn-radius layui-btn-danger" >批量删除</a>--%>
        </div>
        <c:forEach items="${pageInfo.list}" var="course" varStatus="idx" >
        <div style="float:left; width:30%; height:300px; border:solid 0.1px rosybrown;margin:2px 5px;">
            <span>${course.name}-${course.createDate}</span>
            <video style="width:100%; object-fit: fill"  controls>
                <source src="${contextPath}/upload/video/${course.videoUrl}.mp4" type="video/mp4">
                <source src="${contextPath}/upload/video/${course.videoUrl}.mp4" type="video/ogg">
                您的浏览器不支持 HTML5 video 标签。
            </video>
            <span style="height:100px">
                &nbsp;&nbsp;&nbsp;&nbsp;${course.remark}
            </span>
        </div>
        </c:forEach>

        <div id="pager"></div>
    </div>
</body>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js" charset="utf-8"></script>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${contextPath}/static/vue/vue.js" charset="utf-8" ></script>
<script src="${contextPath}/static/jquery/jquery.form-3.51.0.js" charset="utf-8"></script>
<script>
    var pageInfo=${pageInfo};
    <%--var pageInfo={--%>
        <%--pages:"${pageInfo.pages}",--%>
        <%--pageNum:"${pageInfo.pageNum}",--%>
        <%--pageSize:"${pageInfo.pageSize}"--%>
    <%--};--%>

    layui.use(['laypage', 'layer','form'], function(){
        var $ = layui.jquery,
            form = layui.form(),
            laypage = layui.laypage,
            layer = layui.layer;
        //全选
        form.on('checkbox(allChoose)', function(data){
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function(index, item){
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });

        //分页插件
        laypage({
            cont: 'pager'
            ,pages: pageInfo.pages     //总页数 (总页数等于1，不会显示分页)
            ,curr: pageInfo.pageNum     //当前页
            ,groups: 5                  //连续显示分页数
            ,jump: function(obj, first){
                //得到了当前页，用于向服务端请求对应数据
                if(!first){
                    var param={
                        pageNum:obj.curr,
                        pageSize:pageInfo.pageSize
                    }
                    location.href="${contextPath}/course/list?"+$.param(param);
                    layer.msg('第 '+ obj.curr +' 页');
                }
            }
        });
    });

    var form = new Vue({
        el: '#course-list',
//        data: {
//            name: 'Vue.js'
//        },
        // 在 `methods` 对象中定义方法
        methods: {
            editOne:function(uid){
                pageInfo.uid=uid;
                location.href ="${contextPath}/user/edit?"+$.param(pageInfo);
            },
            deleteOne: function (uid) {
                deleteUser(uid);
            }
        }
    });


    /**
     * 删除
     */
    function deleteUser(uid){
        $.ajax({
            url:"${contextPath}/user/delete",
            data:{
                id:uid
            },
            dataType:"json",
            success:function(data){
                if(data.status=="success"){
                    layer.msg(data.message,{
                        time:1000,
                        end:function(){
                            location.reload()
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