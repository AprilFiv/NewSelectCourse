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
int totalpoint = (Integer)request.getSession().getAttribute("totalpoint");
long rest = (System.currentTimeMillis()-constant.setTime)/60/1000;
int restpoint;
if (rest<0)
   restpoint = constant.setPoint-totalpoint;
else {
	restpoint = (int) (constant.setPoint-totalpoint-rest);
}
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>厦大选课系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/tablestyle.css"/>
</head>
<body>
    <div class="wrapper">
        <!--div class="header"></div-->
        <jsp:include page="header.jsp"/>
        <div class="maincontainer">
            <div class="subnav">
                <ul>
                    <li><a href="selectAlready_main.jsp?style=3">已选课程</a></li>
                    <li><a href="selectAlready_lose.jsp?style=3">落选课程</a></li>
                    <li><a href="selectAlready_ra.jsp?style=3" class="navactive">资源分配</a></li>
                </ul>
                <div class="triangle"></div>
            </div>
             <div class="pointCount">您当前剩余的资源数:<span style="color:red" id="restpoint"><%=restpoint %></span>点</div>
             <input type="hidden" value="<%=rest%>" id="pointparam"/>
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
                        <th class="middlestyle">查看资源排位</th>
                        <th class="longstyle">资源分配</th>
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
                        <td><button type="button" class="btn btn-default btn-xs" onclick="javascript:ranked('<s:property value="#d.coursename"/>',<s:property value="#d.courseid"/>);">查看</button></td>
                        <td>
                            <form action="">
                                <div class="input-group spinner">
                                    <input type="text" class="inputstyle" value="<s:property value="#session.selectedra[#st.index].resource"/>">
                                    <div class="input-group-btn-vertical">
                                        <button class="btn btn-default" type="button" onclick="javascript:decrease(<s:property value="#st.index"/>);"></button>
                                        <button class="btn btn-default" type="button" onclick="javascript:plus(<s:property value="#st.index"/>);"></button>
                                    </div>
                                    <button type="submit" class="btn btn-default btn-xs submitstyle" onclick="javascript:submitchange(<s:property value="#session.selectedra[#st.index].resource"/>,<s:property value="#d.courseid"/>,<%=num %>,<s:property value="#st.index"/>);">提交</button>
                                </div>
                            </form>
                        </td>
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
                            <p>课程名称：<span id = "coursename">需求分析</span></p>
<%--                            <p>上课教师：<span>XXX</span></p>--%>
<%--                            <p>上课时间：<span>XXXXXXXXXXXX</span></p>--%>
<%--                            <p>上课地点：<span>XXXXXXXXXXXX</span></p>--%>
                        </div>
                        <div class="modal-body">
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <th>资源排位</th>
                                    <th>资源分配数</th>
                                </tr>
                                </thead>
                                <tbody id = "detailrank">
                               
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
                    <!--只要给按钮加上这个属性，就是禁用的了-->
                    <button type="button" class="btn btn-default" disabled="disabled">下一页</button>
                    <button type="button" class="btn btn-default">尾页</button>
                    直接跳到第<input type="text" class="form-control">页 <button type="submit" class="btn btn-default">跳转</button>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="../js/jquery-3.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
   	function plus(index){
		var c =parseInt(index);
   		var d = $('.inputstyle').eq(c).attr("value");
   		 $('.inputstyle').eq(c).attr("value",parseInt(d,10)+1);
   	}
   	function decrease(index){
		var c =parseInt(index);
   		var d = $('.inputstyle').eq(c).attr("value");
   		if (d!=0)
   		 $('.inputstyle').eq(c).attr("value",parseInt(d,10)-1);
   	}
</script> 	

<script type="text/javascript">
   	function submitchange(originre,courseid,num,index){
   		var c =parseInt(index);
   		var d = $('.inputstyle').eq(c).val();
   		$.ajax({
            url:"arrange.action",
            data:{
            	 "courseid" : courseid+"",	
                 "student_num" :num+"",
                 "resource" :d+"",
                 "originre" :originre+""
            },
            type:"POST",
            dataType:"json",
            async: false,
            success:function(data) {
            	if (data==1){
                  alert("分配成功");
                  history.go(0);
            	}
            	if (data==2){
            		alert("点数不够啊~~~")
            		history.go(0);
            	}
            },
            error:function(){
            	alert("服务器好像抽风了……!!!∑(ﾟДﾟノ)ノ");
            }
             
        });
   	}
</script>
<script type="text/javascript">
	function ranked(name,id){
		$('#myModal').modal('show');
		$('#coursename').html(name);
		
		$.ajax({
            url:"rank.action",
            data:{
            	 "courseid" : id+""
            },
            type:"POST",
            dataType:"json",
            async: false,
            success:function(data) {
            	$('#detailrank').html(" ");
            	for(var i=data.length-1; i>=0; i--){
            		$('#detailrank').append(" <tr><td>"+(parseInt(i)+1)+"</td><td>"+data[data.length-i-1].resource+"</td></tr>");
                }   
            },
            error:function(){
            	alert("服务器好像抽风了……!!!∑(ﾟДﾟノ)ノ");
            }
             
        });
	}
</script>
<script type="text/javascript">
window.onload = function() {

	if ($('#pointparam').val()>0){
	window.setInterval(cut, 1000);
	function cut(){
		var c = $('#restpoint').html();
		c = parseInt(c,10);
		$('#restpoint').html(c-1);
	}
	}
}
</script>
</html>