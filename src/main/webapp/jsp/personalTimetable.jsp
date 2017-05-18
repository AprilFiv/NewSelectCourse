<!--个人课表-->
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
    <!--div class="header">只是试试</div-->
    <jsp:include page="header.jsp"/>
    <div class="maincontainer">
        <div class="tablecontainer">
            <table class="table">
                <thead>
                <tr>
                    <th>&nbsp;</th>
                    <th class="timetablestyle">星期一</th>
                    <th class="timetablestyle">星期二</th>
                    <th class="timetablestyle">星期三</th>
                    <th class="timetablestyle">星期四</th>
                    <th class="timetablestyle">星期五</th>
                    <th class="timetablestyle">星期六</th>
                    <th class="timetablestyle">星期日</th>
                </tr>
                </thead>
                <s:iterator value = "#session.selected" var="d" status="st">
                <tbody>
                <tr>
                    <th>第1节</th>
                     <s:if test='#d.timestart=="a" && #d.timestart!="b" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期一  第1-2节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="a" && #d.timestart=="b" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期一  第1-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
					<s:if test='#d.timestart=="g" && #d.timestart!="h" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期二  第1-2节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="g" && #d.timestart=="h" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期二  第1-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
					<s:if test='#d.timestart=="m" && #d.timestart!="n" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期三  第1-2节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="m" && #d.timestart=="n" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期三  第1-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
                    <s:if test='#d.timestart=="s" && #d.timestart!="t" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期四  第1-2节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="s" && #d.timestart=="t" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期四  第1-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    

					<s:if test='#d.timestart=="y" && #d.timestart!="z" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期五  第1-2节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="y" && #d.timestart=="z" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期五  第1-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
<%--                    <s:if test='#d.timestart=="a" && #d.timestart!="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期六  第1-2节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart=="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期六  第1-4节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    --%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart!="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期日  第1-2节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart=="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期日  第1-4节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
                </tr>
                <tr>
                    <th>第2节</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                <tr>
                    <th>第3节</th>
                     <s:if test='#d.timestart=="b"  && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期一  第3-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                  
                    
					<s:if test='#d.timestart=="h" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期二  第3-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                   
                    
					<s:if test='#d.timestart=="n" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期三  第3-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                   
                    
                    <s:if test='#d.timestart=="t"  && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期四  第3-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                   
                    

					<s:if test='#d.timestart=="z"  && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期五  第3-4节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                   
                    
<%--                    <s:if test='#d.timestart=="a"  && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期六  第3-4节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                   --%>
<%--                    --%>
<%--                    <s:if test='#d.timestart=="a"  && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期日  第3-4节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
                   
                </tr>
                <tr>
                    <th>第4节</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                <tr>
                    <th>第5节</th>
                     <s:if test='#d.timestart=="c" && #d.timestart!="d" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期一  第5-6节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="c" && #d.timestart=="d" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期一  第5-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
					<s:if test='#d.timestart=="i" && #d.timestart!="j" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期二  第5-6节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="i" && #d.timestart=="j" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期二  第5-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
					<s:if test='#d.timestart=="o" && #d.timestart!="p" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期三  第5-6节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="o" && #d.timestart=="p" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期三  第5-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
                    <s:if test='#d.timestart=="u" && #d.timestart!="v" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期四  第5-6节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="u" && #d.timestart=="v" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期四  第5-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    

					<s:if test='#d.timestart=="A" && #d.timestart!="B" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期五  第5-6节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="A" && #d.timestart=="B" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期五  第5-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
<%--                    <s:if test='#d.timestart=="a" && #d.timestart!="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期六  第5-6节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart=="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期六  第5-8节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    --%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart!="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期日  第5-6节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart=="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期日  第5-8节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
                </tr>
                <tr>
                    <th>第6节</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                <tr>
                    <th>第7节</th>
                    <s:if test='#d.timestart=="d"  && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期一  第7-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                  
                    
					<s:if test='#d.timestart=="j" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期二  第7-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                   
                    
					<s:if test='#d.timestart=="p" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期三  第7-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                   
                    
                    <s:if test='#d.timestart=="v"  && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期四  第7-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                   
                    

					<s:if test='#d.timestart=="B"  && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期五  第7-8节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                   
<%--                    --%>
<%--                    <s:if test='#d.timestart=="a"  && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期六  第7-8节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                   --%>
<%--                    --%>
<%--                    <s:if test='#d.timestart=="a"  && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期日  第7-8节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
                   
                </tr>
                <tr>
                    <th>第8节</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                <tr>
                    <th>第9节</th>
                     <s:if test='#d.timestart=="e" && #d.timestart!="f" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期一  第9-10节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="e" && #d.timestart=="f" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期一  第9-11节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
					<s:if test='#d.timestart=="k" && #d.timestart!="l" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期二  第9-10节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="k" && #d.timestart=="l" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期二  第9-11节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
					<s:if test='#d.timestart=="q" && #d.timestart!="r" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期三  第9-10节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="q" && #d.timestart=="r" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期三  第9-11节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
                    <s:if test='#d.timestart=="w" && #d.timestart!="x" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期四  第9-10节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="w" && #d.timestart=="x" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期四  第9-11节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    

					<s:if test='#d.timestart=="C" && #d.timestart!="D" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期五  第9-10节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    <s:if test='#d.timestart=="C" && #d.timestart=="D" && #session.selectedra[#st.index].checked!="lost" '>
                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期五  第9-11节 1-16周  <br/> <s:property value="#d.position" /> </th>
                    </s:if>
                    
<%--                    <s:if test='#d.timestart=="a" && #d.timestart!="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期六  第9-10节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart=="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期六  第9-11节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    --%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart!="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="2"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期日  第9-10节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
<%--                    <s:if test='#d.timestart=="a" && #d.timestart=="b" && #session.selectedra[#st.index].checked!="lost" '>--%>
<%--                    <th rowspan="4"><s:property value="#d.coursename" /> <br/><s:property value="#d.teachername" /> <br/> 星期日  第9-11节 1-16周  <br/> <s:property value="#d.position" /> </th>--%>
<%--                    </s:if>--%>
                </tr>
                <tr>
                    <th>第10节</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                <tr>
                    <th>第11节</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                </tbody>
                </s:iterator>
            </table>
        </div>
    </div>
</div>
</body>
<script src="<%=basePath %>js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath %>js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

</script>
</html>