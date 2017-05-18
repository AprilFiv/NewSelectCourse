<!--已选课程下的资源分配页-->
<%@page import="com.xmu.domain.StudentInfo"%>
<%@page import="com.xmu.util.constant"%>
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
Integer whetheredit = System.currentTimeMillis()>constant.endTime?0:1;
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
       <input type="hidden" value="<%=whetheredit%>" id="whetheredit"/>
    <div class="maincontainer">
        <div class="subnav">
            <ul>
                <li><a href="selectAlready_main.jsp?style=3" class="navactive">已选课程</a></li>
                <li><a href="selectAlready_lose.jsp?style=3">落选课程</a></li>
                <li><a href="selectAlready_ra.jsp?style=3">资源分配</a></li>
            </ul>
            <div class="triangle"></div>
        </div>
        <div class="tablecontainer">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="shortstyle" >修读性质</th>
                    <th>课程类别</th>
                    <th class="shortstyle">课程性质</th>
                    <th>课程代码</th>
                    <th>课程名称</th>
                    <th>学分</th>
                    <th>校区</th>
                    <th class="longstyle">上课时间</th>
                    <th>上课地点</th>
                    <th>上课教师</th>
                    <th class="shortstyle">选课状态</th>
                    <th class="shortstyle">是否重修</th>
                    <th class="middlestyle">操作</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="#session.selected" var="d" status="st"> 
                <tr>
                    <td>主修</td>
                    <td><s:property value="#d.coursetype"/></td>
                    <td><s:property value="#d.courseidentity"/></td>
                     <td><s:property value="#d.courseid"/></td>
                    <td><s:property value="#d.coursename"/></td>
               
                    <td><s:property value="#d.credit"/></td>
                    <td><s:property value="#d.area"/></td>
                    <td><s:if test='#d.timestart=="a" '>星期一  第1-2节 1-16周</s:if>
                    	<s:if test='#d.timestart=="b" '>星期一  第3-4节 1-16周</s:if>
                    	<s:if test='#d.timestart=="c" '>星期一  第5-6节 1-16周</s:if>
                    	<s:if test='#d.timestart=="d" '>星期一  第7-8节 1-16周</s:if>
                    	<s:if test='#d.timestart=="e" '>星期一  第9-10节 1-16周</s:if>
                    	<s:if test='#d.timestart=="ef" '>星期一  第9-11节 1-16周</s:if>
                        <s:if test='#d.timestart=="g" '>星期二  第1-2节 1-16周</s:if>
                    	<s:if test='#d.timestart=="h" '>星期二  第3-4节 1-16周</s:if>
                    	<s:if test='#d.timestart=="i" '>星期二  第5-6节 1-16周</s:if>
                    	<s:if test='#d.timestart=="j" '>星期二  第7-8节 1-16周</s:if>
                    	<s:if test='#d.timestart=="k" '>星期二  第9-10节 1-16周</s:if></td>
                    <td><s:property value="#d.position"/></td>
                    <td><s:property value="#d.teachername"/></td>
                 <td><s:property value="#session.selectedra[#st.index].checked"/></td>
                    <td>否</td>
                    <td><button type="button" class="btn btn-default btn-xs"  onclick="javascript:drop(<s:property value="#d.courseid"/>,<%=num%>,<s:property value="#session.selectedra[#st.index].resource"/>,'<s:property value="#d.timestart"/>');">退选</button></td>
                </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4>选课提示</h4>

                    </div>
                    <div class="modal-body">
                        <p>你确定退选此课程班级吗？</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default sured" >确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
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
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

	function drop(courseid,student_num,resource,timestart){
		var whetheredit = $('#whetheredit').val();
		if (whetheredit==1){
		$('#myModal').modal('show');
		$('.sured').one("click",function(){
			$.ajax({
	            url:"drop.action",
	            data:{
	            	 "courseid" : courseid+"",	
	                 "student_num" :student_num+"",
	                 "resource" :resource+"",
	                 "timestart":timestart+""
	            },
	            type:"POST",
	            dataType:"json",
	            async: false,
	            success:function(data) {
	                  alert("退课成功");
	                  history.go(0) 
	            },
	            error:function(){
	            	alert("服务器好像抽风了……!!!∑(ﾟДﾟノ)ノ");
	       		}
	             
	        });
		});
	
		}
		else {
			alert("退课时间已过");
		}
	}	
		

</script>
</html>