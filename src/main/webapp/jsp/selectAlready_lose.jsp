<!--已选课程下的落选课程-->
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>厦大选课系统</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../css/base.css"/>
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../css/tablestyle.css"/>
</head>
<body>
<div class="wrapper">
    <!--div class="header"></div-->
    <jsp:include page="header.jsp"/>
    <div class="maincontainer">
        <div class="subnav">
            <ul>
                <!--li><a href="selectAlready_main.jsp" >已选课程</a></li>
                <li><a href="selectAlready_lose.html" class="navactive">落选课程</a></li>
                <li><a href="selectAlready_ra.html">资源分配</a></li-->
                <li><a href="selectAlready_main.jsp?style=3" >已选课程</a></li>
                <li><a href="selectAlready_lose.jsp?style=3" class="navactive">落选课程</a></li>
                <li><a href="selectAlready_ra.jsp?style=3">资源分配</a></li>
            </ul>
            <div class="triangle"></div>
        </div>
        <div class="tablecontainer">
            <h4>落选课程信息</h4><hr>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>课程类别</th>
                    <th>课程代码</th>
                    <th>课程名称</th>
                    <th>学分</th>
                    <th class="longstyle">上课时间</th>
                    <th>上课地点</th>
                    <th>上课教师</th>
                    <th>落选原因</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>学科或专业方向性课</td>
                    <td>130140020034</td>
                    <td>需求分析</td>
                    <td>3</td>
                    <td>星期一 第3-4节 1-16周 星期一 第3-4节 1-16周</td>
                    <td>海韵教学楼201</td>
                    <td>杨律青</td>
                    <td>抽签落选</td>
                </tr>
                </tbody>
            </table>
            <h4>选课退选记录</h4><hr>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>课程类别</th>
                    <th>课程代码</th>
                    <th>课程名称</th>
                    <th>学分</th>
                    <th class="longstyle">上课时间</th>
                    <th>上课地点</th>
                    <th>上课教师</th>
                    <th>选课时间</th>
                    <th>退选时间</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>学科或专业方向性课</td>
                    <td>130140020034</td>
                    <td>需求分析</td>
                    <td>3</td>
                    <td>星期一 第3-4节 1-16周 星期一 第3-4节 1-16周</td>
                    <td>海韵教学楼201</td>
                    <td>杨律青</td>
                    <td>2017-01-06 10:26</td>
                    <td>2017-01-06 10:26</td>
                </tr>
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
                        <button type="button" class="btn btn-default" >确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>
</div>
</body>
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

</script>
</html>