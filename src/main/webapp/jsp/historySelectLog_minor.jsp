<!--历史选课记录下的辅修选课-->
<%@page import="com.xmu.domain.StudentInfo"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
StudentInfo studentInfo = (StudentInfo)request.getSession().getAttribute("studentinfo");
String area = studentInfo.getArea();
String num = studentInfo.getStudent_num();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>厦大选课系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/tablestyle.css"/>
</head>
<body>
<div class="wrapper">
    <!--div class="header"></div-->
    <jsp:include page="header.jsp"/>
    <div class="maincontainer">
        <div class="subnav">
            <ul>
                <li><a href="#">主修课程</a></li>
                <li><a href="#" class="navactive">辅修课程</a></li>
            </ul>
            <div class="triangle"></div>
        </div>
        <div class="tablecontainer">
            <div class="select-style">
                <form role="form">
                    <div class="form-group select">
                        <label for="semester" class="control-label">学年学期</label>
                        <select class="form-control " id="semester">
                            <option>----请选择学年学期----</option>
                            <option>2016-2017学年 第一学期</option>
                            <option>2016-2017学年 第二学期</option>
                            <option>2016-2017学年 第三学期</option>
                        </select>
                    </div>
                </form>
            </div>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>学年学期</th>
                    <th>课程代码</th>
                    <th>课程名称</th>
                    <th>学分</th>
                    <th>课程类别</th>
                    <th>课程性质</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>2016-2017学年 第一学期</th>
                    <th>130010010212</th>
                    <th>跨界•对话</th>
                    <th>2</th>
                    <th>通识教育</th>
                    <th>选修</th>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="footfather">
            <form class="footatten">
                共<span id="sum"></span>条记录 每页20条 当前第<span id="cur"></span>页/共<span id="total"></span>页
                <button type="button" class="btn btn-default">首页</button>
                <button type="button" class="btn btn-default">上一页</button>
                <button type="button" class="btn btn-default">下一页</button>
                <button type="button" class="btn btn-default">尾页</button>
                直接跳到第<input type="text" class="form-control">页 <button type="submit" class="btn btn-default">跳转</button>
            </form>
        </div>
    </div>
</div>
</body>
<script src="<%=basePath %>js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath %>js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

</script>
</html>