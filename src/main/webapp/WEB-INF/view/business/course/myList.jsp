<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="${contextPath}/static/base/css/course/course.css"  media="all">
</head>
<body>
    <%@include file="/WEB-INF/view/leftMenu.jsp" %>
    <div id="course-list" class="layui-body layui-form layui-tab-content site-demo site-demo-body" style="background-color: rgba(0, 150, 136, 0.12);">

        <c:forEach items="${pageInfo.list}" var="course" varStatus="idx" >
        <div class="video-div">
            <h2 class="video-name">${course.name}</h2>
            <p class="video-date"><fmt:formatDate type="date" value="${course.createDate}" /></p>
            <div>
                <video style="width:100%; object-fit: fill"  controls >
                    <source src="${contextPath}/upload/video/${course.videoUrl}" type="video/mp4">
                    <source src="${contextPath}/upload/video/${course.videoUrl}" type="video/ogg">
                    您的浏览器不支持 HTML5 video 标签。
                </video>
            </div>
            <span style="height:100px;">
                <p style="text-align: right;padding-right:5px">
                    <c:choose>
                        <c:when test="${course.join}">
                            <a class="video-btn" v-on:click="unJoinOne('${course.id}')">【取消参与】</a>
                        </c:when>
                        <c:otherwise>
                            <a class="video-btn" v-on:click="joinOne('${course.id}')">【参与】</a>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${course.collect}">
                            <a class="video-btn" v-on:click="unCollectOne('${course.id}')" >【取消收藏】</a>
                        </c:when>
                        <c:otherwise>
                            <a class="video-btn" v-on:click="collectOne('${course.id}')" >【收藏】</a>
                        </c:otherwise>
                    </c:choose>
                </p>

                <p class="video-remark" >
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;${course.remark}
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath}/course/view?id=${course.id}" style="color:blue;text-decoration: underline;">更多信息</a>
                </p>
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
            editOne:function(id){
                var param={
                    pageNum:pageInfo.pageNum,
                    pageSize:pageInfo.pageSize,
                    id:id
                }
                location.href ="${contextPath}/course/edit?"+$.param(param);
            },
            joinOne:function(id){
                joinCourse(id,1);
            },
            collectOne:function(id){
                collectCourse(id,1);
            },
            unJoinOne: function (id) {
                joinCourse(id,0);
            },
            unCollectOne:function(id){
                collectCourse(id,0);
            },
            deleteOne: function (id) {
                deleteCourse(id);
            }
        }
    });

    /**
     * 参加/取消课程
     */
    function joinCourse(id,isJoin){
        var param = getPager();
        param.id=id;
        param.isJoin =isJoin;
        $.ajax({
            url:"${contextPath}/course/join",
            type:"POST",
            data:param,
            dataType:"json",
            success:function (data) {
                layer.msg(data.message,{
                    time:1000,
                    end:function(){
                        location.href="${contextPath}/course/list/join/?"+$.param(getPager());
                    }
                });
            },
            error:function(data){
                console.error(data);
            }
        });
    }

    /**
     * 收藏/取消课程
     */
    function collectCourse(id,isCollect){
        var param = getPager();
        param.id=id;
        param.isCollect =isCollect;
        $.ajax({
            url:"${contextPath}/course/collect",
            type:"POST",
            data:param,
            dataType:"json",
            success:function (data) {
                layer.msg(data.message,{
                    time:1000,
                    end:function(){
                        location.href="${contextPath}/course/list/collect/?"+$.param(getPager());
                    }
                });
            },
            error:function(data){
                console.error(data);
            }
        });
    }

    /**
     * 删除
     */
    function deleteCourse(uid){
        $.ajax({
            url:"${contextPath}/course/delete",
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

    /**
     * 获取参数信息
     * @param pageInfo
     * @param id
     */
    function getPager(page){
        if(!page) page =pageInfo;
        var param={
            pageNum:page.pageNum,
            pageSize:page.pageSize
        };
        return param;
    }
</script>
</html>
