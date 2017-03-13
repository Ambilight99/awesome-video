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
</head>
<body>
<%@include file="/WEB-INF/view/leftMenu.jsp" %>
<div class="layui-body layui-tab-content site-demo site-demo-body">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>课程添加</legend>
    </fieldset>
    <form id="form" class="layui-form" action="">
        <input type="hidden" name="uid" value="${course.id}" >
        <div class="layui-form-item">
            <label class="layui-form-label">课程名</label>
            <div class="layui-input-block">
                <input type="text" name="username" value="${course.username}"  required  lay-verify="required"
                       placeholder="请输入账号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程代号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" value="${course.password}"  required lay-verify="required"
                       placeholder="请输入课程代号" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">辅助文字</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属专业</label>
            <div class="layui-input-block">
                <select name="major" lay-verify="required" value="${user.major}">
                    <option value=""></option>
                    <option value="理学" ${course.profession=='理学'?'selected':''} >理学</option>
                    <option value="工学" ${course.profession=='工学'?'selected':''} >工学</option>
                    <option value="农学" ${course.profession=='农学'?'selected':''} >农学</option>
                    <option value="医学" ${course.profession=='医学'?'selected':''} >医学</option>
                    <option value="艺术学" ${course.profession=='艺术学'?'selected':''} >艺术学</option>
                </select>
            </div>
        </div>
        <div>
            <label class="layui-form-label">视频上传</label>
            <div class="layui-input-block">
                <input type="hidden" id="videoUrl" name="videoUrl" value="${course.videoUrl}"  required  lay-verify="required"
                         autocomplete="off" class="layui-input">
            </div>
            <!--dom结构部分-->
            <div id="uploader-demo">
                <!--用来存放item-->
                <div id="fileList" class="uploader-list"></div>
                <div id="upInfo" ></div>
                <div id="filePicker">选择文件</div>
                <input type="button" id="btn" value="开始上传">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">课程内容</label>
            <div class="layui-input-block">
                <textarea name="content" value="${course.content}" placeholder="请输入内容" class="layui-textarea"></textarea>
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
            $list = $('#fileList'),
            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,
            // 缩略图大小
            thumbnailWidth = 100 * ratio,
            thumbnailHeight = 100 * ratio,
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
                id:'#filePicker',  //选择文件的按钮
                multiple:true     //允许可以同时选择多个图片
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
            var $li = $(
                    '<div id="' + file.id + '" class="file-item thumbnail">' +
                    '<img>' +
                    '<div class="info">' + file.name + '</div>' +
                    '</div>'
                ),
                $img = $li.find('img');

            // $list为容器jQuery实例
            $list.append( $li );

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr( 'src', src );
            }, thumbnailWidth, thumbnailHeight );
        });

        // 文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                $percent = $li.find('.progress span');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<p class="progress"><span></span></p>')
                    .appendTo( $li )
                    .find('span');
            }

            $percent.css( 'width', percentage * 100 + '%' );
        });

        // 文件上传成功时候触发，给item添加成功class, 用样式标记上传成功。 file：文件对象，    response：服务器返回数据
        uploader.on( 'uploadSuccess', function( file,response) {
            console.log(response);
            $( '#'+file.id ).addClass('upload-state-done');
            //console.info(response);
            var result = JSON.parse(response._raw);
            $("#upInfo").html("<font color='red'>"+result.status+"</font>");
            $("#videoUrl").val(result.message);
        });

        // 文件上传失败                                file:文件对象 ， code：出错代码
        uploader.on( 'uploadError', function(file,code) {
            var $li = $( '#'+file.id ),
                $error = $li.find('div.error');

            // 避免重复创建
            if ( !$error.length ) {
                $error = $('<div class="error"></div>').appendTo( $li );
            }

            $error.text('上传失败!');
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
