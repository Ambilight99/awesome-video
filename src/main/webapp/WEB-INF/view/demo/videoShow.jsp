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
</head>
<body>
    <video width="320" height="240" controls>
        <source src="/awesome/static/33.mp4" type="video/mp4">
        <source src="/awesome/static/33.mp4" type="video/ogg">
        您的浏览器不支持 HTML5 video 标签。
    </video>
</body>
</html>
