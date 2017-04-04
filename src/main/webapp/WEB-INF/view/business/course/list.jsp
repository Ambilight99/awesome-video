<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    pageContext.setAttribute("contextPath", request.getContextPath());//page域
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel = "shortcut Icon" href="${contextPath}/static/image/video_camera.ico" type="image/x-icon">
    <link rel="stylesheet" href="${contextPath}/static/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${contextPath}/static/layui/css/global.css"  media="all">
    <link rel="stylesheet" href="${contextPath}/static/base/css/course/course.css"  media="all">
</head>
<body>
    <div class="layui-layout layui-layout-admin">
        <%@include file="/WEB-INF/view/header.jsp" %>
        <%@include file="/WEB-INF/view/leftMenu.jsp" %>
        <div id="course-list" class="layui-body layui-form layui-tab-content site-demo site-demo-body" style="background-color: rgba(0, 150, 136, 0.12);">
            <form id="form">
                <div class="layui-form-pane search-div">
                    <div class="layui-input-inline"  >
                        <input type="text" name="courseName" value="${courseSearch.courseName}"  placeholder="课程名称"
                               autocomplete="off" class="layui-input" style="float: left" />
                    </div>
                    <div class="layui-input-inline"  style="width:212px;" >
                        <select id="teacher" name="teacher" style="float: left">
                            <option value="-1">全部教师</option>
                            <c:forEach items="${teacherList}" var="teacher">
                                <option value="${teacher.uid}" ${courseSearch.teacher==teacher.uid?"selected":""}  >${teacher.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="layui-input-inline"  >
                        <input class="layui-input" placeholder="开始日期" id="startDate" name="startDate" value="${courseSearch.startDate}" style="float:left"/>
                    </div>
                    <div class="layui-input-inline"  >
                        <input class="layui-input" placeholder="结束日期" id="endDate" name="endDate" value="${courseSearch.endDate}" style=""/>
                    </div>
                    <div class="layui-input-inline"  >
                        <a class="layui-btn " lay-submit="" onClick="searchCourse()" >查找</a>
                    </div>
                    <shiro:hasAnyRoles name="管理员,教师">
                        <div class="layui-input-inline"  >
                            <a class="layui-btn "  href="${contextPath}/course/add" about="">增加</a>
                        </div>
                    </shiro:hasAnyRoles>
                </div>
            </form>
            <hr style="background-color: rgba(0, 150, 136, 0.52);">
            <c:forEach items="${pageInfo.list}" var="course" varStatus="idx" >
            <div class="video-div">
                <h2 class="video-name">${course.name}</h2>
                <p class="video-date" style="">${course.teacherName}<em><fmt:formatDate type="date" value="${course.createDate}" /></em></p>
                <div>
                    <video style="width:100%; object-fit: fill"  controls >
                        <source src="${contextPath}/upload/video/${course.videoUrl}" type="video/mp4">
                        <source src="${contextPath}/upload/video/${course.videoUrl}" type="video/ogg">
                        您的浏览器不支持 HTML5 video 标签。
                    </video>
                </div>
                <div style="background: white;">
                    <span>
                        <p style="text-align: right;padding-right:5px">
                            <!-- 学生有参与和收藏的权限 -->
                            <shiro:hasAnyRoles name="学生">
                                <c:if test="${!course.join}">
                                    <a id="a_join_${course.id}" class="video-btn" v-on:click="joinOne('${course.id}')">【参与】</a>
                                </c:if>
                                <c:if test="${course.join}">
                                    <a  class="video-btn" style="cursor: default;color: green;">【已参与】</a>
                                </c:if>
                                 <c:if test="${!course.collect}">
                                    <a id="a_collect_${course.id}" class="video-btn" v-on:click="collectOne('${course.id}')" >【收藏】</a>
                                 </c:if>
                                <c:if test="${course.collect}">
                                    <a class="video-btn" style="cursor: default;color: green;">【已收藏】</a>
                                 </c:if>
                            </shiro:hasAnyRoles>
                            <a class="video-btn" v-on:click="studentList('${course.id}','${course.name}')" >【学生列表】</a>
                            <!-- 老师可以编辑和删除自己的课程 -->
                            <c:if test="${course.teacher == user.uid}">
                                <a class="video-btn" v-on:click="editOne('${course.id}')" >【编辑】</a>
                                <a class="video-btn" v-on:click="deleteOne('${course.id}')" >【删除】</a>
                            </c:if>
                            <c:if test="${course.teacher != user.uid}">
                                <!-- 管理员可以编辑和删除 -->
                                <shiro:hasAnyRoles name="管理员">
                                    <a class="video-btn" v-on:click="editOne('${course.id}')" >【编辑】</a>
                                    <a class="video-btn" v-on:click="deleteOne('${course.id}')" >【删除】</a>
                                </shiro:hasAnyRoles>
                            </c:if>
                        </p>
                        <p class="video-remark" >
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;${course.remark}
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath}/course/view?id=${course.id}" style="color:blue;text-decoration: underline;">更多信息</a>
                        </p>
                    </span>
                </div>
            </div>
            </c:forEach>

            <div id="pager"></div>
        </div>
    </div>
</body>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js" charset="utf-8"></script>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${contextPath}/static/vue/vue.js" charset="utf-8" ></script>
<script src="${contextPath}/static/jquery/jquery.form-3.51.0.js" charset="utf-8"></script>
<script src="${contextPath}/static/base/common.js" charset="utf-8"></script>
<script>
    var pageInfo=${pageInfo};
    <%--var pageInfo={--%>
        <%--pages:"${pageInfo.pages}",--%>
        <%--pageNum:"${pageInfo.pageNum}",--%>
        <%--pageSize:"${pageInfo.pageSize}"--%>
    <%--};--%>

    layui.use(['laypage', 'layer','form','laydate'], function(){
        var $ = layui.jquery,
            form = layui.form(),
            laypage = layui.laypage,
            laydate = layui.laydate,
            layer = layui.layer;

        var start = {
            min: '1099-06-16 23:59:59'
            ,max: "${courseSearch.endDate}"?"${courseSearch.endDate}":laydate.now()
            ,istoday: false
            ,choose: function(datas){
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
        var end = {
            min: "${courseSearch.startDate}"?"${courseSearch.startDate}":'1099-06-16 23:59:59'
            ,max: laydate.now()
            ,istoday: false
            ,choose: function(datas){
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        document.getElementById('startDate').onclick = function(){
            start.elem = this;
            laydate(start);
        }
        document.getElementById('endDate').onclick = function(){
            end.elem = this
            laydate(end);
        }

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

    var courseList = new Vue({
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
            deleteOne: function (id) {
                layer.confirm('确定删除该课程吗？', {
                    btn: ['确定', '取消']
                }, function(index, layero){
                    //确定
                    deleteCourse(id);
                }, function(index){
                    //取消
                });
            },
            studentList:function(id,name){
                studentList(id,name);
            }
        }
    });

    /**
     * 搜索
     */
    function searchCourse(){
        location.href="${contextPath}/course/list?"+decodeURIComponent($("#form").serialize()+"&"+$.param(getPager()));
    }

    /**
     * 参加课程
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
                layer.msg(data.message);
                $("#a_join_"+id).hide();
            },
            error:function(data){
                console.error(data);
            }
        });
    }

    /**
     * 收藏课程
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
                layer.msg(data.message);
                $("#a_collect_"+id).hide();
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
                            location.href="${contextPath}/course/list?"+$.param(getPager());
                        }
                    });
                }else{
                    layer.msg(data.message);
                }
            }
        });
    }

    /**
     *  参与学生
     */
    function studentList(id,name){
        var content = "";
        $.getJSON("${contextPath}/course/students",{ id:id}, function(userList){
            for(var i in userList){
                var user =userList[i];
                content +='<tr><td>'+user.name+'</td><td>'+user.mobile+'</td><td>'+user.totalTime+'分钟</td></tr>';;
            }
            content='<table class="layui-table"><thead><tr><th>姓名</th><th>手机号</th><th>观看总时间</th></tr></thead><tbody>'+content+'</tbody></table>';
            layer.open({
                type: 1,
                title: '课程《'+name+'》的学生列表',
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '550px'], //宽高
                content: content
            });
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
