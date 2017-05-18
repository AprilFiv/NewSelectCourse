<!-- 登录页面 -->
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
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/loginstyle.css"/>
    <script src="<%=basePath %>js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=basePath %>js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://s.hqbcdn.com/??lib/jquery/jquery-1.7.2.min.js,lib/jquery/jquery.cookie.js?t=20130813"></script>
</head>
<body>
<div class="wrapper">
    <div class="headerwrapper">
        <div class="headerbar">
            <div class="logo"><img src="image/clogo.png"></div>
        </div>
    </div>
    <div class="logincontainer">
        <div class="loginbar">
            <form class="form-horizontal" role="form" action="login.action" method="post">
                <div class="form-group">
                    <label for="username" class="control-label">用户名：</label>
                    <input type="text" class="form-control" name="student_num" id="username" onkeyup="validate()" placeholder="请输入用户名">
                </div>
                <div class="form-group">
                    <label for="password" class="control-label">密码：</label>
                    <input type="password" class="form-control" name="student_pass" id="password" onkeyup="validate()" placeholder="请输入密码">
                </div>
                <div class="form-group verinput">
                    <label for="vertify" class="control-label">验证码：</label>
                    <input type="text" class="form-control" id="vertify" onkeyup="validate()">
                    <div class="verimage"><a href="javascript:reload();"><img alt="验证码" src="image.action" id="vertifypic"></a></div>
                </div>
                  <div class="checkbox checkstyle">
                    <label>
                        <input type="checkbox" name="rememberme" id="rememberme"><span>自动登录</span>
                    </label>
                </div><br>
                <div>
                <button type="button" class="btn btn-default positionstyle" onclick="loginCheck()" id="loginBtn">登录</button>
                <button type="reset" class="btn btn-default">重置</button>
                </div>
                <div id="atteninfo"><p></p></div>
            </form>
        </div>
        <div class="scinfo">
            <h4>选课须知</h4><hr>
            <p>1. 选课前请务必仔细阅读选课规则和选课使用帮助。</p>
            <p>2. 本选课系统使用统一身份认证的用户名和密码,密码规则详见http://i.xmu.edu.cn/的登录密码公告（与学工系统的登录密码一致）。
                如果密码不对，请带学生证到一卡通中心重置密码；</p>
            <p>3. 选课结束后，请点击选课界面右上方的“退出登录”或者关闭所有浏览器窗口，以免后面的同学篡改您的选课结果。</p>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function validate() {
        var username = document.getElementById("username").value;
        var pw = document.getElementById("password").value;
        var ver =document.getElementById("vertify").value;
        if(username == "" || username == null) {
            document.getElementById("atteninfo").innerHTML="用户名空着(｡･ω･｡)";
            document.getElementById("submit").disabled = false;
        }
        if(pw== "" || pw == null) {
            document.getElementById("atteninfo").innerHTML="密码空着(｀・ω・´)";
            document.getElementById("submit").disabled = false;
        }
        if(ver == "" || ver == null) {
            document.getElementById("atteninfo").innerHTML="验证码空着( • ̀ω•́ )✧";
            document.getElementById("submit").disabled = false;
        }
    }
</script>
<script type="text/javascript">
	function loginCheck(){
		var usernametest = /^[0-9]{14,14}$/;
		var passwordtest = /^[0-9]{6,6}$/;
        var username = document.getElementById("username").value;
        var pw = document.getElementById("password").value;
        var ver =document.getElementById("vertify").value;
        var checkcode = $('#vertify').val();
        var remem = $("input[type='checkbox']").is(':checked')
        if (!usernametest.test(username)){
        	 document.getElementById("atteninfo").innerHTML="学号是14位哦(；´д｀)ゞ";
        }
        else if (!passwordtest.test(pw)){
        	 document.getElementById("atteninfo").innerHTML="密码是6位哦(；´д｀)ゞ";
        }
        else{
        	$.ajax({
                url:"login.action",
                data:{
                     "student_num" : username+"",
                     "student_pass" : pw+"", 
                     "checkcode" :　checkcode+"",
                     "rememberme" : remem	
                },
                type:"POST",
                dataType:"json",
                async: false,
                success:function(data) {
                	if (data==1){
                		 window.location.href="<%=basePath%>displaypubliccourse.action?currPage=1";
                	}
                	else if (data==2){
                		document.getElementById("atteninfo").innerHTML="验证码错了啦(ಥ_ಥ) ";
                	}
                	else if (data==3){
                		document.getElementById("atteninfo").innerHTML="学号或者密码错了啦(ಥ_ಥ) ";
                	}
                     
                },
                error:function(){
                	document.getElementById("atteninfo").innerHTML="服务器好像抽风了……!!!∑(ﾟДﾟノ)ノ";
            }
                 
            });
        }
        
	}
</script>
<script type="text/javascript">
	window.onload = function() {
       var num = $.cookie("student_num");
       var pass = $.cookie("student_pass");
       var code = $.cookie("checkcode");
       if (num && pass){
    	   $('#username').attr("value",num);
	       $('#password').attr("value",pass);
	       $('#vertify').attr("value",code);
	       $('#rememberme').attr("checked","checked");
	       $('#loginBtn').click();
       }
    }
</script>
<script type="text/javascript">
    function reload(){ 
		$('#vertifypic').attr("src","image.action?"+Math.random());
	}
</script>
</html>
