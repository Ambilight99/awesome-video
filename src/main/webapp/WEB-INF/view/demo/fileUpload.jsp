<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("contextPath", request.getContextPath());//page域
%>
<!doctype html>
<html>
<head>
    <title>文件上传</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/static/webuploader-0.1.5/webuploader.css" />
</head><body>

<h3>图片上传</h3>
<!--dom结构部分-->
<div id="uploader-demo">
    <!--用来存放item-->
    <div id="fileList" class="uploader-list"></div>
    <div id="upInfo" ></div>
    <div id="filePicker">选择文件</div>
</div>
<input type="button" id="btn" value="开始上传">
<!--上传框结束-->
<script src="${contextPath}/static/jquery/jquery-1.11.3.js"></script>
<script src="${contextPath}/static/webuploader-0.1.5/webuploader.js"></script>
<script>
    var basePath="${contextPath}/static/webuploader-0.1.5/";
</script>
<script>
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
            server: '${contextPath}/upload/uploadFile',
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
            $("#upInfo").html("<font color='red'>"+response._raw+"</font>");
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
</body>
</html>
