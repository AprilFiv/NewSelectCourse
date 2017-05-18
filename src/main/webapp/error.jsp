<!-- 通配错误界面 -->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>404 error page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<%=basePath %>css/pnfstyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<!-----start-wrap--------->
<div class="wrap">
    <!-----start-content--------->
    <div class="content">
        <!-----start-logo--------->
        <div class="logo">
            <h1><a href="#"><img src="<%=basePath %>image/logo404.png"/></a></h1>
            <span><img src="<%=basePath %>image/signal.png"/>哎哟糟糕！找不到页面了亲~</span>
        </div>
        <!-----end-logo--------->
        <!-----start-search-bar-section--------->
        <div class="buttom">
            <div class="seach_bar">
                <p>点击 <span><a href="<%=basePath %>index.jsp">这里</a></span> 返回登录</p>
                <!-----start-sear-box--------->
            </div>
        </div>
        <!-----end-sear-bar--------->
    </div>
    <!----copy-right-------------->
</div>

<!---------end-wrap---------->
</body>
