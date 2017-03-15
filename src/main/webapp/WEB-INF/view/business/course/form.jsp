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
    <title>课程管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${contextPath}/static/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="${contextPath}/static/webuploader-0.1.5/webuploader.css" />
    <style>
        .webuploader-pick{
             background: #1E9FFF;
             padding:0px 0px;
        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/view/leftMenu.jsp" %>
<div class="layui-body layui-tab-content site-demo site-demo-body">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>课程添加</legend>
    </fieldset>
    <form id="form" class="layui-form" action="">
        <input type="hidden" name="id" value="${course.id}" >
        <div class="layui-form-item">
            <label class="layui-form-label">课程名</label>
            <div class="layui-input-block">
                <input type="text" name="name" value="${course.name}"  required  lay-verify="required"
                       placeholder="请输入账号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程代号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" value="${course.code}"  required lay-verify="required"
                       placeholder="请输入课程代号" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">辅助文字</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属专业</label>
            <div class="layui-input-block">
                <select name="profession" lay-verify="required" value="${course.profession}">
                    <option value=""></option>
                    <option value="理学" ${course.profession=='理学'?'selected':''} >理学</option>
                    <option value="工学" ${course.profession=='工学'?'selected':''} >工学</option>
                    <option value="农学" ${course.profession=='农学'?'selected':''} >农学</option>
                    <option value="医学" ${course.profession=='医学'?'selected':''} >医学</option>
                    <option value="艺术学" ${course.profession=='艺术学'?'selected':''} >艺术学</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程简介</label>
            <div class="layui-input-block">
                <input type="text" name="remark" value="${course.remark}"  required  lay-verify="required" maxlength="100"
                       placeholder="请输入课程简介" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div>
            <label class="layui-form-label">视频上传</label>
            <div class="layui-input-block">
                <input type="text" id="videoName" name="videoName" value="${course.videoName}"  required  lay-verify="required"
                         autocomplete="off" class="layui-input">
                <input type="hidden" id="videoUrl" name="videoUrl" value="${course.videoUrl}"  required  lay-verify="required"
                       autocomplete="off" class="layui-input">
                <input type="hidden" id="imageUrl" name="imageUrl" value="${course.imageUrl}"  required  lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="progress layui-input-block " style="display:none">
                <div class="progress-bar" style="float:left;height:15px;background:mediumblue;width: 0%" ></div>
                <div style="float:left"></div>
            </div>
            <!--dom结构部分-->
            <div class="layui-input-block">
                <div id="upInfo" ></div>
                <a class="layui-btn layui-btn-normal layui-btn-radius" id="filePicker">选择文件</a>
                <a class="layui-btn layui-btn-normal layui-btn-radius"  id="btn">开始上传</a>
            </div>
        </div>
        <br/>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">课程内容</label>
            <div class="layui-input-block">
                <textarea name="content"  placeholder="请输入内容" class="layui-textarea">${course.content}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <a class="layui-btn" v-on:click="submit" >立即提交</a>
                <a class="layui-btn layui-btn-primary"  v-on:click="reset">重置</a>
            </div>
        </div>
    </form>
</div>
</body>
<script src="${contextPath}/static/jquery/jquery-1.11.3.js" charset="utf-8"></script>
<script src="${contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${contextPath}/static/vue/vue.js" charset="utf-8" ></script>
<script src="${contextPath}/static/jquery/jquery.form-3.51.0.js" charset="utf-8"></script>
<script src="${contextPath}/static/webuploader-0.1.5/webuploader.js"></script>
<script>
    var pager = ${pager};
    var user =${course};

    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form()
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //自定义验证规则
        form.verify({
            username: function(value){
                if(value.length < 5){
                    return '用户名至少得5个字符啊';
                }
            }
            ,password: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){

            }
        });
    });


    var form = new Vue({
        el: '#form',
        //data: user,
        // 在 `methods` 对象中定义方法
        methods: {
            submit: function (event) {
                $(":submit",this).attr("disabled","disabled");
                formSubmit();
                $(":submit",this).removeAttr("disabled");
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
            url:"${contextPath}/course/saveOrUpdate",
            type:"post",
            dataType:"json",
            beforeSubmit:function(data){
                console.log(data);
            },
            success:function(data){
                if(data.status=="success"){
                    layer.msg(data.message,{
                        time:1000,
                        end:function(){
                            location.href="${contextPath}/course/list?"+$.param(pager);
                        }
                    });
                }else{
                    layer.msg(data.message);
                }
            }
        });
    }
</script>

<script>
    var basePath="${contextPath}/static/webuploader-0.1.5/";
    // 图片上传demo
    jQuery(function() {
        var $ = jQuery,
            // Web Uploader实例
            uploader;
        // 初始化Web Uploader
        uploader = WebUploader.create({
            // 自动上传。
            auto: false,
            // swf文件路径
            swf:'${contextPath}/static/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: '${contextPath}/course/videoUpload',
            threads:'5',        //同时运行5个线程传输
            fileNumLimit:'10',  //文件总数量只能选择10个
            method: 'POST',
            //  fileSizeLimit: 1024MB,
            // 选择文件的按钮。可选。
            pick: {
                id:'#filePicker'      //选择文件的按钮
                //,multiple:true     //允许可以同时选择多个图片
            },
            // 图片质量，只有type为`image/jpeg`的时候才有效。
            quality: 90,

            //限制传输文件类型，accept可以不写
//            accept: {
//                title: 'Images',//描述
//                extensions: 'gif,jpg,jpeg,bmp,png,zip',//类型
//                mimeTypes: 'image/*'//mime类型
//            }
        });


        // 当有文件添加进来的时候，创建img显示缩略图使用
        uploader.on( 'fileQueued', function( file ) {
            $("#videoName").val(file.name);
        });

        // 文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
        uploader.on( 'uploadProgress', function( file, percentage ) {
           if($(".progress ").css("display")=="none"){
               $(".progress ").css("display","block");
           }
           if( $(".progress-bar").css("display")=="none"){
                $(".progress-bar").css("display","block");
            }

            var percentage=Math.ceil(percentage * 100 );
            $(".progress-bar").css( 'width',percentage+ '%' ).next().html(percentage+"%");
            if(percentage==100){
                $(".progress-bar").next().html("<span style='color:green'>上传成功<span>");
                $(".progress-bar").hide();
            }

        });

        // 文件上传成功时候触发，给item添加成功class, 用样式标记上传成功。 file：文件对象，    response：服务器返回数据
        uploader.on( 'uploadSuccess', function( file,response) {
            console.log(response);
            $( '#'+file.id ).addClass('upload-state-done');
            //console.info(response);
            var result = JSON.parse(response._raw);
            if(result.status == "success"){
                layer.msg("上传成功！");
                var resultData =JSON.parse(result.data);
                $("#videoUrl").val(resultData.videoUrl);
                $("#imageUrl").val(resultData.imageUrl);
            }else{
                layer.error("上传失败！");
            }
        });

        // 文件上传失败
        uploader.on( 'uploadError', function(file,code) {
            layer.error("上传失败！");
        });

        // 不管成功或者失败，文件上传完成时触发。 file： 文件对象
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress').remove();
        });

        //绑定提交事件
        $("#btn").click(function() {
            console.log("上传...");
            uploader.upload();   //执行手动提交
            console.log("上传成功");
        });

    });
</script>
</html>
