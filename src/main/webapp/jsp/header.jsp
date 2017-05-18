<!--选课系统的头部-->
<%@page import="com.xmu.domain.StudentInfo"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>厦大选课系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/base.css"/>
    <script src="<%=basePath %>js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<%
StudentInfo studentInfo = (StudentInfo)request.getSession().getAttribute("studentinfo");
String area = studentInfo.getArea();
String num = studentInfo.getStudent_num();
%>
<body>
    <div class="headerwrapper">
        <div class="headerbar">
            <div class="logo"><img src="<%=basePath %>image/clogo.png"></div>
            <div class="background"></div>
            <div class="welcome"><span><%=num %> </span>你好<a href="<%=basePath %>out.action">退出系统</a></div>
            <div class="location">当前选课校区：<span><%=area %></span></div>
            <div class="nav">
                <ul>
                    <li><a id="nav1"  href="" >选课指导</a></li>
                    <li><a id="nav2"  href="<%=basePath%>displaypubliccourse.action?currPage=1">主修选课</a></li>
                    <li><a id="nav3"  href="<%=basePath%>jsp/selectAlready_main.jsp?style=3" >已选课程</a></li>
                    <li><a id="nav4"  href="<%=basePath%>jsp/personalTimetable.jsp?style=4"> 个人课表</a></li>
                    <li><a id="nav5"  href="<%=basePath%>jsp/historySelectLog_major.jsp?style=5"> 历史选课记录</a></li>
                    <input type="hidden" value="<%=request.getParameter("style")%>" id="styleparam"/>

                </ul>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    function activestyle(state){
        var obj=document.getElementById("nav"+state);
        obj.setAttribute("class","navactive");
    }
    var a ;
    
    if ( $('#styleparam').val()==1 ||$('#styleparam').val()==2 ||$('#styleparam').val()==3||$('#styleparam').val()==4||$('#styleparam').val()==5    ){
    	 a = $('#styleparam').val();
    }
    else a =2;
    activestyle(a);
</script>
</html>