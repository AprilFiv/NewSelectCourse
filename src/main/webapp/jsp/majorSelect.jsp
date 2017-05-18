<!--主修选课部分的样式-->
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
                <li><a href="#">院系必修课</a></li>
                <li><a href="#">全校性必修课</a></li>
                <li><a href="#" >院系选修课</a></li>
                <li><a href="#">全校性选修课</a></li>
                <li><a href="#" class="navactive">公共课</a></li>
            </ul>
        </div>
        <div class="triangle"></div>
        <div class="tablecontainer">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>课程类别</th>
                    <th class="shortstyle">课程性质</th>
                    <th>课程</th>
                    <th>班级</th>
                    <th>开课系</th>
                    <th>学分</th>
                    <th class="longstyle">上课时间</th>
                    <th>上课地点</th>
                    <th>上课教师</th>
                    <th>可选/已选</th>
                    <th>冲突情况</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="list" var="d">
                <tr>
                    <td><s:property value="#d.coursetype"/></td>
                    <td><s:property value="#d.courseidentity"/></td>
                    <td><s:property value="#d.coursename"/></td>
                    <td><s:property value="#d.classnum"/></td>
                    <td><s:property value="#d.department"/></td>
                    <td><s:property value="#d.credit"/></td>
                    <td><s:property value="#d.timestart"/></td>
                    <td><s:property value="#d.position"/></td>
                    <td><s:property value="#d.teachername"/></td>
                    <td><s:property value="#d.enableornot"/></td>
                    <td><s:property value="#d.crush"/></td>
                    <td><button type="button" class="btn btn-default btn-xs" onclick="javascript:select(<s:property value="#d.courseid"/>,<%=num%>);">选课</button></td>
                </tr>
                </s:iterator>
                 <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4>选课提示</h4>

                    </div>
                    <div class="modal-body">
                        <p>你确定选此课程班级吗？</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default sured" >确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
                
                </tbody>
            </table>
        </div>
          <div class="footfather">
            <form class="footatten">
                共<span id="sum"><s:property value="totalCount"/></span>条记录 每页<s:property value="pageSize"/>条 当前第<span id="cur"><s:property value="currPage"/></span>页/共<span id="total"><s:property value="totalPage"/></span>页
                
                <button type="button" class="btn btn-default" onclick="homepage()">首页</button>
                <button type="button" class="btn btn-default" onclick="prepage()"/>上一页</button>
                <button type="button" class="btn btn-default" onclick="nextpage()"/>下一页</button>
                <button type="button" class="btn btn-default" onclick="lastpage()"/>尾页</button>
               
                直接跳到第<input type="text" class="form-control" id="jumppage">页 <button type="button"  class="btn btn-default" onclick="jump()">跳转</button>
                 <div id="atteninfo"><p></p></div>
            </form>
        </div>
    </div>
</div>
</body>
<script src="<%=basePath %>js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath %>js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function jump(){
		var page = $('#jumppage').val();
		var totalpage = ${totalPage};
		if (page>totalpage){
			 document.getElementById("atteninfo").innerHTML="亲，再怎么找也找不到您要那的页了o(╥﹏╥)o";
		}
		else if (page<1){
			 document.getElementById("atteninfo").innerHTML="亲，再怎么找也找不到您要那的页了o(╥﹏╥)o";
		}
		else{
			window.location.href="displaypubliccourse.action?currPage="+page;
		}
	}
	function homepage(){
		if( ${currPage}==1){
			document.getElementById("atteninfo").innerHTML="现在就是首页了(￣▽￣)~*";
		}
		else{
			window.location.href="displaypubliccourse.action?currPage=1";
		}
	}
	function prepage(){
		if( ${currPage}==1){
			document.getElementById("atteninfo").innerHTML="现在就是首页了(￣▽￣)~*";
		}
		else{
			window.location.href="displaypubliccourse.action?currPage="+${currPage}-1;
		}
	}
	function nextpage(){
		if( ${currPage}==${totalPage}){
			document.getElementById("atteninfo").innerHTML="现在就是尾页了(￣▽￣)~*";
		}
		else{
			window.location.href="displaypubliccourse.action?currPage="+${currPage}+1;
		}
	}
	function lastpage(){
		if( ${currPage}==${totalPage}){
			document.getElementById("atteninfo").innerHTML="现在就是尾页了(￣▽￣)~*";
		}
		else{
			window.location.href="displaypubliccourse.action?currPage="+${totalPage};
		}
	}
</script>
<script type="text/javascript">

	function select(courseid,student_num){
		
		$('#myModal').modal('show');
		$('.sured').one("click",function(){
			$.ajax({
	            url:"select.action",
	            data:{
	            	 "courseid" : courseid+"",	
	                 "student_num" :student_num+""
	            },
	            type:"POST",
	            dataType:"json",
	            async: false,
	            success:function(data) {
	                  alert("选课成功");
	                  history.go(0) 
	            },
	            error:function(){
	            	alert("服务器好像抽风了……!!!∑(ﾟДﾟノ)ノ");
	        }
	             
	        });
		});
	
		
	}	
		

</script>
</html>