<!--主修选课部分的样式-->
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
                <li><a href="displayyescollegecourse.action?currPage=1">院系必修课</a></li>
                <li><a href="displayyesschoolcourse.action?currPage=1">全校性必修课</a></li>
                <li><a href="displaynocollegecourse.action?currPage=1" >院系选修课</a></li>
                <li><a href="#"  class="navactive">全校性选修课</a></li>
                <li><a href="displaypubliccourse.action?currPage=1">公共课</a></li>
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
                <s:iterator value="list" var="d" status="st">
                <tr>
                    <td><s:property value="#d.coursetype"/></td>
                    <td><s:property value="#d.courseidentity"/></td>
                    <td><s:property value="#d.coursename"/></td>
                    <td><s:property value="#d.classnum"/></td>
                    <td><s:property value="#d.department"/></td>
                    <td><s:property value="#d.credit"/></td>
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
                    <td><s:property value="#d.enableornot"/>/<s:property value="totalselect[#st.index]"/></td>
                   <td><s:if test="#session.studentinfo.selected.toString().indexOf(#d.timestart.toString())!=-1"><c style="color:red"/>是</s:if><s:else>否</s:else></td>
                    <td><s:if test="#session.studentinfo.selected.toString().indexOf(#d.timestart.toString())!=-1"></s:if><s:else><button type="button" class="btn btn-default btn-xs" onclick="javascript:select(<s:property value="#d.courseid" />,<%=num%>,'<s:property value="#d.timestart" />');">选课</button></s:else></td>
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
			window.location.href="displaynoschoolcourse.action?currPage="+page;
		}
	}
	function homepage(){
		if( ${currPage}==1){
			document.getElementById("atteninfo").innerHTML="现在就是首页了(￣▽￣)~*";
		}
		else{
			window.location.href="displaynoschoolcourse.action?currPage=1";
		}
	}
	function prepage(){
		if( ${currPage}==1){
			document.getElementById("atteninfo").innerHTML="现在就是首页了(￣▽￣)~*";
		}
		else{
			window.location.href="displaynoschoolcourse.action?currPage="+(parseInt(${currPage},10)-1);
		}
	}
	function nextpage(){
		if( ${currPage}==${totalPage}){
			document.getElementById("atteninfo").innerHTML="现在就是尾页了(￣▽￣)~*";
		}
		else{
			window.location.href="displaynoschoolcourse.action?currPage="+(parseInt(${currPage},10)+1);
		}
	}
	function lastpage(){
		if( ${currPage}==${totalPage}){
			document.getElementById("atteninfo").innerHTML="现在就是尾页了(￣▽￣)~*";
		}
		else{
			window.location.href="displaynoschoolcourse.action?currPage="+${totalPage};
		}
	}
</script>
<script type="text/javascript">
function select(courseid,student_num,timestart){
	
	var whetheredit = $('#whetheredit').val();
	if (whetheredit==1){
	$('#myModal').modal('show');
	$('.sured').one("click",function(){
		$.ajax({
            url:"select.action",
            data:{
            	 "courseid" : courseid+"",	
                 "student_num" : student_num+"",
                 "timestart" : timestart+""
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
	else{
		alert("选课时间已过");
	}
	}	
</script>
<script type="text/javascript">
	
</script>
</html>